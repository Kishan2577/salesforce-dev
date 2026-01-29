
    @RestResource(urlMapping = '/getAccount')
    global with sharing class RestApiTesting {
        
        @httpGet
        global static AccountWrapper getRecords(){

            String name = RestContext.request.params.get('name');


            List<Account> accList = [SELECT Id,Name,industry,rating,annualrevenue FROM Account WHERE Name = :name];

            Set<Id> accIdList = new Set<Id>();
            for(Account acc : accList)
            {
                accIdList.add(acc.Id);
            }


            List<Contact> allCon = new List<Contact>();
            allCon = [SELECT Id,FirstName,LastName FROM Contact WHERE AccountId IN : accIdList];


            List<Opportunity> allOpp = new List<Opportunity>();
            allOpp = [SELECT Id,Name,StageName FROM Opportunity WHERE AccountId IN : accIdList];

            AccountWrapper obj = new AccountWrapper();
            obj.accList = accList;
            obj.accCon = allCon;
            obj.accOpp = allOpp;


            return obj;

        }


        global class AccountWrapper
        {
            global List<Account> accList;
            global List<Opportunity> accOpp;
            global List<Contact> accCon;
        }
    }