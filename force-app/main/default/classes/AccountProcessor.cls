public with sharing class AccountProcessor {
    
    @future
    public static void countContacts(List<Id> ids)
    {

        List<AggregateResult> result = new List<AggregateResult>();
        result = [SELECT AccountId , Count(id) total FROM Contact WHERE AccountId IN :ids GROUP BY AccountId];


        Map<Id,Integer> maps = new Map<Id,Integer>();
        for(AggregateResult ars : result)
        {
            maps.put((Id) ars.get('AccountId'),(Integer) ars.get('total'));
        }

        List<Account> saveAcc = new List<Account>();
        for(Id accid : ids)
        {
            Account newAcc = new Account(Id=accid,Number_Of_Contacts__c = maps.containskey(accid) ? maps.get(accid):0);
        }

        update saveAcc;
        
    }
}