public class CalculatorProgram {
   public void calc(){
        Calculator c = new Calculator();
        integer sum1 = c.add(10, 15);
        system.debug('sum1 is ' + sum1);

        system.debug('10,15,95 ==> ' + c.add(10, 15, 95));
   }
}