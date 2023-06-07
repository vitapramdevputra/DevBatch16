trigger DepartmentTrigger on Department__c (before insert, after insert) {
    if(trigger.isAfter && trigger.isInsert){
        DepartmentTriggerHandler.createDefaultEmpFuture(trigger.newMap.keyset());
            //Trigger
                // department handler future method
                    //insert employee
                        //Employee trigger execution
                            //calling another future method
    }
}