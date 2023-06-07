public class DepartmentTriggerHandler {
    
    @future
    public static void createDefaultEmpFuture(set<id> depIds) {
        //create employees for all depIds.
        List<Employee__c> newEmployees = new List<Employee__c>();

        for (Id eachId : depIds) {
            Employee__c e = new Employee__c(First_Name__c = 'Shapshik', Department__c = eachId);
            newEmployees.add(e);
        }
        insert newEmployees;
    }
}