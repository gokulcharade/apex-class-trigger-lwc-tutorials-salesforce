@istest
public class accounttriggerhandlertest {
   
    @istest
    public static void createrelatedopportunity(){
        //create sample data
        list<account> acclist = new list<account>();
            for(integer i=1;i<5;i++){
                account acc = new account();
                acc.name = 'Test'+i;
                acclist.add(acc);
            }
        
        //insert data
            test.starttest();
            insert acclist;
            test.stoptest();
        
         //assert
        	list<opportunity> opplist = [select id from opportunity where accountid =: acclist[0].id];
        	system.assert(opplist!=null, 'opportunity is not created');
        
    }
    
    @istest
    public static void createrealatedcontact(){
        //create sample data
        list<account> acclist = new list<account>();
            for(integer i=1;i<5;i++){
                account acc = new account();
                acc.name = 'Test'+i;
                acclist.add(acc);
            }
        	
        	//insert data
            test.starttest();
            insert acclist;
            test.stoptest();
        	
        //assert
        	list<contact> conlist = [select id from contact where accountid =: acclist[0].id];
        	system.assert(conlist!=null, 'contact is not created');
    }
    
    /*
    @istest
    public static void copybillingtoshippingtest(){
        //create sample data
        list<account> acclist = new list<account>();
            for(integer i=1;i<5;i++){
                account acc = new account();
                acc.name = 'Test'+i;
                acc.BillingCity = 'TestCity';
                acc.BillingCountry = 'TestCountry';
                acc.BillingState = 'TestState';
                acc.BillingStreet = 'TestStreet';
                acc.copybillingtoshipping__c = true;
                acclist.add(acc);
            }
        	
        	//insert data
            test.starttest();
            insert acclist;
            test.stoptest();
        
        	list<account> updatedacclist = [select id, shippingcity from account where id =: acclist[0].id];
        	system.assertEquals('TestCity', updatedacclist[0].shippingcity);
    }
    */
    
    @istest
    public static void copybillingtoshippingInserttest(){
        //create sample data
        list<account> acclist = new list<account>();
            for(integer i=1;i<5;i++){
                account acc = new account();
                acc.name = 'Test'+i;
                acc.BillingCity = 'TestCity';
                acc.BillingCountry = 'TestCountry';
                acc.BillingState = 'TestState';
                acc.BillingStreet = 'TestStreet';
                acc.copybillingtoshipping__c = true;
                acclist.add(acc);
            }
        	
        	//insert data
            test.starttest();
            insert acclist;
            test.stoptest();
        
        	list<account> updatedacclist = [select id, shippingcity from account where id =: acclist[0].id];
        	system.assertEquals('TestCity', updatedacclist[0].shippingcity);
    }
    
    @istest
    public static void copybillingtoshippingUpdatetest(){
        //create sample data
        list<account> acclist = new list<account>();
            for(integer i=1;i<5;i++){
                account acc = new account();
                acc.name = 'Test'+i;
                acc.BillingCity = 'TestCity';
                acc.BillingCountry = 'TestCountry';
                acc.BillingState = 'TestState';
                acc.BillingStreet = 'TestStreet';
                acclist.add(acc);
            }
        	
        
        	//insert data
            test.starttest();
            insert acclist;
        	for (Account acc: accList) {
            	acc.copybillingtoshipping__c = true;
        	}
        	update accList;
            test.stoptest();
        
        	list<account> updatedacclist = [select id, shippingcity from account where id =: acclist[0].id];
        	system.assertEquals('TestCity', updatedacclist[0].shippingcity);
    }


    @istest
    public static void updateratingtesst(){
        //create sample data
        list<account> acclist = new list<account>();
            for(integer i=1;i<5;i++){
                account acc = new account();
                acc.name = 'Test'+i;
                acc.industry = 'Media';
                acclist.add(acc);
            }
        	
        	//insert data
            test.starttest();
            insert acclist;
            test.stoptest();
			
        	//assert
        	list<account> updatedacclist = [select id, rating from account where id =: acclist[0].id];
        	system.assertequals('Hot',updatedacclist[0].rating);
  
    }
    
