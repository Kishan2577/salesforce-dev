@isTest
public with sharing class AnimalLocatorTest {
    
    @isTest
    public static void testAnimalName()
    {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());

        Test.startTest();
        String name = AnimalLocator.getAnimalNameById(2);

        Test.stopTest();


        System.assertEquals('bear', name);
    }

}