trigger EmployeeTrigger on Employee__c (before insert, after insert, before update, after update) {

    if (Trigger.isBefore) {
        //validate the data, DO NOT ALLOW user to enter FUTURE joining date.
        //call handler method to validate.
        EmployeeTriggerHandler.validateJoinDate(Trigger.New);

        //call handler here.
        EmployeeTriggerHandler.updateJoinDate(trigger.new);
    }

    if (Trigger.isAfter && Trigger.isInsert) {
        //synchronous
        system.debug('calling synch method NOW...');
        EmployeeTriggerHandler.synchMethod1(Trigger.new);
        system.debug('JUST called synch method');

        system.debug('----');
        system.debug('calling future method NOW...');
        //EmployeeTriggerHandler.futureMethod1(Trigger.newMap.keySet());
        system.debug('JUST called future method');
    }
}