ExceptionDemo.Demo2(null, 5);//will this work? DMLException
ExceptionDemo.Demo2('simple', 0);//error. MathException

ExceptionDemo.Demo2(null, 0);


ExceptionDemo.Demo2('simple', 5);


ExceptionDemo.demo1('Hello hellow');//will this work?

ExceptionDemo.demo1(null);

account a1 = ExceptionDemo.demo3(null);
system.debug('** returned account a1: ' + a1);

system.debug('---------');

account a11 = ExceptionDemo.demo3('sForce');
system.debug('** returned account a11: ' + a11);