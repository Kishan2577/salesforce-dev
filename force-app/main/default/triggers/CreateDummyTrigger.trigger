trigger CreateDummyTrigger on Account (after insert) {
        
    List<Contact> allContacts = new List<Contact>();
    

    for(Account acc : Trigger.new)
    {
        Contact con = new Contact();
        con.AccountId = acc.Id;
        con.LastName = acc.name;
        con.FirstName = 'Dummy';
        allContacts.add(con);
    }

    insert allContacts;
          
}