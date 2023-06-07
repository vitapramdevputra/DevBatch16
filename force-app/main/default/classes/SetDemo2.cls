public class SetDemo2 {
    public static void setToUpperCase() {
         //set of string
        set<string> cities = new set<string>();
        cities.add('Tokyo');
        cities.add('Lisbon');
        cities.add('Nairobi');
        cities.add('Berlin');
        cities.add('Tokyo');
        cities.add('Tokyo');
        cities.add('Lisbon');
        cities.add('Nairobi');
        cities.add('LISBON');
        //it prints in alphabetic order.
        system.debug('cities set ' + cities);

        //convert each element to uppercase and add in new set
        set<string> citiesUP = new set<string>();
        
        //for each loop on CITIES set
        for (string eachCity : cities) {
            string temp = eachCity.toUpperCase();
            citiesUP.add(temp);
            citiesUP.add(eachCity.toUpperCase());
        }
        system.debug('uppercase cities => ' + citiesUP);
    }

    public static void setInteger2(){
        set<integer> setInt = new set<integer>{1,4,5,6,7,8,9,10};
        //print
            //6
            //9
            //10
        for (integer i : setInt) {
            system.debug(i + 5);
        }
    }
}