@isTest
public class AccountsBatchTest {
    @isTest
   private static void testBatch1() {
        //prepare data
            //because we cannot access ANY records from the org when we are in test method
        list<account> listAcc = new list<account>();
        for (Integer i = 0; i < 955; i++) {
            account ac = new account();
            ac.Name = 'test acc ' + i;
            listAcc.add(ac);
        }
        insert listAcc;

        Test.startTest();
        Database.executeBatch(new accountsbatch(), 1000);
        Test.stopTest();

        //assert
        list<account> allAcc = [select id, description from account];
        for (account eachAcc : allAcc) {
            assert.isTrue(eachAcc.description.containsIgnoreCase('batch'));
        }
   }
}