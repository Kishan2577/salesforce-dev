global with sharing class BatchDemo implements Database.Batchable<String>{
    

    global Iterable<String> start(Database.BatchableContext bc)
    {

        List<String> names = new List<String>();

        for(Integer i = 0; i < 1000;i++)
        {
            names.add('Demo Testing '+i);    
        }


        return names;
    }


    global void execute(Database.BatchableContext bc, List<String> data)
    {
        List<Opportunity> saveOpp = new List<Opportunity>();
        for(String name : data)
        {
            System.debug('BATCH PROCESSING');
            Opportunity opp = new Opportunity(
                Name = name,
                Stagename = 'Prospecting',
                CloseDate = Date.today().addDays(30)
            );

            saveOpp.add(opp);
        }

        insert saveOpp;
    }


    global void finish(Database.BatchableContext bc)
    {
        System.debug('BATCH COMPLETED');
    }
}