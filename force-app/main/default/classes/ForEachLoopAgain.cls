public class ForEachLoopAgain {
   public static void iterateList1() {
        list<integer> l1 = new list<integer>{1,10,15,20};

        for (integer eachNum : l1) {
            system.debug(eachNum);
        }
   }

   public static void iterateList2() {
        list<integer> l1 = new list<integer>{1,10,15,20};

        integer sum = 0;
        string s = '';
        for (integer eachNum : l1) {
            sum += eachNum;
            s += eachNum + ' || ';
        }
       
        system.debug(sum);
        system.debug(s);
   }

   public static void printEachCountry() {
        set<string> allCountry = new set<string>{
            'Brazil',
            'Mexico',
            'Phillipines',
            'United States',
            'United kingdom',
            'Portugal'
        };

        set<string> c2 = new set<string>();
        for (string eachCountry : allCountry) {
            system.debug(eachCountry);
            integer len = eachCountry.length();
            if (len >= 8) {
                c2.add(eachCountry);
            }
        }
        
        system.debug('c2 is ' + c2);
   }
}