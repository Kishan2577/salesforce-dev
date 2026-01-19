public with sharing class Q54 {
   
    public static void AssignCase()
    {
        Group que = [SELECT Id FROM GROUP WHERE TYPE = 'Queue' LIMIT 1];
        System.debug(que.id);
        // Case c = new Case(
        //     SUBJECT = 'Issues',
        //     TYPE = 'Billing',
        //     OwnerId = que.Id
        // );

        List<Case> c = new List<Case>();
        c = [SELECT Id,Type from Case Limit 50];
        

        for(Case cases : c)
        {
            cases.OwnerId = que.id;
            System.debug(que.id);
        }

        update c;


        System.debug('COMPLETED');
    
    }
}