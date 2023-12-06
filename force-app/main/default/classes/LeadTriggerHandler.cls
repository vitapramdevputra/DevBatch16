public with sharing class LeadTriggerHandler {
   public static void populateOriginalLeadId(List<Lead> leadTriggerNew) {
    // Logic from PopulateOriginalLeadId trigger
        Map<Id, Id> originalLeadIdMap = new Map<Id, Id>();
        Set<Id> updatedLeadIds = new Set<Id>();
        for (Lead lead : leadTriggerNew) {
            updatedLeadIds.add(lead.Id);
        }

        List<Lead> originalLeads = [SELECT Id, Original_Lead_ID__c FROM Lead WHERE Id IN :updatedLeadIds];

        for (Lead lead : leadTriggerNew) {
            for (Lead originalLead : originalLeads) {
                if (originalLead.Id == lead.Id) {
                    Id originalLeadId = (originalLead.Original_Lead_ID__c != null) ? originalLead.Original_Lead_ID__c : lead.Id;
                    originalLeadIdMap.put(lead.Id, originalLeadId);
                    break;
                }
            }
        }

        for (Lead lead : leadTriggerNew) {
            if (originalLeadIdMap.containsKey(lead.Id)) {
                lead.Original_Lead_ID__c = originalLeadIdMap.get(lead.Id);
            }
        }
       

        List<CampaignMember> campaignMembers = [
                SELECT Campaign.Name, LeadId
                FROM CampaignMember
                WHERE LeadId in :leadTriggerNew AND CampaignId != null
                LIMIT 1
            ];
        Map<id, string> mapLeadIdCampaignName= new map<id, String>();
        for (CampaignMember eachCMB : campaignMembers) {
            mapLeadIdCampaignName.put(eachCMB.LeadId, eachCMB.Campaign.Name);
        }

        // Existing logic from LeadDuplicateTrigger
        for (Lead lead : leadTriggerNew) {
            

            if (!mapLeadIdCampaignName.containsKey(lead.Id)) {
                lead.Related_Campaigns__c = mapLeadIdCampaignName.get(lead.Id);
            }
        }
   }

   public static list<lead> createNewChildLead(List<Lead> leadTriggerNew, List<Lead> leadTriggerOld) {
        List<Lead> leadsToDuplicate = new List<Lead>();
        // Loop through the leads to find the ones with a change in Lead Source Activity
        for (Integer i = 0; i < leadTriggerNew.size(); i++) {
            Lead newLead = leadTriggerNew[i];
            Lead oldLead = leadTriggerOld[i];
           
            if (newLead.Lead_Source_Activity__c != oldLead.Lead_Source_Activity__c) {
                // Create a duplicate lead and copy all the fields from the current lead
                Lead duplicateLead = newLead.clone(false, true, false, false);
                // Set the desired fields for the new duplicate lead
                duplicateLead.Status = 'New Lead';
                duplicateLead.Life_Cycle_Stage__c = 'MQL';
               
                leadsToDuplicate.add(duplicateLead);
            }
        }
       
        // Insert the duplicate leads if there are any
        if (!leadsToDuplicate.isEmpty()) {
            insert leadsToDuplicate;
        }
        return leadsToDuplicate;
   }

   public static void linkOrCreateCampaign(List<lead> leadsToDuplicate, list<lead> leadTriggerNew) {
    // Existing logic from LeadDuplicateTrigger (same as before)
        List<String> campaignNamesToMatch = new List<String>();
        List<CampaignMember> campaignMembersToLink = new List<CampaignMember>();
        List<Campaign> campaignsToInsert = new List<Campaign>();
       
        for (Lead newLead : leadTriggerNew) {
            // Check if the Lead Source Activity matches an existing Campaign Name
                String campaignNameToMatch = newLead.Lead_Source_Activity__c;
                campaignNamesToMatch.add(campaignNameToMatch);
        }
       
        // Query the campaigns matching the campaign names of the duplicate leads
        List<Campaign> existingCampaigns = [SELECT Id, Name FROM Campaign WHERE Name IN :campaignNamesToMatch];
        Map<String, Id> campaignNameToIdMap = new Map<String, Id>();
        for (Campaign campaign : existingCampaigns) {
            campaignNameToIdMap.put(campaign.Name, campaign.Id);
        }
       
        // Link the duplicate leads to the existing campaigns or create new campaigns and link the leads
        for (Lead duplicateLead : leadsToDuplicate) {
            String leadSourceActivity = duplicateLead.Lead_Source_Activity__c;
            if (campaignNameToIdMap.containsKey(leadSourceActivity)) {
                campaignMembersToLink.add(new CampaignMember(
                    CampaignId = campaignNameToIdMap.get(leadSourceActivity),
                    LeadId = duplicateLead.Id,
                    Status = 'Sent' // Set the default member status to 'Sent'
                ));
            } else {
                // If no matching campaign is found, create a new campaign and link the lead to it
                Campaign newCampaign = new Campaign(Name = leadSourceActivity, IsActive = true);
                campaignsToInsert.add(newCampaign);
               
                // Insert the new campaign and set the CampaignId for the campaign member
                insert newCampaign;
                campaignMembersToLink.add(new CampaignMember(
                    CampaignId = newCampaign.Id, // Set the CampaignId for the new campaign member
                    LeadId = duplicateLead.Id,
                    Status = 'Sent' // Set the default member status to 'Sent'
                ));
            }
        }
        if (campaignMembersToLink.isEmpty()) {
            insert campaignMembersToLink;
        }
   }


   public static void updateLifeCycleStageHubspot(list<lead> leadTriggerNew, list<lead> leadTriggerOld, Map<id, lead> leadTriggerNewMap,  Map<id, lead> leadTriggerOldMap) {
        // Additional logic from UpdateParentLifeCycleStageHubSpot trigger

        //inserting new LEAD (parent)
            //default Life_Cycle_Stage_HubSpot__c = MQL [already happening, no need to write logic]
        //inserting new LEAD (child)
            //default Life_Cycle_Stage_HubSpot__c = MQL [already happening, no need to write logic]

        //when updating Life_Cycle_Stage__c IN parent  
                //update PARENT's Life_Cycle_Stage_HubSpot__c => HIGHEST of parent and child
        
         //when updating Life_Cycle_Stage__c  In CHILD -> SQL
                //update PARENT's Life_Cycle_Stage_HubSpot__c => HIGHEST of parent and child        
        
        Map<String, Lead> parentLeadsToUpdate = new Map<String, Lead>();
        set<id> parentLeadId = new set<id>();

        for (Lead newlead : leadTriggerNew) {
            if (newlead.Life_Cycle_Stage__c != leadTriggerOldMap.get(newLead.id).Life_Cycle_Stage__c) {
                parentLeadId.add(Original_Lead_ID__c);
            }
        }

        if (!parentLeadId.isEmpty()) {
            List<String> lifecycleValuesToUpdate = new List<String>{'Partner', 'Customer', 'SQO', 'SQL', 'SAL', 'MQL', 'Disqualified'};
            Map<String, Integer> leadIdToLifecyclePriorityMap = new Map<String, Integer>();

            for (Lead childLead : [SELECT Id, Life_Cycle_Stage__c, Original_Lead_ID__c FROM Lead WHERE Original_Lead_ID__c IN :parentLeadId]) {
               

                    Integer priority = lifecycleValuesToUpdate.indexOf(childLead.Life_Cycle_Stage__c) + 1;
                    if (!leadIdToLifecyclePriorityMap.containsKey(childLead.Original_Lead_ID__c) || 
                        priority < leadIdToLifecyclePriorityMap.get(childLead.Original_Lead_ID__c)) {

                            leadIdToLifecyclePriorityMap.put(childLead.Original_Lead_ID__c, priority);

                    }
            }

            List<lead> listParentLeads =  [SELECT Id, Life_Cycle_Stage__c, Original_Lead_ID__c FROM Lead WHERE Id IN :parentLeadId];
            for (Lead parentLead :listParentLeads) {
                Integer highestPriority = leadIdToLifecyclePriorityMap.get(parentLead.Id);
                if (highestPriority != null) {
                    parentLead.Life_Cycle_Stage_HubSpot__c = lifecycleValuesToUpdate[highestPriority - 1];
                }
            }
            update listParentLeads;
        }
   }
}