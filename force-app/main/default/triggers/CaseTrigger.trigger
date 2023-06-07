trigger CaseTrigger on Case (before insert) {
    system.debug('before insert case trigger');
    //number of recrods?
    //static variable value STAYs throughtout the transaction.
        //for first execution. CaseTriggerHandler.countRecords -> 200
        //for secnd execution. CaseTriggerHandler.countRecords -> 205
    CaseTriggerHandler.countRecords += Trigger.size;
    //Trigger.size == Trigger.new.size();
    //Trigger.size == Trigger.old.size();
    system.debug('Total number of records processed: ' + CaseTriggerHandler.countRecords);

    CaseTriggerHandler.countTrigger++;
    system.debug('Total number trigger executed: ' + CaseTriggerHandler.countTrigger);
}