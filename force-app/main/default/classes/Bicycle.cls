public class Bicycle {
    integer gear;
    integer speed;

     public static string getRating(string material){
        string rating = '';
        if (material == 'Carbon') {
            rating = 'A';
        } else {
            rating = 'D';
        }
        return rating;
    }
    

    public void speedUp(){
        this.speed++;
    }

    public void changeGear(integer newValue){
        this.gear = newValue;
    }
    public void printState(){
        system.debug('speed of bike is ' + this.speed + ', gear is ' + this.gear);
    }

    public Bicycle(integer gear, integer speed){
        this.gear = gear;
        this.speed = speed;
    }
   
}