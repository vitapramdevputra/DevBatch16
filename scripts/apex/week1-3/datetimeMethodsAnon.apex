DatetimeMethodsDemo d1 = new DatetimeMethodsDemo();
d1.printOfferEndDatetime();
d1.printSubscriptionEndDate();
d1.calculateAgeInDays();
d1.calculateAgeInMonths();


//i have to pass my birth datetime to twitter
    //and twitter is expecting datetime in LONG number format
Datetime birthDate = datetime.newInstance(1990, 10, 9);
long longBirthDate = birthDate.getTime();//this is number of milliseconds from 1 Jan 1970 midnight to 1990 october 9
system.debug('long birth date ==> ' + longBirthDate);//i will send this long to twitter.