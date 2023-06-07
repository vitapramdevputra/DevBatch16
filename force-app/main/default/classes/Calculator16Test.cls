// - ONE Test class per class or trigger.
// - naming: append 'Test' after class name or trigger name
// - to create test class, annotate our class with @isTest
@isTest
public class Calculator16Test {
    //we write test method to TEST each UNIT.
        //we can write multiple TEST methods also to TEST ONE method.
    //we will different test methods to TEST each method

    //some rules for test method
        //static.
        //public or private anything
        //test method cannot accept any parameter
        //write @isTest to make a method a TEST METHOD
        //it must return void.

    @isTest
    private static void testMethod1() {
        Calculator16 c = new Calculator16();
        c.add(5.5, 4.5);
    }
    //when we deploy code to production, TEST class will be called again.
    //it will automatically validate if our actual classes are working as expected.
    @isTest
    public static void testAddMethod() {
        Calculator16 c = new Calculator16();
        //calling method with parameter is allowed in test method.
        integer sum = c.add(5,5);
        //5,5 -> output should be 10
            //sum -> 10
        //assertion
            //actually validating if our implementation is correct or not.
        //OLD Assertion
        system.assertEquals(10, sum); //similar to check challenge of trailhead

        //NEW Assertion
        Assert.areEqual(10, sum);

        Assert.isTrue((10 == sum));//this will pass, becuse 10 == sum is true
        Assert.isFalse((11 == sum)); //this will pass, because 10 == sum is false
    }
    @isTest
    private static void testAddMethod2() {
        Calculator16 c = new Calculator16();
        //calling method with parameter is allowed in test method.
        integer sum = c.add(5,5,5);
         //NEW Assertion
        Assert.areEqual(15, sum);
    }

    @isTest
    private static void testLeapYear() {
        Calculator16 c = new Calculator16();
        boolean b = c.leapYearCheck(date.today());
        Assert.isFalse(b);

        boolean b2 = c.leapYearCheck(date.newInstance(2020, 1, 15));
        Assert.isTrue(b2);
    }
}