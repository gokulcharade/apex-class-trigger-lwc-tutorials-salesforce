@istest
public class casetriggerhandlertest {
	@istest
    private static void testpopulatelatestcasenum(){
        list<account> acclist = new list<account>();
        list<case> caselist = new list<case>();
        
        for(integer i=1;i<5;i++){
            account acc= new account();
            acc.name = 'test' + i;
            acclist.add(acc);
        }
        
        insert acclist;
        
        for(account acc:acclist){
            case cs = new case();
            cs.Status = 'New';
            cs.Origin = 'Phone';
            cs.AccountId = acc.id;
            caselist.add(cs);
        }
        
        test.startTest();
        insert caseList;
        test.stopTest();
        
        list<account> updatedacc = [select id,latest_case_number__c from account where id =:acclist[0].id];
		list<case> newcaselist = [select id,casenumber from case where id =: caselist[0].id];
        system.assertequals(newcaselist[0].casenumber, updatedacc[0].latest_case_number__c);
    }
}