public with sharing class CreateAccountsController {
    @AuraEnabled
    public static Account create(String name, Date expiry, Integer employees, Decimal revenue){
        Account acc = new Account();
        acc.Name = name;
        if(expiry != null){
            acc.SLAExpirationDate__c = expiry;
        }
        if(employees != null){
            acc.NumberOfEmployees = employees;
        }
        if(revenue != null){
            acc.AnnualRevenue = revenue;
        }
        INSERT acc;
        return acc;
    }
}