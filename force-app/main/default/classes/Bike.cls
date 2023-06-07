global class Bike {

    private string bikeNumber;
    global string name;
    public string price;

    //set value of bikeNumber using set method
    public void setBikeNumber(string bn){
        bikeNumber = bn;
    }

    //non static methods
    public void details(){
        //local variable
        date todayDate = date.today();
        system.debug('bike number is ' + bikeNumber);
        system.debug('bike name is ' + name);
        system.debug('bike price ' + price);
    }
}