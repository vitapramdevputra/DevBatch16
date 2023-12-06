List<string> toEmailAddresses = new list<string>{'vitap@kanixa.com'};


//Filters
List<string> filterAccountPriority = new list<string>{'NAL - AE Owned', 'NAL - Marketing Owned'};

List<string> filterAccountStageNot = new list<string>{'Partner'};


//Variable Declarations

//Sets
set<string> setContactIds = new Set<string>();

//Lists
List<Contact> lstContact = new List<Contact>();

//Maps
Map<string, string> mapAccountDetails = new Map<string, string>();

//Query on contacts to get all the contacts associated with accounts that satisfies the priority and stage condition
//Creatd a new picklist field Stage
lstContact= [Select id, AccountId, Account.Name from Contact where Account.Account_Priority__c In :filterAccountPriority
             Or Account.Account_Stage__c Not in :filterAccountStageNot];

//Query on Task(Activity) object to get all the tasks that fullfill the required conditions
//In the Query used the above list of contacts to get only relevant records also used like to fulfills 'contains' condition
//As Description(Comments) is a LonG Text Area field hence we cannot use where condition on it.
//Consideration: Assuming we have to use Who Id and then get the Accounts Associated with those contacts if whoId is contacts Id
//Loop over all the tasks to check description condition
//Assumption: Used ignore case as was not sure of the requirement
for(Task objTask : [Select whoid,Description from Task where Whoid IN: lstContact AND 
                    ((Subject LIKE '%[IN]%' AND CreatedDate = LAST_N_DAYS:180) OR Subject = 'Filled out Form:www.checkhq.com/contact')]){
                        
                        if((String.isNotBlank(objTask.Description) && 
                           !objTask.Description.containsIgnoreCase('ooo') && 
                           !objTask.Description.containsIgnoreCase('out of office')) || String.isBlank(objTask.Description)){
                               setContactIds.add(objTask.whoid);
                           }  
                    }

//Query on Event(Activity) object to get all the tasks that fullfill the required conditions
//In the Query used the above list of contacts to get only relevant records also used like to fulfills 'contains' condition
//As Description(Comments) is a LonG Text Area field hence we cannot use where condition on it.
//Consideration: Assuming we have to use Who Id and then get the Accounts Associated with those contacts if whoId is contacts Id
//Used Not In: setContactIds to filter out events associted with contacts that are already selected as our end goal is getting Account only
//Loop over all the events to check description condition
//Assumption: Used ignore case as was not sure of the requirement
for(Event objEvent : [Select whoid,Description from Event where Whoid IN: lstContact AND Whoid NOT IN: setContactIds AND
                      ((Subject LIKE '%[IN]%' AND CreatedDate = LAST_N_DAYS:180) OR Subject = 'Filled out Form:www.checkhq.com/contact')]){
                          
                          if((String.isNotBlank(objEvent.Description) && 
                             !objEvent.Description.containsIgnoreCase('ooo') && 
                             !objEvent.Description.containsIgnoreCase('out of office')) || String.isBlank(objEvent.Description)){
                                 setContactIds.add(objEvent.whoid);
                             }  
                      }

//Loop over lstcontacts to filter and get the relevant Accounts that are required
for(Contact objContact : lstContact){
    if(setContactIds.contains(objContact.Id)){
        mapAccountDetails.put(objContact.AccountId, objContact.Account.Name);  
    }
}

//Loop and Query on CampaignMember object to get all the relevant Accounts that have campaigns associated with their contacts
//Added accountid not in mapAccountDetails to make the query reults shorter
for(CampaignMember objCM : [Select Id, ContactId, Contact.AccountId, Contact.Account.Name from CampaignMember where ContactId IN: lstContact AND 
                            Contact.AccountId Not IN :mapAccountDetails.keyset() AND FirstRespondedDate = LAST_N_DAYS:180 ]){
                                mapAccountDetails.put(objCM.Contact.AccountId, objCM.Contact.Account.Name);
                                
                            }
system.debug(mapAccountDetails);

//Below Code is used to send Email
Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
//Set To Address
mail.setToAddresses(toEmailAddresses);

// Specify the address used when the recipients reply to the email. 
mail.setReplyTo(toEmailAddresses[0]);

// Specify the name used as the display name.
mail.setSenderDisplayName('Account Details');

// Specify the subject line for your email address.
mail.setSubject('Number of Account to work on : ' + mapAccountDetails.size());

mail.setUseSignature(false);

// Specify the text content of the email.
mail.setPlainTextBody('Account Data');
String htmlBody = '';

//open table..
htmlBody = 'Account Data: <table border="1" style="border-collapse: collapse"><tr><th>Id</th><th>Name</th></tr>';

for(string objKey : mapAccountDetails.keyset()){
    
    htmlBody += '<tr><td>' + mapAccountDetails.get(objKey) + '</td><td>' + objKey + '</td></tr>';
    
}
htmlBody += '</table>';

system.debug('Email Body: ' + htmlBody);
mail.setHtmlBody(htmlBody);

// Send the email you have created.
Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
