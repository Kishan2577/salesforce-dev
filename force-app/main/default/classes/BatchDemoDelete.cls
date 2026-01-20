global with sharing class BatchDemoDelete implements Database.Batchable<Opportunity>{
    

    global Iterable<Opportunity> start(Database.BatchableContext bc)
    {

        return [SELECT Id FROM Opportunity WHERE Name LIKE '%Demo Testing%'];
    }


    global void execute(Database.BatchableContext bc, List<Opportunity> scope)
    {
        

        if (!scope.isEmpty()) {
        delete scope;
        }

    }


    global void finish(Database.BatchableContext bc)
    {
        System.debug('BATCH DELETE COMPLETED');
    }


}