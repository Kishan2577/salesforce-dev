@isTest
public with sharing class ParkServiceMock implements WebServiceMock{
    global void doInvoke(
        Object stub,
        Object request,
        Map<String, Object> response,
        String endpoint,
        String soapAction,
        String requestName,
        String responseNS,
        String responseName,
        String responseType
    ) {
        ParkService.byCountryResponse res = new ParkService.byCountryResponse();
        res._return = new String[]{ 'Yellowstone', 'Yosemite', 'Grand Canyon' };
        response.put('response_x', res);
    }
}