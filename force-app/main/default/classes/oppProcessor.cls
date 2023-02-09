public class oppProcessor implements Database.Batchable<sObject>,Database.stateful{
    
    
    public integer recordcount = 0;
    
    public  Database.QueryLocator start(Database.BatchableContext bc)
    {
        return Database.getQueryLocator([select id, Name from Opportunity]);
    }
    
    public void execute(Database.BatchableContext bc, List<Opportunity> opps)
    {
        for(Opportunity op: opps)
        {
            op.LeadSource = 'Web';
        }
        update opps;
        recordcount = recordcount + opps.size();
    }
    
    public void finish(Database.BatchableContext bc)
    {
        system.debug('Total records processed: '+recordcount);   
    }
    
    
}