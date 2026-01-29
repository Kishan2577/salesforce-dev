public with sharing class AnimalLocator {
    

    public static String getAnimalNameById(Integer num)
    {
        Http http =new Http();
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        // Map<String,Object> root = new Map<String,Object>();
        // Map<String,Object> animal = new Map<String,Object>();
        
        
        

        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+num);
        req.setMethod('GET');
        

        res = http.send(req);



        

        // root = (Map<String,Object>)data;
        // animal = root.get('animal');

        AnimalResponse response = (AnimalResponse)JSON.deserialize(res.getBody(), AnimalResponse.class);

        // return animal.get('name');

        return response.animal.name;
    }

}