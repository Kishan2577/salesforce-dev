@isTest
public with sharing class DailyLeadProcessorTest {
    public DailyLeadProcessorTest() {

    }


    @isTest
    public static void TestingDailylead()
    {
        List<Lead> allDemoLeads = new List<Lead>();
        for(Integer i=0;i<200;i++)
        {
            Lead led = new Lead(Salutation = 'Mr.', FirstName = 'ABC '+i,LastName = 'DEF '+i, Company = 'DEmo '+i,Status = 'Open - Not Contacted');
            allDemoLeads.add(led);
        }
		System.debug('HERE 1'+allDemoLeads[0].LeadSource);
        insert allDemoLeads;
		


        Test.startTest();
		System.debug('HERE 2');
        System.schedule('Daily Lead Check', '0 0 0 2 2 ? 2026', new DailyLeadProcessor());
		System.debug('HERE 3');
        Test.stopTest();
        
       	CronTrigger ct = [
    	SELECT State
    	FROM CronTrigger
    	WHERE CronJobDetail.Name = 'Daily Lead Job'
			];   

		System.assertEquals('COMPLETE', ct.State);
	
    }
}