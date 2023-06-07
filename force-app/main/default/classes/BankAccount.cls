public class BankAccount {
    //data members
        //OR
    //class variables
    //access modifiers are possible in class variables, and class methods
    public string accountNumber;
    private string accountHolderName;
    decimal balance;//this is also private
    string bankName;

    public void printDetails(){

        //local variable.
            //it is accessible ONLY inside this method
        datetime current = datetime.now();

        system.debug('printing datetime is ' + current);

        system.debug('accountNumber : ' + accountNumber);
        system.debug('accountHolderName : ' + accountHolderName);
        system.debug('balance : ' + balance);
        system.debug('bankName : ' + bankName);


    }
    //rules of construct.
    //name of constructor -> className
    public BankAccount(){
        system.debug('constructor called');
        balance = 0;
    }

    public void setBalance(decimal bal){
        balance = bal;
    }

    public void setBankName(string bName){
        bankName = bName;
        string s = welcomeMessage();
        
    }

    string welcomeMessage(){
        string w = 'Welcome, ' + accountNumber + ' to ' + bankName;
        return w;
    }

    public void setAccountHolderName(string accHolderName){
        accountHolderName = accHolderName;
    }

    public BankAccount(string accNumber, string accHolderName, decimal bal, string bName){
        system.debug('parameterized constructor called');
        accountNumber = accNumber;
        accountHolderName = accHolderName;
        balance = bal;
        bankName = bName;
        //we can call methods from here.
    }

    public void deposit(decimal amount){
        balance = balance + amount;
        system.debug('new balance after deposit: ' + balance);
    }
}