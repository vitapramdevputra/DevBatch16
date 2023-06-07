public class Cargo implements Airplane {
   public void takeOff(){
    system.debug('taking off Cargo plane');
   }
   public void Land(){
    system.debug('landing Cargo plane');
   }
   public void prepare(){
    system.debug('boarding Cargo plane');
   }
}