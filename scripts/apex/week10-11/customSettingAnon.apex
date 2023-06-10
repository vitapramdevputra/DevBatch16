// DefaultTicketInfo__c dt = DefaultTicketInfo__c.getOrgDefaults();
// system.debug('dt ==> ' + dt);
// system.debug('dt subject ==> ' + dt.subject__c);
// system.debug('dt description ==> ' + dt.description__c);

Map<string, countryCode__c> allCC = CountryCode__c.getAll();
system.debug(allCC);

for(string eachCountry: allCC.keySet()){
    system.debug(eachCOuntry + ' country code is ' + allCC.get(eachCountry).code__c);
}

system.debug('-------');

//if we want to get detail of ANY particular country directly from custom setting then use getInstance method
CountryCode__c irCC = CountryCode__c.getInstance('Iraq');
system.debug('irCC: ' + irCC);
system.debug('code of Iraq ==> ' + irCC.code__c);




