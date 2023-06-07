public class Candidate {
    public string name;
    public string gender;
    public static integer count = 0;
    public static string companyName;

    //constructor will be called automatic when we create new instance
    public candidate(){
        count++;
    }

    //non-static method
    public void details(){
        //accessing non-static variables
        system.debug('name is ' + name);
        system.debug('gender is ' + gender);
        //accessing static variable/methods 
        system.debug('companyName is ' + companyName);
        system.debug('--------');
        system.debug('count is ' + count);
        system.debug('--------');
        system.debug('******');
    }

    //static method
    public static void staticDetails(){
         //accessing non-static variables/methods is not allowed in static method
        // system.debug('name is ' + name);
        // system.debug('gender is ' + gender);

        //accessing static variable
        system.debug('companyName is ' + companyName);
        system.debug('======');
        system.debug('count is ' + count);
        system.debug('=====');
    }
}