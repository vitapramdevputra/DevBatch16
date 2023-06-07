public  class DmlDemo16Again {
    public static void dmlBulkUpdateRight1() {
        
        list<account> allAccounts = [select id, name from account where createddate = TODAY];

        for (account eachAcc : allAccounts) {
            eachAcc.Rating = 'Hot';
            //update eachacc; this is WRONG>
        }

        update allAccounts;

    }

}