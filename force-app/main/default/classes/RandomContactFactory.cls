public with sharing class RandomContactFactory {

    public static List<Contact> generateRandomContacts(Integer totalCon,String lastname)
    {
        List<Contact> allCons = new List<Contact>();

        for(Integer i = 0;i<totalCon;i++)
        {
            Contact con = new Contact(LastName = lastname);
            allCons.add(con);
        }

        return allCons;

    }
}