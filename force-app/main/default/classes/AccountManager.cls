@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {
    @HttpGet
    global static Account getAccount()
    {
        // Get Account Id from URL
        RestRequest req = RestContext.request;
        String accountId = req.requestURI.substringAfter('/Accounts/')
                                         .substringBefore('/contacts');

        // Query Account with Contacts
        Account acc = [
            SELECT Id, Name,
                   (SELECT Id, Name FROM Contacts)
            FROM Account
            WHERE Id = :accountId
            LIMIT 1
        ];

        return acc;   
    }
}