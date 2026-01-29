@isTest
public with sharing class AnimalLocatorMock implements HttpCalloutMock {
    
    public HttpResponse respond(HttpRequest req)
    {
        HttpResponse res = new HttpResponse();
        res.setStatusCode(200);

        res.setBody(
            '{' +
            '  "animal": {' +
            '    "id": 2,' +
            '    "name": "bear",' +
            '    "eats": "berries",' +
            '    "says": "yum yum"' +
            '  }' +
            '}'
        );


        return res;
    }
}