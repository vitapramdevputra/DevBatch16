public class MethodsDemo {
    //return type is mandatory.
    public void welcomeMessage(){
        system.debug('Hi there, welcome to the world');
        
    }
    //print dynamic message
    //parameter -> string datatype
    public void samplePrintMessage(string m){
        //m is parameter variable name which we use inside method
        system.debug(m);
    }

    //parameters -> 1
    //datatype of parameters -> string
    public void newMessage(string name){
        system.debug('Hi ' + name + ', welcome to the world of apex, buddy');
    }
}