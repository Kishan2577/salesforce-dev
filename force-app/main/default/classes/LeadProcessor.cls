public with sharing class LeadProcessor implements Database.Batchable<sObject>{
    public LeadProcessor() {

    }

        public  Database.QueryLocator start(Database.BatchableContext bc)
        {
            return Database.getQueryLocator([SELECT Id, LeadSource FROM Lead]);
        }


        public void execute(Database.BatchableContext bc,List<Lead> scope)
        {

            for(Lead led : scope)
            {
                System.debug('PROCESSING THE LEAD');
                led.LeadSource = 'Dreamforce';
            }

            if(!scope.isEmpty())
            {
                update scope;
            }
        }


        public void finish(Database.BatchableContext bc)
        {
            System.debug('ALL LEADS UPDATED');
        }
}