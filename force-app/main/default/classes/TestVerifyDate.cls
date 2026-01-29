@isTest
public with sharing class TestVerifyDate {
    

    @isTest
    public static void TestDate()
    {

        Test.startTest();
        Date res1 = VerifyDate.CheckDates(Date.newInstance(2026, 1, 3), Date.newInstance(2026, 1, 25));
        Date res3 = VerifyDate.CheckDates(Date.newInstance(2026, 1, 3), Date.newInstance(2026, 2, 25));
        Test.stopTest();

        Date res2 = Date.newInstance(2026, 1, 25);
        Date res4 = Date.newInstance(2026, 1, 31);
        System.assertEquals(res1, res2);
        System.assertEquals(res3, res4);
    }
}