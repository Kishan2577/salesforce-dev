@isTest
public with sharing class TestRestrictContactByName {
    
        @isTest
    static void testInsertInvalidLastName() {
        Contact c = new Contact(
            FirstName = 'Test',
            LastName = 'INVALIDNAME'
        );

        Test.startTest();
        try {
            insert c;
            System.assert(false, 'Insert should have failed');
        } catch (DmlException e) {
            System.assert(e.getMessage().contains('INVALIDNAME'));
        }
        Test.stopTest();
    }

    @isTest
    static void testUpdateInvalidLastName() {
        Contact c = new Contact(
            FirstName = 'Valid',
            LastName = 'Smith'
        );
        insert c;

        c.LastName = 'INVALIDNAME';

        Test.startTest();
        try {
            update c;
            System.assert(false, 'Update should have failed');
        } catch (DmlException e) {
            System.assert(e.getMessage().contains('INVALIDNAME'));
        }
        Test.stopTest();
    }

    @isTest
    static void testValidContactAllowed() {
        Contact c = new Contact(
            FirstName = 'Good',
            LastName = 'User'
        );

        Test.startTest();
        insert c;
        Test.stopTest();

        System.assertNotEquals(null, c.Id);
    }
}