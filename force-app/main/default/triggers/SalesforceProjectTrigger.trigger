trigger SalesforceProjectTrigger on Salesforce_Project__c (before insert, after insert, before update, after update) {
    if (Trigger.isAfter && Trigger.isInsert) {
        SPTriggerHandler.updateDescFuture(Trigger.newMap.keySet());
        //call handler method here to create new ticket.
        SPTriggerHandler.createDefaultTicket(Trigger.New);
    }

    if (Trigger.isBefore && Trigger.isUpdate) {
        //validate
        //SPTriggerHandler.validate1(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
    if (Trigger.isAfter && Trigger.isUpdate) {
        SPTriggerHandler.spCompleted(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
}