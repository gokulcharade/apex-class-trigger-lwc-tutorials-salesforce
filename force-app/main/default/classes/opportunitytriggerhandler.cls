public class opportunitytriggerhandler {
    public static void updatedescription(list<opportunity> opplist){
        for(opportunity opp : opplist){
            if(opp.amount != null && opp.amount >= 100000 && opp.amount <=500000){
                opp.description = 'hot opportunity';
            }
        }
    }
    
    public static void populatelatestoppamt(list<opportunity> opplist){
        list<account> acclist =new list<account>();
        for(opportunity opp: opplist){
            if(opp.amount != null && opp.accountid != null){
                account acc= new account();
                acc.id =opp.accountid;
                acc.latest_opp_amount__c = opp.amount;
                acclist.add(acc);
             
            }
        }
        if(!acclist.isempty()){
            update acclist;
        }
        
    }
    
 public static void updatedescriptionbasedonstage(List<Opportunity> oppList, Map<Id,Opportunity> oldMap){
    	for(Opportunity opp : oppList) {
            if (oldMap == null || opp.StageName != oldMap.get (opp.Id).StageName) {
                if (opp.StageName == 'Closed Won') {
                    opp.Description = 'Opportunity is closed Won';
                }else if(opp.StageName == 'Closed Lost') {
                    opp.Description = 'Opportunity is Closed Lost';
                }else{	
                    opp.Description = 'Opportunity is Open';
                }
                
            }
        }
 	}   
}