Test
    - annotation? @isTest
    - we must do @isTest in test class.
    - is @isTest compulsary for test method?
    - testmethod must be static. It can be public or private. It must return VOID. And doesn't take any parameter.
    - can we have a method inside test class without @isTest?
        - yes, we can have a non test method inside test class.
    - if we do any DML from test method can we insert/update org records?
        - NO.
    - soql inside testmethod can we fetch records from org?
        - by befault we cannot get records from the org.
    - assertion is mandatory almost always.
    - minmun 75% code coverage.

- Each TestMethod has its own test world.
- Each TestMethod gets FULL Governor Limits


- if we create 5 accounts in test method.
    - if we do soql query to get all accounts. How many accounts? 
        - 5 acc

- prepare data part, we consume lots of limit. 
    - How can we assure that we have limits to test our actual method?
    - Test.startTest - calling actual method - Test.stopTest

TestSetup
 - We create common data or all the data in TestSetup method and we can use that data in all methods of THAT test class.

 How to TEST Triggers and its handlers?
    - separate classes for both
    - Create/update/delete/undelete records -> which will fire triggers.
        - we have to create/update specific data to test each unit of handlers.