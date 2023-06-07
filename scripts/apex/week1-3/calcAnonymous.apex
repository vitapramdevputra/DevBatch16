Calculator calc = new Calculator();
date bd = date.newInstance(1990, 10, 9);
boolean lp = calc.leapYearCheck(bd);
system.debug('birthdate in leap year? ' + lp);

integer sum1 = calc.add(10, 15);
system.debug('sum1 is ' + sum1);

integer sum2 = calc.add(5,15,55);
system.debug('sum2 is ' + sum2);

calc.add(10.10, 15.15);

//same name methods with different parameters or datatype is called METHOD OVERLOADING

