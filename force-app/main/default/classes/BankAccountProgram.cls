public class BankAccountProgram {
    public void createBankAccounts(){
        BankAccount b1 = new BankAccount('65432111', 'John', 8800, 'Citi bank');
        b1.printDetails();

        BankAccount b2 = new BankAccount();
        b2.accountNumber = '777888444';
        b2.printDetails();
    }
}