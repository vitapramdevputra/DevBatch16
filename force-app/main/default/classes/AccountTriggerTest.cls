@isTest
public class AccountTriggerTest {
    @isTest
   private static void testAccTrigger1() {
        //INSERT
        List<account> listAcc = new list<account>{
            new account(name = 'May', phone = '7775556666', Industry = 'Energy'),
            new account(name = 'June'),
            new account(name = 'Sunday', Industry = 'Energy')
        };
        insert listAcc;
            //when we insert in test method, it will call trigger.
                //inside the trigger, we are calling handler method.
                    //so it will also call handler method.

        list<account> getAccounts = [select id, name from account];
        assert.areEqual(3, getAccounts.size());

        //UPDATE
        for (account a : listAcc) {
            a.description = 'acc updated';
        }
        update listAcc;
        
        list<account> getAccounts2 = [select id, name, description from account];
        assert.areEqual(3, getAccounts2.size());

        //DELETE
        delete listAcc[2];
        list<account> getAccounts3 = [select id, name, description from account];
        assert.areEqual(2, getAccounts3.size());

        //UNDELETE
        undelete listAcc[2];
        list<account> getAccounts4 = [select id, name, description from account];
        assert.areEqual(3, getAccounts4.size());

   }
}