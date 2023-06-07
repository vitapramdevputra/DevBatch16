integer sum = Calculator2.add(9,77);
system.debug(sum);

//static methods are accessible directly via classname
decimal sum2 = Calculator2.add(5.5, 77.5);
system.debug(sum2);


//non-static methods are accessible via instance
Calculator2 c = new Calculator2();
c.add(5,21);


Calculator2 c2 = new Calculator2();
c2.add(51,21);

