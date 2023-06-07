carrr tesla = new carrr('ABC10003', 'Tesla Model x', 'silver', 2020, 65000);
string teslaName = tesla.name;
string teslaColor = tesla.color;
system.debug(teslaName + ' color is ' + teslaColor);
system.debug('---------');
tesla.name = 'Tesla model Y';
tesla.color = 'gray';
tesla.details();
