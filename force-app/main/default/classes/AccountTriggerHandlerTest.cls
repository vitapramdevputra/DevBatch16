@isTest
public class AccountTriggerHandlerTest {
    @istest
    private static void testUpdateDesc1() {
        //INSERT
        List<account> listAcc = new list<account>{
            new account(name = 'May', phone = '7775556666', Industry = 'Energy'),
            new account(name = 'June', Active__c = 'Yes'),
            new account(name = 'Sunday', Industry = 'Energy', Active__c = 'Yes')
        };
        insert listAcc;
            //this will call trigger, and from trigger we call handler.
                //so JUST by inserting record, we can TEST our trigger handler also.

        //so, for two account records we should have description updated
        //assert that description has 'Enjoy'
        List<account> getAccounts = [select id, name, active__c, description from account];
        for (account eachAcc : getAccounts) {
            if (eachAcc.active__c == 'Yes') {
                assert.areEqual('Account is now active. Enjoy Enjoy buddy!', eachAcc.description);
                assert.isTrue(eachAcc.description.contains('Enjoy'));
            } else {
                assert.isNull(eachAcc.description);
            }
        }
    }

    @istest
    private static void testUpdateDesc2() {
        //INSERT with active as No or Null
        List<account> listAcc = new list<account>{
            new account(name = 'May', phone = '7775556666', Industry = 'Energy'),
            new account(name = 'June'),
            new account(name = 'Sunday', Industry = 'Energy', Active__c = 'No')
        };
        insert listAcc;


        //Update, active field to Yes
        for (Account a : listAcc) {
            a.Active__c = 'Yes';
        }
        update listAcc;

        //so, for all account records we should have description updated
        //assert that description has 'Enjoy'
        List<account> getAccounts = [select id, name, active__c, description from account];
        for (account eachAcc : getAccounts) {
            if (eachAcc.active__c == 'Yes') {
                assert.areEqual('Account is now active. Enjoy Enjoy buddy!', eachAcc.description);
                assert.isTrue(eachAcc.description.contains('Enjoy'));
            }
        }
    }

    @isTest
    public static void testVip1() {
        //prepare data.
            //account and contacts
        List<account> listAcc = new list<account>{
            new account(name = 'May', phone = '7775556666', Industry = 'Energy'),
            new account(name = 'June'),
            new account(name = 'Sunday', Industry = 'Energy')
        };
        insert listAcc;

        List<contact> listContacts = new list<contact>();
        for (Integer i = 0; i < 300; i++) {
            contact c = new contact(lastname = 'test con ' + i);
            if (i < 100) {
                //to get ID of may
                Account acc0 = listAcc[0];
                c.accountid = acc0.Id;
            } else if(i < 200){
                 c.accountid = listAcc[1].Id;
            } else {
                 c.accountid = listAcc[2].Id;
            }
           listContacts.add(c);
        }
        insert listContacts;

        //update VIP field of all accounts
        Test.startTest();
         //Update, active field to Yes
        for (Account a : listAcc) {
            a.vip__c = true;
        }
        update listAcc;
        Test.stopTest();

        //assert that VIP field is updated for all its contacts
            //remember: to assert, query first.
        list<contact> allContacts = [select id, vip__c from contact];
        assert.areEqual(300, allcontacts.size());
        for (contact c : allContacts) {
            assert.areEqual(true, c.vip__c);
        }
    }

    @isTest
    private static void testDelete() {
        //prepare data.
            //account and contacts
        List<account> listAcc = new list<account>{
            new account(name = 'May', phone = '7775556666', Industry = 'Energy'),
            new account(name = 'June', Active__c = 'Yes'),
            new account(name = 'Sunday', Industry = 'Energy', Active__c = 'Yes')
        };
        insert listAcc;
        try {
            delete listAcc;
        } catch (DmlException de) {
            assert.istrue(de.getMessage().contains('Cannot delete'));
        }
        
    }
}