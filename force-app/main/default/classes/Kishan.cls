public class Kishan {
	public void single(string n)
    {
        
        Account acc = new Account(name = n);
        insert acc;
    }
    
    public void multi(integer size)
    {
        List<Account> macc = new List<Account>();
        
        
        for(integer i=0;i<size;i++)
        {
            macc.add(new Account(name = ' '+i));            
        }
        
        
        insert macc;
    }

}