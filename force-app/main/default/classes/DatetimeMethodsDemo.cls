public class DatetimeMethodsDemo {
    public void calculateAgeInMonths(){
        system.debug('we will calculate our age in months');
        Date todayDate = date.today();
        //birthdate                         (year, month, day)
        Date vitapBirthDate = date.newInstance(1990, 10, 9);

        //calculate age in months
        //built-in method --> monthsBetween
        integer viAgeInMonths = vitapBirthDate.monthsBetween(todayDate);
        system.debug('Vitap age in months ' + viAgeInMonths);
    }

    public void calculateAgeInDays(){
        Date todayDate = date.today();
        //birthdate                         (year, month, day)
        Date vitapBirthDate = date.newInstance(1990, 10, 9);

        integer viAgeInDays = vitapBirthDate.daysBetween(todayDate);
        system.debug('Vitap age in days ' + viAgeInDays);
    }

    public void printSubscriptionEndDate(){
        date startDate1 = date.today();
        //use addDays method to add days
        date endDate1 = startDate1.addDays(1000);
        system.debug('Subscription ends on ' + endDate1);
        
        //today is end date of 1000days of subscription. Get startDate
        date endDate2 = date.today();
         //use addDays method to add days
        date startDate2 = endDate2.addDays(-1000);
        system.debug('Subscription start date2 is ' + startDate2);
        //get YEAR component from date
        integer startYear = startDate2.year();
        system.debug('start year of subscription was ' + startYear);
        integer startMonth = startDate2.month();
        system.debug('month year of subscription was ' + startMonth);
    }

    public void printOfferEndDatetime(){
        //today -> date
        //now   -> datetime
        datetime offerStartDT = datetime.now();
        //print offer end datetime, if offer is for 51 hours
        datetime offerEndDT = offerStartDT.addHours(51);
        system.debug('offer end datetime is ' + offerEndDT);
    }
}