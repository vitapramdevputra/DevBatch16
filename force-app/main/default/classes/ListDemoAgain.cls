public class ListDemoAgain {
   public static void randomIntList(){
        list<integer> l1 = new list<integer>();
        l1.add(77);//0
        l1.add(15);//1
        l1.add(21);//2
        l1.add(99);//3
        l1.add(77);//4
        l1.add(77);//5
        system.debug('list of integer ' + l1);


        l1[4] = 90;//this is valid.

        //how to get a value from an index
            //A. use .get(index) method
        integer i3 = l1.get(3);//value? 99
        //OR
        integer i33 = l1[3]; //value? 99
        system.debug('i3 is ' + i3);
        system.debug('i33 is ' + i33);


        integer size = l1.size();//size methods returns us number of elements in a list.s
        system.debug('SIZE of l1 is ' + size);//count like humans

        //system.debug(l1[6]);//does not work.

        
   }

   public static void listPractice1() {
        list<integer> l1 = new list<integer>();
        for (Integer i = 1; i <= 5; i++) {
            //system.debug(i*11);
            l1.add(i*11);
        }
        system.debug(l1);
   }

   public static void printAnimalsList() {
        list<string> a1 = new list<string>();
        a1.add('cat');   //0
        a1.add('dog');   //1
        a1.add('monkey');//2
        a1.add('horse'); //3
        a1.add('tiger'); //4
        a1.add('lion');  //5
        a1.add('lion');  //6


        list<string> a2 = new list<string>();
        a2.add('lion');  //0
        a2.add('cat');   //1
        a2.add('dog');   
        a2.add('monkey');
        a2.add('horse'); 
        a2.add('tiger'); 
        a2.add('lion');  
        system.debug('a1 equals a2?? ' + a1.equals(a2));
       

        system.debug('animals ==> ' + a1);
        integer a1size = a1.size();
        system.debug('number of animals ' + a1size);
        //get the last element
            //last index is size-1
        string lastAnimal = a1.get(a1size-1);
        system.debug('last animal in CAPS: ' + lastAnimal.toUpperCase());
        //remove the last element and print size and list again.
        a1.remove(a1size-1);
        system.debug('animals updated ==> ' + a1);
        system.debug('number of animals ' + a1.size());
   }

    public static void printAnimalsList2() {
        list<string> a1 = new list<string>();
        a1.add('cat');   //0
        a1.add('dog');   //1
        a1.add('monkey');//2
        a1.add('horse'); //3
        a1.add('tiger'); //4
        a1.add('lion');  //5
        a1.add('lion');  //6

        list<string> a2 = new list<string>{'kangaroo', 'bear', 'deer', 'bear', 'deer'};
        system.debug('a2 is empty?? ' + a2.isEmpty());

        //a1.addAll(a2);//we are adding all elements from a2 in a1
        a2.addAll(a1);//we are adding all elements from a1 in a2
        system.debug('a2 is ' + a2);

        //print index number of bear
        integer a2bear = a2.indexOf('bear');//indexOf returns integer. false is boolean.
        system.debug('bear index is ' + a2bear);
        system.debug('Bear index is ' + a2.indexOf('Bear'));
        
        a2.sort();//sorts alphabetically
        system.debug('sorted list ' + a2);

        integer a2bearAgain = a2.indexOf('bear');
        a2.remove(a2bearAgain);

        a2.clear();
        system.debug('a2 is empty? ' + a2.isEmpty());
        system.debug('a2 => ' + a2);

    }
}