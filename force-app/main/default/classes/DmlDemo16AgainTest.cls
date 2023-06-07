@isTest
public class DmlDemo16AgainTest {
    //has full limits
    //150 DMLs, 100 soql, 10k records to updates, 10 sec cpu time
    @isTest
    private static void testDml5() {
        //1. prepare required data
        //create multiple acc records
        list<account> listAcc = new list<account>();

        for (Integer i = 0; i < 2555; i++) {
            account ac = new account();
            ac.Name = 'test acc ' + i;
            //DO NOT WRITE DML inside LOOPS. EVER. NOT Allowed. 
            //insert ac;

            listAcc.add(ac);
        }

        insert listAcc;//2555 record. Number of dmls? 1.

        //we are consuming some limits in preparing data. 
            //why we are preparing data. Because test method cannot read data from the org.
        
        //149 Dml
        //7445 data to update
        //8 sec cpu time available

        //we have less limits available.
        //to reset the limits we use 
        Test.startTest();
        //has full limits
            //150 DMLs, 100 soql, 10k records to updates, 10 sec cpu time
        DmlDemo16Again.dmlBulkUpdateRight1();
        Test.stopTest();

        //assert
        list<account> allAccounts = [select id,name, rating from account];
        for (account eachAcc : allAccounts) {
            assert.areEqual('Hot', eachAcc.rating);
        }

    }
}