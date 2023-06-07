MethodsDemo2 m3 = new MethodsDemo2();
boolean b1 = m3.nameContainsA('Vicky');
system.debug('Vicky contains a? ' + b1);

system.debug('Christina contains a? ' + m3.nameContainsA('Christina'));

boolean b2 = m3.nameContainsA('BARCELONA');
system.debug('BARCELONA contains a? ' + b2);




MethodsDemo2 m2 = new MethodsDemo2();
string returnMsg = m2.returnMessage('Jenny');
system.debug(returnMsg);

//m2.returnMessage('Forrest'); //this is valid. We are NOT storing the return value.
system.debug(m2.returnMessage('Forrest'));
//a = b+c
//system.debug(a)
//system.debug(b+c)


MethodsDemo2 m3 = new MethodsDemo2();
integer i = m3.returnMessage2('April');
system.debug('i is ' + i);