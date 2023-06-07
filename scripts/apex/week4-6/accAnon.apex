

list<account> listAcc = new list<account>();
for (Integer i = 0; i < 1; i++) {
    account ac = new account();
    ac.Name = 'test trigger acc ' + i;
    listAcc.add(ac);
}

insert listAcc;


List<account> accounts = [select id, name from account];
for (account eachAcc : accounts) {
    system.debug('each account name: ' + eachAcc.Name);
    system.debug('each account ID: ' + eachAcc.Id);
}

List<account> listAcc = [select id, name from account];
for (account  eachAcc : listAcc) {
    system.debug(eachAcc.Id);
    system.debug(eachAcc.Name);
}


Map<integer, string> map1 = new map<integer, string>{1=>'one', 2=> 'two'};
set<integer> allKeys = map1.keySet();
system.debug('all keys => ' + allKeys);




list<account> a = [select id from account];
