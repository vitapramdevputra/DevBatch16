CaRRR bmw = new carrr();
bmw.details();

carrr bmw2 = new carrr(2020);
bmw2.details();


carrr bmw3 = new carrr('ABC10001', 'BMW X3', 'Black', 2021, 40000.00);


carrr ford = new carrr('ABC10002', 'Ford Mustang', 'Red', 2012, 30000.00);



carrr necar = new carrr('Ford');





carrr tesla = new carrr('ABC10003', 'Tesla Model x', 'silver', 2020, 65000);
string teslaName = tesla.name;//this is private
string teslaColor = tesla.color;
system.debug(teslaName + ' color is ' + teslaColor);

// decimal teslaPrice = tesla.price;//i t will give error, reason? PRIVATE
// //no brackets variables/properties

tesla.details();//brackets means methods.


CarrrProgram cp = new CarrrProgram();