@istest
public class opportunitytriggerhandlertest {
    
    
	@istest
    public static void updatdesctest(){
        //create data
        list<opportunity> opplist = new list<opportunity>();
        
        for(integer i=1;i<=5;i++){
            opportunity opp = new opportunity();
            opp.name = 'testopp'+i;
            opp.stagename = 'prospecting';
            opp.closedate = system.today();
            opp.amount = 200000;
            opplist.add(opp);
        }
        test.starttest();
        insert opplist;
        test.stoptest();
        
        list<opportunity> updatedopplist = [select id, description from opportunity where id =: opplist[0].id];
        //system.assertequals('hot opportunity',updatedopplist[0].description);
        system.assertequals('Opportunity is Open',updatedopplist[0].description);
        
    }
	
    
    @istest
    private static void testpopulatelatestoppamt(){
        list<account> acclist = new list<account>();
        list<opportunity> opplist = new list<opportunity>();
        
        for(integer i=1;i<=5;i++){
            account acc = new account();
            acc.name = 'Test' + i;
            acclist.add(acc);
        }
        insert acclist;
        
        for(Account acc: acclist){
            opportunity opp = new opportunity();
            opp.name = acc.name;
            opp.stagename = 'Prospecting';
            opp.closedate = system.today();
            opp.amount = 200000;
            opp.accountid = acc.id;
            opplist.add(opp);
        }
        
        test.starttest();
        insert opplist;
        test.stoptest();
        
        list<account> updatedacc = [select id, latest_opp_amount__c from account where id =: acclist[0].id];
        system.assertequals(200000, updatedacc[0].latest_opp_amount__c);
        system.assertequals(opplist[0].amount, updatedacc[0].latest_opp_amount__c);
   
    }
    
    
    @isTest
    private static void updateDescBasedOnStageInsertTest() {
        //Create Data
        List<Opportunity> oppList = new List<Opportunity>();
        
        for (Integer i=1;i<=5; i++){
            Opportunity opp = new Opportunity();
            opp.Name = 'TestOpp'+i;
            opp.StageName= 'Prospecting';
            opp.CloseDate= System.today();
            opp.Amount = 200000;
            oppList.add(opp);
        }	
        Test.startTest();
        insert oppList;
        
         
        Test.stopTest();
        
        List<Opportunity> updatedOppList = [SELECT Description FROM Opportunity
                                            WHERE Id =: oppLIst [0].Id];
        System.assertEquals('Opportunity is Open', updatedopplist[0].description);
    }
	
    
     @isTest
    private static void updateDescBasedOnStageupdateTest() {
        //Create Data
        List<Opportunity> oppList = new List<Opportunity>();
        
        for (Integer i=1;i<=5; i++){
            Opportunity opp = new Opportunity();
            opp.Name = 'TestOpp'+i;
            opp.StageName= 'Prospecting';
            opp.CloseDate= System.today();
            opp.Amount = 200000;
            oppList.add(opp);
        }	
        Test.startTest();
        insert oppList;
        for(opportunity opp: opplist){
            opp.stagename = 'Closed Won';
        }
        
        update opplist; 
        Test.stopTest();
        
        List<Opportunity> updatedOppList = [SELECT Description FROM Opportunity
                                            WHERE Id =: oppLIst [0].Id];
        System.assertEquals('Opportunity is closed Won', updatedopplist[0].description);
    }
    
}