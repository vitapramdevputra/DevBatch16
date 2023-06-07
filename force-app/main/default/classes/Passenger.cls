public class Passenger implements Airplane {
   public void takeOff(){
    system.debug('taking off Passenger plane');
   }
   public void Land(){
    system.debug('landing Passenger plane');
   }
   public void prepare(){
    system.debug('boarding Passenger plane');
   }
}