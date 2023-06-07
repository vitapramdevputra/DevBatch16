public class MethodsDemo2 {
    //return type + parameterized methods
    public string returnMessage(string name){
        system.debug('code reached inside method');
        string returnStr = 'Hi ' + name + ', nice to meet you';
        return returnStr;
    }
    //pass string in method.
    //returnMessage2(name)
        //print str = hi + name + nice to meet you.
    //return length of str;
    public integer returnMessage2(string name){
        string printStr = 'Hi ' + name + ', nice to meet you';
        system.debug(printStr);
        integer l = printStr.length();//length is string method
        return l;
    }

    public Boolean nameContainsA(string str){
        Boolean checkA = str.containsIgnoreCase('a');
        return checkA;
    }
}