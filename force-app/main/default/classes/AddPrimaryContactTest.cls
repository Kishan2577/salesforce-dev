@isTest
public with sharing class AddPrimaryContactTest {
    public AddPrimaryContactTest() {

    }
    @isTest
    public static void TestingPrimaryContact()
    {
        List<Account> allAcc = new List<Account>();
        for(Integer i=0;i<50;i++)
        {
            Account acc1 = new Account(Name= 'ABC '+i, BillingState = 'NY');
            Account acc2 = new Account(Name= 'DEF '+i, BillingState = 'CA');
            allAcc.add(acc1);
            allAcc.add(acc2);
        }

        insert allAcc;

        

        Test.startTest();
        Contact con = [SELECT Id,FirstName,LastName,Salutation FROM Contact WHERE Name = 'Dummy Demo'];

        Id jobId1 = System.enqueueJob(new AddPrimaryContact(con, 'NY'));
        Id jobId2 = System.enqueueJob(new AddPrimaryContact(con, 'CA'));
        Test.stopTest();


         Integer nyContacts = [
            SELECT COUNT() 
            FROM Contact 
            WHERE Account.BillingState = 'NY'
        ];

        Integer caContacts = [
            SELECT COUNT() 
            FROM Contact 
            WHERE Account.BillingState = 'CA'
        ];

        System.assertEquals(50, nyContacts, 'NY accounts should have 50 contacts');
        System.assertEquals(50, caContacts, 'CA accounts should have 50 contacts');

    }
}