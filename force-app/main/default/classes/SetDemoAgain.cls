public class SetDemoAgain {
    public static void printCountrySet() {
        set<string> countries = new set<string>{'USA', 'UK', 'Germany', 'France', 'Mexico'};
        countries.add('USA');
        countries.add('Spain');
        countries.add('UK');

        system.debug('number of countries: ' + countries.size());
        system.debug('countries are ' + countries);

        //system.debug(countries[0]);//ERROR.

        system.debug('UK is present in set? ' + countries.contains('UK'));


    }

    public static void setOfList() {
        set<list<integer>> sl = new set<list<integer>>();

        list<integer> l1 = new list<integer>{1,2,5,7};
        list<integer> l2 = new list<integer>{5,7,9,10};
        list<integer> l3 = new list<integer>{15,20,25};
        list<integer> l4 = new list<integer>{5,7,9,10};
        list<integer> l5 = new list<integer>{2,1,5,7};

        sl.add(l1);
        sl.add(l2);
        sl.add(l3);
        sl.add(l4);
        sl.add(l5);
        //sl.add(new list<integer>{9,99,999});

        system.debug('set of list is ' + sl);

        set<list<integer>> sl2 = new set<list<integer>>();
        sl2.addAll(sl);
    }
    public static void setPractice() {
        set<string> s1 = new set<string>{'x','y','z'};

        set<integer> s2 = new set<integer>{1,2,3};
        s2.add(15);

        set<string> s3 = new set<string>();
        s3.addAll(s1);

    }
}