string str1 = 'Humans';
system.debug(str1);

string str2;//declared -> null
//str2.toLowerCase();//this will give error.


string str3 = str2+str1;
system.debug(str3);
integer len = str3.length(); //built-in method.
system.debug(len);

integer i = 9;

string str4 = str1 + i;
system.debug(str4);

boolean e1 = str4.equals(i);
system.debug(e1);
//public Boolean equals(Object stringOrId)

//integer e1 = 88;

Date dt = date.newInstance(2023, 02, 01);
system.debug(dt);

datetime dt2 = datetime.newInstance(202, 10, 4, 9, 45, 30);
system.debug(dt2);

datetime current = datetime.now(); //represent this in LONG.
long someDTinLONG = -10000000;//number of milliseconds from 1970-01-01 00:00:00

//starting datetime is 1970-01-01 00:00:00
datetime dt3 = datetime.newInstance(someDTinLONG);
system.debug(dt3);
