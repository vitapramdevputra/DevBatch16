public class SetDemo {
    public static void citySet() {
        //set of string
        set<string> cities = new set<string>();
        cities.add('Tokyo');
        cities.add('Lisbon');
        cities.add('Nairobi');
        cities.add('Berlin');
        cities.add('Tokyo');
        cities.add('Tokyo');
        cities.add('Tokyo');
        cities.add('Tokyo');
        cities.add('Tokyo');
        cities.add('Lisbon');
        cities.add('Nairobi');
        cities.add('LISBON');
        //it prints in alphabetic order.
        system.debug('cities set ' + cities);
    }

    public static void randomIntegerSEt() {
        Set<integer> intSet = new Set<integer>();
        intSet.add(15);
        intSet.add(21);
        intSet.add(10);
        intSet.add(15);
        intSet.add(15);
        intSet.add(10);
        system.debug('int set ==> ' + intSet);
    }

    public static void setFromList(){
        //we will create set from list
        list<integer> l1 = new list<integer>{10,15,77,55,99,10,77,55};
        system.debug('l1 ==> ' + l1);

        //create new set, and add all elements from list to set
        set<integer> s1 = new set<integer>();
        s1.addAll(l1);//addAll method we can add ALL elements from another list or set.
        system.debug('s1 ==> ' + s1);
    }

    //we will pass list<integer> in below method, and it will return us set<integer>
    public static set<integer> setFromList(list<integer> intList) {
        system.debug('l1 from parameter => ' + intList);
        //create new set
        set<integer> s1 = new set<integer>();
        s1.addAll(intList);//add all elements from list to set
        return s1;
    }
}