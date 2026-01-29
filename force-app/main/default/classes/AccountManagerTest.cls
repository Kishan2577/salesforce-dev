@IsTest
private class AccountManagerTest {

    @IsTest
    static void testGetAccount() {

        // Create test Account
        Account acc = new Account(Name = 'Test Account');
        insert acc;

        // Create test Contacts
        Contact con1 = new Contact(
            FirstName = 'John',
            LastName = 'Doe',
            AccountId = acc.Id
        );
        Contact con2 = new Contact(
            FirstName = 'Jane',
            LastName = 'Smith',
            AccountId = acc.Id
        );
        insert new List<Contact>{ con1, con2 };

        // Mock REST request
        RestRequest req = new RestRequest();
        req.requestURI = '/services/apexrest/Accounts/' + acc.Id + '/contacts';
        req.httpMethod = 'GET';

        RestResponse res = new RestResponse();
        RestContext.request = req;
        RestContext.response = res;

        Test.startTest();
        Account result = AccountManager.getAccount();
        Test.stopTest();

        // Assertions
        System.assertEquals(acc.Id, result.Id);
        System.assertEquals('Test Account', result.Name);
        System.assertEquals(2, result.Contacts.size());
    }
}
