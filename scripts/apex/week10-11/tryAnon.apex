//NullPointerException
    string s = null;
    s.toLowerCase();

//ListException
    list<integer> l = new list<integer>{0,5,45};
    system.debug('l5 => ' + l[5]);

//QueryException
    account a = [select id, name from account];
    system.debug(a);
    //System.QueryException: List has no rows for assignment to SObject

//limitException
    for(integer i=0; i < 200; i++){
        insert new contact(lastname = 'abc');
    }

//DMLException
    account a1 = new account();
    insert a1;
    system.debug('dml done');