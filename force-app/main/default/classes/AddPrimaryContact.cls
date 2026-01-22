public with sharing class AddPrimaryContact implements Queueable {
    
    private Contact con;
    private String str;
    public AddPrimaryContact(Contact con,String str)  {
        this.str = str;
        this.con = con;
    }


    public void execute(System.QueueableContext qc)
    {
        List<Account> accs = [SELECT ID FROM Account WHERE BillingState = :str LIMIT 200];

        List<Contact> conList = new List<Contact>();
        for(Account acc : accs)
        {
            Contact newCon = con.clone(false,false,false,false);
            newCon.AccountId = acc.id;
            conList.add(newCon);
        }

        if(!conList.isEmpty())
        {
            insert conList;
        } 
        
    }
}