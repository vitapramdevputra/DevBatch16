Bicycle b1 = new Bicycle(2, 10);
b1.speedUp();
b1.speedUp();
b1.speedUp();

b1.changeGear(3);

b1.printState();



//cannot access static via instance(non-static)
//b1.getRating('Carbon');//NOT WORK.

system.debug(Bicycle.getRating('Iron'));//valid?