public class Carrr {
    //variables directly defined in class
    //are called class variables.

    //we can use this as properties, 
    //we can assign values when we create instances.
    private string carNumber;
    public string name;//public variables are accessible outsite of the class.
                        //access means, get values, and we can set values.
    public string color;
    public integer mfgYear;
    decimal price;

    public void details(){
        system.debug('car number is ' + carNumber);
        system.debug('car name is ' + name);
        system.debug('color is ' + color);
        system.debug('manufacturing year is ' + mfgYear);
        system.debug('price is ' + price);
        printCarAge();
    }


    //no access modifier means private
    void printCarAge(){
        date todayDate = date.today();
        integer currentYear = todayDate.year();
        system.debug('car age is ' + (currentYear - mfgYear));
    }

    //parameterLESS constructor
    //if we DO NOT have any contructor, by default, behind the scenes, we always parameterLESS contructor.
        //so we can create new instance even if we DO NOT have any constructor defined.
    
    //if we are creating any consturctor (user defined constructor), then, default constuctor(behind the scenes ones) will vanish, we can't use that anymore 
    public carrr(){
        system.debug('carrr contructor called when new instance is created.');
        mfgYear = 2023;
    }

    //multiple constructor --> constructor overloading
    //parameterized constructor
    public carrr(integer yr){
        system.debug('parameterized constructor called.');
        mfgYear = yr;
    }
    

    public carrr(string carnum, string nm, string clr, integer yr, decimal pc){
        carNumber = carnum;
        name = nm;
        color = clr;
        mfgYear = yr;
        price = pc;

        details();
    }

}