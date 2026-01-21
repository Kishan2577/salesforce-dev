public with sharing class AccountProcessorTest {
    public AccountProcessorTest() {

    }

    static void countContactsOfAccounts()
    {
        //Create test Accounts
        Account acc1 = new Account(Name = 'Test Account 1');
        Account acc2 = new Account(Name = 'Test Account 2');
        insert new List<Account>{ acc1, acc2 };

        // Create Contacts for acc1 only
        Contact c1 = new Contact(
            FirstName = 'John',
            LastName = 'Doe',
            AccountId = acc1.Id
        );
        Contact c2 = new Contact(
            FirstName = 'Jane',
            LastName = 'Smith',
            AccountId = acc1.Id
        );
        insert new List<Contact>{ c1, c2 };

        Test.startTest();
            AccountProcessor.countContacts(
                new List<Id>{ acc1.Id, acc2.Id }
            );
        Test.stopTest();

        // Verify results
        Account updatedAcc1 = [
            SELECT Number_Of_Contacts__c
            FROM Account
            WHERE Id = :acc1.Id
        ];

        Account updatedAcc2 = [
            SELECT Number_Of_Contacts__c
            FROM Account
            WHERE Id = :acc2.Id
        ];

        System.assertEquals(2, updatedAcc1.Number_Of_Contacts__c,
            'Account 1 should have 2 contacts');

        System.assertEquals(0, updatedAcc2.Number_Of_Contacts__c,
            'Account 2 should have 0 contacts');
    }
}