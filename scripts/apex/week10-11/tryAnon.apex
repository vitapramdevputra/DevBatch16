//NullPointerException
    string s = null;
    s.toLowerCase();

//ListException
    list<integer> l = new list<integer>{0,5,45};
    system.debug('l5 => ' + l[5]);

//QueryException
    account a = [select id, name from account];
    system.debug(a);
    account a2 = [select id, name from account where name='vitap'];
    system.debug(a2)
    //System.QueryException: List has no rows for assignment to SObject

//limitException
    for(integer i=0; i < 200; i++){
        insert new contact(lastname = 'abc');
    }

    integer j = 0;
    while (j < 5){
        system.debug(j);
    }

//DMLException
    account a1 = new account();
    a1.name = null;
    insert a1;
    system.debug('dml done');