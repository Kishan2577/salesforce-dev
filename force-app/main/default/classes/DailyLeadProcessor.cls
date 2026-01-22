public with sharing class DailyLeadProcessor implements Schedulable {
    



    public void execute(SchedulableContext sc)
    {
        List<Lead> allLeads = [SELECT Id, Name, LeadSource FROM LEAD WHERE LeadSource = NULL Limit 200];

        for(Lead led : allLeads)
        {
            led.LeadSource = 'Dreamforce';
        }


        if(!allLeads.isEmpty())
        {
            update allLeads;
        }
    }

}