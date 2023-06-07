public class SoqlDemo4 {
    public static void aggregateQuery() {
        //group by query doesn't return sObject or list<sObject>
            //it returs List<aggregateResult>
            //first aggregate is count --expr0
            //second aggregate is sum --expr1
        List<aggregateResult> results = [select country__c, count(id), sum(salary__c) from employee__c group by country__c];
        //when we use aggregate functions in soql (count, sum, avg, max etc), we get the result in aggregateresult.

        for (aggregateResult ar : results) {
            system.debug(ar);
            system.debug('country name is ' + ar.get('country__c'));
            system.debug('number of record: ' + ar.get('expr0'));//expression0
            system.debug('sum of salary: ' + ar.get('expr1'));//expression1
        }
    }

    public static void queryExample22() {
        account acc = [select id, name, website from account limit 1];
        system.debug(acc);


        //list<integer> listName;
        //listName.get(3)
        //listName[3]
    }

    //prepare the query as a string
        //pass comma separated field names
    public static void accDynamicSoql1(string fieldNames) {

        string query = 'select ';
        query += fieldNames;
        query += ' from account';

        system.debug('FINAL QUERY IS ::: ' + query);
        list<account> listAcc = database.query(query);
        for (account acc : listAcc) {
            system.debug(acc);
        }
    }

    public static void empSOQL() {
        //fields are hardcoded
        list<employee__c> listEmp = [select id, first_name__c, last_name__c from employee__c];
    }

    public static void empDynamicSOQL(string empFields) {
        string q = 'select ';
        q += empFields;
        q += ' from employee__c';
        
        system.debug('final query is ==> ' + q);

        list<employee__c> listEmp = database.query(q);
        for (employee__c eachEmp : listEmp) {
            system.debug(' employee ' + eachEmp);
        }
    }



     public static void sObjectDynamicSoql1(string sObjectName, list<string> fieldNames) {

        string query = 'select ';
        query += fieldNames.toString().removeStart('(').removeEnd(')');
        query += ' from ' + sObjectName;

        system.debug('FINAL QUERY IS ::: ' + query);
        list<sObject> listRecords = database.query(query);
        for (sObject sobj : listRecords) {
            system.debug(sobj);
            for (string  eachField : fieldNames) {
                system.debug(eachField + ' value is : ' + sobj.get(eachField));
            }
            system.debug('-------');
        }
    }
}
