public with sharing class RecordFetcherController {
    //auraEnabled to access method in LWC.
    //cacheable=true to access method from wire method
    @AuraEnabled(cacheable=true)
    public static Account getAccountDetail(Id accId) {
        return [select id, name, accountnumber, phone from account where id = :accId];
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountDetails(String accType){
        return [SELECT 
                Id, Name, AccountNumber, Phone, AnnualRevenue, Type 
                FROM Account 
                WHERE Type = :accType];
    }

    @AuraEnabled
    public static List<string> getAccountTypePicklistValue() {
        Schema.DescribeFieldResult fieldResult = Account.Type.getDescribe();
        List<Schema.PicklistEntry> typeList = fieldResult.getPicklistValues();
        List<string> values = new list<string>();
        for (Schema.PicklistEntry eachEntry : typeList) {
            if (eachEntry.isActive()) {
                values.add(eachEntry.getValue());
            }
        }
        return values;
    }
}