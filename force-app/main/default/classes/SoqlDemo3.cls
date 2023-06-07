public class SoqlDemo3 {
    public static void childToParentQuery() {
        //contact is child
        //account is parent
        string filter = 'energy';

        list<contact> listCon = [select id, name, account.name, account.industry from contact where account.industry = :filter];

        for (contact eachContact : listCon) {
            system.debug('contact name is ' + eachContact.Name);
            system.debug('ac name is ' + eachContact.account.Name + ' acc industry is ' + eachContact.account.Industry);
            system.debug('---------');
        }
    }

    //Opportunities to Accounts
    public static void childToParentSOQL1() {
        list<Opportunity> listOPP = [select id, name, amount, closedate, account.annualrevenue, account.name from opportunity];
        //print opp name, opp amount, acc name, acc revenue

        for (Opportunity eachOpp : listOPP) {
            system.debug('opp name and amount is ' + eachOpp.Name + ' - ' + eachOpp.Amount);
            system.debug('acc name and its revenue is ' + eachOpp.account.Name + ' - ' + eachOpp.Account.AnnualRevenue);
            system.debug('-----');
        }
    }

    //Department name
    //Employee firstname, lastname, country, salary
    //Department wise total salary.
    //overall total salary.
    public static void parentToChildQuery() {
        list<department__c> listDept = [select id, name, name__c, (select first_name__c, country__c, salary__c from Employees__r) from department__c];

        Decimal totalSalary = 0;
        for (Department__c eachDept : listDept) {
            system.debug('dept name is ' +eachDept.Name__c);
            //ONE department have many employees. get this?
            List<Employee__c> listEmp = eachDept.Employees__r;
            
            Decimal deptSalary = 0;

            for (employee__c eachEmp : listEmp) {
                system.debug('---emp name is ' + eachEmp.First_Name__c );
                system.debug('---emp salary and country is ' + eachEmp.Salary__c + ' - ' + eachEmp.Country__c);
                if (eachEmp.salary__c != null) {
                    deptSalary += eachEmp.Salary__c;
                    totalSalary += eachEmp.Salary__c;
                }
            }
            system.debug('*** 🥁🥁  total department salary is ==> ' + deptSalary + '🥁🥁 ');
        }
        system.debug('TOTAL SALARY is ' + totalSalary);
    }
}