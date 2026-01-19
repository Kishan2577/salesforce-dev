trigger ApexQ13 on Account (after insert) {
    List<Contact> obj = new List<Contact>();
    for(Account acc : Trigger.new)
    {
        Contact con = new Contact();
        con.LastName = 'TESTNAME';
        con.AccountId = acc.Id;
        obj.add(con);
    }

    if(!obj.isEmpty())
    {
        insert obj;
    }


}