    @isTest
    public static void updateRatingUpdateTest() {
        //Create Sample Data
        List<Account> accList = new List<Account> ();
        for (Integer i=1;i<=5;i++){
            Account acc = new Account ();
            acc.Name = 'Test'+i;
            accList.add(acc);
        }
        //insert data
        Test.startTest();
        insert accList;
        
        for(Account acc: accList) {
            acc.Industry = 'Media';
        }
        
        update accList;
        Test.stopTest();
        List<Account> updatedAccList = [SELECT Id, Rating FROM Account WHERE Id =: accList[0].id];
        //apply assert condition
        System.assertEquals('Hot', updatedAccList[0]. Rating);
    }
    

    /*
	@istest
    public static void updateratingtesst(){
        //create sample data
        list<account> acclist = new list<account>();
            for(integer i=1;i<5;i++){
                account acc = new account();
                acc.name = 'Test'+i;
                acc.industry = 'Energy';
                acclist.add(acc);
            }
        	
        	//insert data
            test.starttest();
            insert acclist;
            test.stoptest();
			
        	//assert
        	list<account> updatedacclist = [select id, rating from account where id =: acclist[0].id];
        	system.assertequals('Hot',updatedacclist[0].rating);
  
    }
	*/
    
    @istest 
    private static void testcreatecontactoropp(){
        //create sample data
        list<account> acclist = new list<account>();
            for(integer i=1;i<10;i++){
                account acc = new account();
                acc.name = 'Test' + i;
                if(Math.mod(i,2) == 0){
                    acc.new_contact__c = true;
                }else{
                    acc.new_opportunity__c = true;
                    acc.Active__c = 'Yes';
                }
                
                acclist.add(acc);
            }
        	
        	//insert data
            test.starttest();
            insert acclist;
        	test.stopTest();

        
        	//asssert
        	list<contact> conlist = [select id from contact where accountid =: acclist[1].id];
        	list<opportunity> opplist = [select id from opportunity where accountid =: acclist[0].id];
        
        	system.assert(conlist != null, 'contact is not created');
        	system.assert(opplist != null, 'opportunity is not created');
        
        	 
        
    }
    
    
    @isTest
    private static void testUpdateAccDescOnPhoneUpdate() {
        List<Account> accList = new List<Account> ();
        
        for (Integer i=1;i<=5; i++) {
            Account acc = new Account ();
            acc.Name = 'Test'+i;
            acc.phone= '123456';
            accList.add(acc);
        }
        
        //inserted account records
        test.startTest();
        insert accList;
        
        //updated the account records
        for (Account acc: accList) {
            acc.Phone = '303030';
        }
        update accList;
        test.stopTest();
    	
        //query
        List<Account> updatedAccLIst = [SELECT Id, Phone FROM Account
                                        WHERE Id =: accList[0].Id];
        //assessrt
        System.assertEquals('303030', updatedAccList[0].Phone, 'Phone is not updated!!!');
    }
    
    @isTest
    public static void updateRelatedContactTest(){
        //Create Sample Data
        List<Account> accList = new List<Account>();
        List<Contact> conList = new List<Contact>();
        for (Integer i=1;i<=5; i++) {
            Account acc = new Account ();
            acc.Name = 'Test'+i;
            acc.Phone = '123456';
                accList.add(acc);
        }
        
        test.startTest();
        insert accList;
        
        for(Account acc: accList) {
                Contact con= new Contact(LastName = acc.Name);
                con.AccountId = acc.Id;
                conList.add(con);
        }
        
        insert conList;
            for(Account acc : accList) {
                acc.Phone = '654321';
            }
        update accList;
        test.stopTest();
        List<Contact> updatedConList = [SELECT Id, HomePhone FROM Contact
                                         WHERE Id=: conLIst[0].Id];
        System.assertEquals('654321', updatedConList[0].HomePhone);
        
    }
    
}