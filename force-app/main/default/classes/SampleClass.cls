public class SampleClass {
    //non-static.
    //instance variable, 
    public string name;

    //static 
    public static string description;

    //non-static method
    public void details(){
        system.debug('name => ' + name);
        system.debug('description => ' + description);
    }
    
    //static method
    public static void staticDetails(){
        system.debug('description => ' + description);
    }
}