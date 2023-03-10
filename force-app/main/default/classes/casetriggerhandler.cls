public class casetriggerhandler {
    public static void populatelatestcasenum(list<case> caselist){
        list<account> acclist = new list<account>();
        
        for(case cs: caselist){
            if(cs.accountid != null){
                account acc = new account();
                acc.id =cs.accountid;
                acc.latest_case_number__c = cs.casenumber;
                acclist.add(acc);
            }
        }
        
        if(!acclist.isempty()){
            update acclist;
            
        }
    }
}