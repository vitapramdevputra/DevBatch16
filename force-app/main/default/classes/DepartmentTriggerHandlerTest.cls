@isTest
public class DepartmentTriggerHandlerTest {
   @isTest
   private static void testFuture1() {
        list<Department__c> listDep = new list<department__c>{
            new Department__c(Name__c = 'Future'),
            new Department__c(Name__c = 'Present'),
            new Department__c(Name__c = 'Past')
        };

        Test.startTest();
        insert listDep;
        Test.stopTest(); 
        //To ensure that any asynch process has completed the execution we write Test.stopTest()

        //assert
        List<Employee__c> allEmps = [select id, first_name__c from employee__c];
        assert.areEqual(3, allEmps.size());
   }
}