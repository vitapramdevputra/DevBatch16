public class EmployeeTriggerHandler {
    //why handler?
        //to create methods and call it from trigger.
        //to have more clean trigger
        //easy to maintain
        //reuse functionality

    public static void updateJoinDate(List<Employee__c> empTriggerNew) {
        for (Employee__c newEmp : empTriggerNew) {
            if (newEmp.joinDate__c == null) {
                newEmp.JoinDate__c = date.today();
            }
        }
    }

    public static void validateJoinDate(List<employee__c> empTriggerNew) {
        for (Employee__c newEmp : empTriggerNew) {
            //check if joindate is in future
            if(newEmp.JoinDate__c > date.today()){
                newEmp.joinDate__c.addError('Join date cannot be in Future. Alright?');
            }
        }
    }
    public static void synchMethod1(List<employee__c> empTriggerNew) {
        system.debug('inside synchMethod');
        system.debug('employees ' + empTriggerNew);
    }

    @future
    public static void futureMethod1(set<id> empIds) {
        system.debug('inside future method');
        system.debug('employee ids ' + empIds);
    }
}