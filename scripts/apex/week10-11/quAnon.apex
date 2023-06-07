list<account> acc = [select id, name from account where createddate = last_month];
AccountsQueueableExample aq = new AccountsQueueableExample();
aq.listAcc = acc;

//enqueuing job
id jobId = system.enqueueJob(aq);
//with job id, we can monitor the progress.
    //we can check if job is in-progress, successful, any errors etc
AsyncApexJob job = [SELECT Id, Status, JobType, MethodName, NumberOfErrors FROM AsyncApexJob where id = :jobId];
system.debug(job);