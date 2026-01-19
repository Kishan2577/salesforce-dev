trigger ApexQ3 on Opportunity (before insert,before update) {

    for(Opportunity opp : Trigger.new)
    {
        if(opp.Amount > 100000 && opp.StageName != 'Closed Won')
        {
            opp.StageName = 'Closed Won';
        }
    }


}