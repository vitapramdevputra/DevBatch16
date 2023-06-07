public class AccountsQueueableExample implements Queueable {
   public list<account> listAcc;
  
   //mandatory execute method
   public void execute(QueueableContext qc){
        List<account> updateAcc = new list<account>();
        for (account eachAcc : listAcc) {
            Account acNew = new account();
            acNew.id = eachAcc.id;
            acNew.name = eachAcc.name  + ' --SI';//appending SI to name of account
            acNew.Fax = '777555666';
            updateAcc.add(acNew);
        }
        update updateAcc;
        //we can call another queueable here.
   }
}