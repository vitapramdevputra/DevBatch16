public class DmlDemo16 {
    public static void dmlInsert1() {
        //create new account record

        //1. create new instance of account(sObject)
        account acc = new account();

        //2. set field names
        acc.Name = 'Salesforce';

        //3. insert statement
        insert acc; //will CREATE  record in ORG.
        system.debug(acc);
    }

    //create new record for department custom object
    public static void dmlInsert2() {
        //create new instance.
        Department__c d = new Department__c();

        //set fields
        d.Name__c = 'Human Resource';
        d.Short_Code__c = 'HR';

        //insert statement
        insert d;
    }

    public static void dmlUpdate1() {
        account acc = new account();
        acc.name = 'Softinnovas';
        system.debug('before insert DML: ' + acc);
        insert acc;
        system.debug('after dml : ' + acc);

        //ID is mandatory if we want to update record
        acc.name = 'Softinnovas Inc.';
        update acc;//update statement.
    }

    //update existing record from the org.
        //we must have atleast one account record for this to work
    public static void dmlUpdate2() {
        //soql
        account acc = [select id, name from account order by CreatedDate desc limit 1];

        //update
        acc.Name = 'Salesforce Inc.';

        update acc;
    }
    //get one employee of USA, and update country to Canada
    public static void dmlUpdate3() {
        Employee__c emp = [select id, country__c, first_name__c from employee__c where country__c = 'USA' limit 1];

        //update country field
        emp.Country__c = 'Canada';
        emp.first_name__c = 'Alexander';
        emp.last_name__c = 'The Great'; //yes. we can update
        system.debug('last name is ' + emp.Last_Name__c);//we cannot get if not in query

        update emp;
    }

    //DOn't Try. Danger Ahead. Wrong way. 
    public static void dmlInsertWRONG() {
        //creating contact and relating ONE account
        contact c = new contact();
        c.LastName = 'wrong way';
        //hard coded ID. NOT TO DO. Illegal. Not professional.
        c.accountid = '001Dp000002QlLVIA0';//we should NEVER do this.

        insert c;
    }
    
    //to establish relation between two records, we MUST provide parent record ID in child field name.
    public static void dmlInsert4() {
        //req:create contact record for latest created account record

        account acc = [select id, name from account order by createddate desc limit 1];

        string accountname = acc.name;
        id accountid = acc.id;

        //create contact
        contact c = new contact();
        c.LastName = 'Biden';
        c.accountid = accountid;
        insert c;
    }


    //Create one employee for latest created department
        //assume I have one department record.
        //I call this method.
        //what is the outcome?
            //it will create one employee record for that department.
    public static void employeeDepartment() {
        //write SOQL to fetch latest created department (only 1)
        department__c d =[select id, name__c, createddate from department__c order by createddate desc limit 1];

        //create employee for d

        //create new instance for employee
        Employee__c emp1 = new Employee__c();
        //set field names
        emp1.First_Name__c = 'Don';
        emp1.Last_Name__c = 'Carolina';
        //set date
        emp1.JoinDate__c = date.newInstance(2023, 03, 01);
        //emp1.isHuman__c = true;
        emp1.Salary__c = 500000;
        emp1.Country__c = 'Mexico';
        //relationship field
        //emp1.Department__c = 'a02Dp000001dk2zIAA';
        emp1.Department__c = d.Id;

        insert emp1;
    }

    
}