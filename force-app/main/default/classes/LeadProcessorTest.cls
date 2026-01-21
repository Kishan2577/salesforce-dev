@isTest
public with sharing class LeadProcessorTest {
    public LeadProcessorTest() {

    }

    @isTest
    public static void TestingLeadProcessor()
    {
        List<Lead> allLeads = new List<Lead>();

        for(Integer i=0;i<200;i++)
        {
            Lead led = new Lead(Salutation = 'Mr.', FirstName = 'Demo' , Lastname = 'Testing '+i,Company = 'ABC '+i);
            allLeads.add(led);
        }

        insert allLeads;

        Test.startTest();
        LeadProcessor leadPro = new LeadProcessor();
        Database.executeBatch(leadPro,200);
        Test.stopTest();


        Integer checkLead = [SELECT COUNT() FROM LEAD WHERE FirstName = 'Demo'];

        System.assertEquals(200,checkLead,'NOT ALL LEADS ARE UPDATED');

    }
}