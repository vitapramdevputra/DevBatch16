list<string> fields = new list<string>{'name','phone', 'email'};
SoqlDemo4.sObjectDynamicSoql1('contact', fields);


list<string> fields = new list<string>{'name','phone', 'website'};
SoqlDemo4.sObjectDynamicSoql1('account', fields);

SoqlDemo4.empDynamicSOQL(' id, first_name__c');
system.debug('----');
SoqlDemo4.empDynamicSOQL(' id, first_name__c, last_name__c, salary__c, country__c');


SoqlDemo4.accDynamicSoql1('id, name ');
system.debug('----');
SoqlDemo4.accDynamicSoql1('id, name, phone, website, active__c ');

SoqlDemo4.aggregateQuery();
SoqlDemo3.childToParentQuery();


SoqlDemo3.parentToChildQuery();

//1
account a = new account();
a.Name = 'Maverik';
update a;


//2 create related contact record 
account ac = [select id, name from account];

contact c = new contact();
c.LastName = 5454;
c.accountid = ac.Name;
insert c;


//3 want to get firstname of all contacts of all accounts.
list<account> listC = [select id, name, (select id, name from contact) from account]
for (contact c : listC) {
    system.debug(c.firstName);
}

