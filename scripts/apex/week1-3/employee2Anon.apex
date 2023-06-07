Employee2.minSalary = 6500;

Employee2 e = new Employee2();
e.name = 'Johnn';
e.salary = 5100;
system.debug('John salary above min? ' + e.isSalaryAboveMin());


//normal world
Employee2 e2 = new Employee2();
e2.name = 'Jane';
e2.salary = 7100;

system.debug('Jane salary above min? ' + e2.isSalaryAboveMin());

system.debug('-----');
Employee2.minSalary = 4500;
system.debug('John salary above min? ' + e.isSalaryAboveMin());

system.debug('Jane salary above min? ' + e2.isSalaryAboveMin());