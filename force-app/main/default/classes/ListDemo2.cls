public class ListDemo2 {
    public static boolean candidateList(string str){
        List<string> listC = new list<string>();
        system.debug('before : ' + listC);

        //add values or elements or items in list
        listC.add('Marc');  //0
        listC.add('Steve'); //1
        listC.add('Kunal'); //2
        listC.add('Marc');  //3
        listC.add('Marc');  //4
        system.debug('after : ' + listC);
        //contains is case sensitive for string
        boolean check = listC.contains(str);
        return check;
   }

   public static void friendList() {
        list<string> fl = new list<string>{'Sachin', 'Arpan', 'Erik', 'Roy','roy', 'arpan', 'erik'};
        system.debug('before : ' + fl);

        fl.sort();
        system.debug('after sorting: ' + fl);
   }

   public static void iterateList1() {
        list<integer> l1 = new list<integer>();
        l1.add(77);//0
        l1.add(15);//1
        l1.add(21);//2
        l1.add(99);//3
        l1.add(77);//4
        l1.add(77);//5
        //get one by one element and print.
        //77 l1[0]
        //15 l1[1]
        //21 l1[2]
        //integer eachNumber ==> integer because list<integer>
                //eachNumber ==> variable name to be used inside for loop, where we get one by one value
        //for each loop
        for( integer eachNumber : l1 ){
            system.debug(eachNumber);
        }
   }

   public static void iterateList2() {
        list<integer> l1 = new list<integer>();
        l1.add(77);//0
        l1.add(15);//1
        l1.add(21);//2
        l1.add(99);//3
        l1.add(77);//4
        l1.add(77);//5
        //get one by one element and print.
        //77 l1[0]
        //15 l1[1]
        //21 l1[2]
        //integer eachNumber ==> integer because list<integer>
                //eachNumber ==> variable name to be used inside for loop, where we get one by one value
        //for each loop
            //print following
                //5 x 77 = 385
                //5 x 15 = 75
                //5 x 21 = 105
        for( integer eachNumber : l1 ){
            system.debug('5 x ' + eachNumber + ' = ' + (eachNumber*5));
        }
   }

   //add all the elements in l1 list, and return the summation.
   public static integer add(list<integer> l1) {
        integer sum = 0;
        
        for (integer num : l1) {
            system.debug('sum inside for : ' + sum);
            sum = sum + num; // sum += num; 
            //sum = 0 + 8; ==> 8
            //sum = 8 + 9; ==> 17
            //sum = 17 + 21 ==> 38
        }
        return sum;
   }

   public static integer add(integer a, integer b) {
     return a+b;
   }
   public static decimal add(decimal a, decimal b) {
     return a+b;
   }


   public static void iterateListString1() {
        List<string> listC = new list<string>();
        //add values or elements or items in list
        listC.add('Marc');  //0
        listC.add('Steve'); //1
        listC.add('Kunal'); //2
        listC.add('Marc');  //3
        listC.add('Marc');  //4
        listC.add('Elonnnn');
        
        //print each element of this list<string> one by one along with its length
            //Marc - 4
            //Steve - 5
        for (string eachStr : listC) {
            integer len = eachStr.length();
            system.debug(eachStr + ' - ' + len );
            //
        }
   }

   //concate all elements in list by || and return final string
   public static string add(list<string> ls){
        string finalString = '';
        for (string eachStr : ls) {
            system.debug('final str inside for ==> ' + finalString);
            finalString = finalString + eachStr + ' || ';
        }
        //finalString = finalString.removeEnd(' || ');
        return finalString;
   }

   public static void iterateListString99(){
        list<string> list9 = new list<string>{'class', 'object', 'methods', 'constructor', 'getter setter', 'list'};
        //example:
            //class
            //class - 5
            //object
            //object - 6
        list<string> list99 = new list<string>();   
        //we are iterating list9.
        //inside for each loop of list9, we cannot modify(add or remove elements from) list9. 
        //solution?
            //create another empty list and add elements in the new list
        for (string eachTopic : list9) {
            string temp = eachTopic + ' - ' + eachTopic.length();
            list99.add(eachTopic);
            list99.add(temp);
        }
        system.debug(list99);
   }
}