public class MapDemo {
    public static void mapExample(){
        //key -> string
        //value -> integer
        map<string, integer> map1 = new map<string, integer>();
        //we want to add key-value pair.
        //put means add
        map1.put('one', 101);
        map1.put('two', 202);
        map1.put('three', 303);
        map1.put('one', 1001);//update/overwite/override the value silently
        map1.put('two', 2002);
        map1.put('ten', 1001);//can two keys have same values?
        map1.put('Two', 2003);//different. case sensitive

        system.debug(map1);

        //VALID maps below
        map<integer, string> map2;//valid

        //boolean as key
        map<boolean, string> map3;//valid. 3 key-value pair possible in this map.

        map<date, string> map4;

        map<string, list<string>> map5;//is this valid?
        //country -> states
        //key is string -> value is list<string>
    }
}