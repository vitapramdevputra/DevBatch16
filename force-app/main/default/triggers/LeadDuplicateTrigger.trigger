trigger LeadDuplicateTrigger on Lead (before update, after insert, before insert, after update) {
    if (Trigger.isBefore && (Trigger.isUpdate || Trigger.isInsert)) {
        LeadTriggerHandler.populateOriginalLeadId(trigger.new);
    }

    if (Trigger.isBefore && Trigger.isUpdate) {

        List<lead> leadsToDuplicate = LeadTriggerHandler.createNewChildLead(trigger.new, trigger.old);
        
        if (!leadsToDuplicate.isEmpty()) {
            LeadTriggerHandler.linkOrCreateCampaign(leadsToDuplicate, trigger.new);
        }
        
    }

    if (Trigger.isAfter && Trigger.isInsert) {
        // Existing logic from LeadDuplicateTrigger (same as before)
        Set<String> leadSourceActivities = new Set<String>();
        for (Lead newLead : Trigger.new) {
            leadSourceActivities.add(newLead.Lead_Source_Activity__c);
        }
       
        Map<String, Campaign> campaignMap = new Map<String, Campaign>();
        for (Campaign campaign : [SELECT Id, Name FROM Campaign WHERE Name IN :leadSourceActivities]) {
            campaignMap.put(campaign.Name, campaign);
        }
       
        List<CampaignMember> campaignMembersToAdd = new List<CampaignMember>();
       
        for (Lead newLead : Trigger.new) {
            String campaignName = newLead.Lead_Source_Activity__c;
            if (campaignMap.containsKey(campaignName)) {
                campaignMembersToAdd.add(new CampaignMember(
                    CampaignId = campaignMap.get(campaignName).Id,
                    LeadId = newLead.Id,
                    Status = 'Sent' // Set the appropriate status here
                ));
            } else {
                Campaign newCampaign = new Campaign(Name = campaignName);
                insert newCampaign;
               
                campaignMap.put(campaignName, newCampaign);
                campaignMembersToAdd.add(new CampaignMember(
                    CampaignId = newCampaign.Id,
                    LeadId = newLead.Id,
                    Status = 'Sent' // Set the appropriate status here
                ));
            }
        }
       
        insert campaignMembersToAdd;
    }

    if (Trigger.isBefore) {
        for (Lead newlead : trigger.new) {
            if (Trigger.isInsert) {
                 newLead.Life_Cycle_Stage_HubSpot__c = newlead.Life_Cycle_Stage__c;
            }
            if (Trigger.isUpdate) {
                if (newlead.Life_Cycle_Stage__c != lTrigger.OldMap.get(newLead.id).Life_Cycle_Stage__c) {
                    newLead.Life_Cycle_Stage_HubSpot__c = newlead.Life_Cycle_Stage__c;
                }
            }
         
        } 
    }

   
    if (Trigger.isAfter && Trigger.isUpdate) {
        LeadTriggerHandler.updateLifeCycleStageHubspot(trigger.New, trigger.Old, trigger.NewMap, trigger.OldMap);
    }
}