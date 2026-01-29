public with sharing class CalloutToAnotherOrg {
    public CalloutToAnotherOrg() {

    }


    public static void getAccounts()
    {
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:KishanToRoshanCallout/services/apexrest/account/'+ '?name=GenePoint');
        req.setMethod('GET');



        HttpResponse res = http.send(req);
        System.debug(res.getBody());
        
    }
}

