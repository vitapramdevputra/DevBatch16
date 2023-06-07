public class LoopDemoRev {
    //not dealing with any class variables, then make static methods
    public static void basicForLoop() {
        
        //traditional for loop
        //for i loop

        for (Integer i = 1; i <= 10; i++) {
            system.debug('i ==> ' + i);
        }
    }
    //provide a < b
    public static void basicForLoop2(integer a, integer b) {
        //s = 15, 16,17,18,19, ... 33,
        string s = '';
        for (Integer i = a; i <= b; i++) {
            s += i + ', ';
        }
        system.debug(s);
    }

    public static void isPrimeNumber(integer num){
        //prime number is divisible by 1 and the number itself.

        //2,3,5,7,11,13,17

        //6
            //6%2 => 0
                //it is NOT prime
        
        boolean isPrime = true;
        for (Integer i = 2; i < num; i++) {
            integer remainder = math.mod(num, i);
            if(remainder == 0){
                isPrime = false;
                break;
            }
        }
        
        if (isPrime) {
            system.debug(num + ' is Prime');
        } else {
            system.debug(num + ' is NOT Prime');
        }

    }
}