StringMethodsDemo sm = new StringMethodsDemo();
sm.stringMethod5();
sm.stringMethod4();
sm.stringMethod3();
sm.stringMethod2();
sm.stringMethod1();



Decimal d = 55.334;//55.334+5 = 60.334

string s = string.valueOf(d); //'55.334' + 5

// '+' -> when we use + with string it will concate.
//        when we use + with integer, decimal, long, double it will add

system.debug(d+5);//output: 60.334
system.debug(s+5);//output: 55.3345