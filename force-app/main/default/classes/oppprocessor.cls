public class oppprocessor implements Database.Batchable<sobject>, database.stateful{
    public integer recordCount = 0;
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([SELECT Id, Name FROM Opportunity]);
     }
    public void execute(Database.BatchableContext bc, List<Opportunity> opps){
        for(Opportunity op : opps){
            op.LeadSource ='Web';
        }
        
        update opps;
        recordcount = recordcount + opps.size();
    }
    
    public void finish(database.Batchablecontext bc){
        system.debug('Total records processed' + recordcount);
    }
}

/* 
oppprocessor oppprocess = new oppprocessor();
id batchid = database.executebatch(oppprocess);
*/