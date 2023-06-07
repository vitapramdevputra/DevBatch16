public class AccountsBatch implements Database.batchable<sobject>, Database.stateful {
    
    integer countRecords = 0;
    //start method executes first
    public Database.QueryLocator start(Database.batchablecontext bc){
        system.debug('inside START method');
        return Database.getQueryLocator([select id, active__c, description from account]);
    }

    //how many times execute method will execute?
    public void execute(Database.BatchableContext bc, list<account> listAcc){
        system.debug('inside execute method');
        list<account> updateAccounts = new list<account>();
        for (account eachAcc : listAcc) {
            if (eachAcc.active__c != 'No') {
                eachAcc.Description += '...Updated via batch.😎';
                updateAccounts.add(eachAcc);
            }
        }
        update updateAccounts;
        countRecords += updateAccounts.size();
        system.debug('accounts updated in this chunk: ' + updateAccounts.size());
        system.debug('ALL accounts updated TILL NOW: ' + countRecords);
    }

    public void finish(Database.BatchableContext bc){
        system.debug('BATCH PROCESSED. FINISHED. DONE. COMPLETED. WE DID IT. ENJOY');
        system.debug('ALL accounts updated finished method: ' + countRecords);
    }
}


/*
 AccountsBatch must implement the method: System.Iterable<SObject> Database.Batchable<SObject>.start(Database.BatchableContext) (1:14)
 AccountsBatch must implement the method: void Database.Batchable<SObject>.finish(Database.BatchableContext) (1:14)                   
 AccountsBatch must implement the method: void Database.Batchable<SObject>.execute(Database.BatchableContext, List<SObject>) (1:14)  
*/