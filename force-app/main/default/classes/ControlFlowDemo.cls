public class ControlFlowDemo {
    //check and print bigger integer
   public void checkBigger(integer a, integer b){
        string c = 'this variable is accessible in checkBigger method only';
        if (a > b) {
            string d = 'this variable is accessible inside THIS if block only';
            //for more than one statement brackets are mandatory
            system.debug(a +' is bigger than ' + b);
            system.debug('b is smaller than a');
            //c
            //d
        } else if(b > a) {
            system.debug('b is bigger than a');
            system.debug('a is smaller than b');
            //c
            //no d
        } else {
            system.debug('a and b are equal');
            //no d
        }
        //c
        //no d
   }
   public void checkBigger1(integer a, integer b){
        //c
        //if only one statement brackets are optional
        if (a > b) 
            system.debug(a +' is bigger than ' + b);
           
         else 
            system.debug('b is bigger than a');
    }

    public void checkNumber(integer x){
        //x = -15
        if(x > 0){
            system.debug('x is a positive number');
            integer remainder = math.mod(x, 2);
            if (remainder == 0) {
                system.debug(x + ' is even');
            } else {
                system.debug(x + 'is odd');
            }
        } else {
            if(x == 0){
                system.debug('x is zeroooo 😕');
            } else {
                system.debug('x is negative 😞');
            }
        }
    }
}