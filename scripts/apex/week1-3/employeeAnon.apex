Employee newEmp = new Employee();
newEmp.setName('Walter White');
newEmp.setSalary(20000);
string newEmpName = newEmp.getName();
decimal newEmpSalary = newEmp.getSalary();
system.debug(newEmpName + ' salary is ' + newEmpSalary);
//newEmp.name = 'WW';//private//NO work.


system.debug('--------');
Employee newEmp2 = new Employee();
newEmp2.setName('Jesse Pink');
newEmp2.setSalary(60000);
string newEmpName2 = newEmp2.getName();
decimal newEmpSalary2 = newEmp2.getSalary();
system.debug(newEmpName2 + ' salary is ' + newEmpSalary2);