public class accounttriggerhandler {
    
 
    public static void updateRating (List<Account> accList, Map<Id, Account> oldMap) {
        for (Account acc : accList) {
            if((oldMap== null && acc.Industry != null && acc.Industry == 'Media')
               || (acc.Industry != null && acc.Industry == 'Media'
                   && acc.Industry != oldMap.get (acc.Id).Industry )){
                       acc.Rating = 'Hot';
                   }
        }
    }
    
    /*
    public static void updaterating(list<account> acclist){
        for(account acc : acclist){
            if(acc.industry=='Media'||acc.industry=='Energy'){
                acc.rating = 'Hot';
            }
        }
    }
	*/
    
    public static void copybillingtoshipping(List<Account> accList, Map<Id,Account> oldMap) {
        for(Account acc : accList) {
            if((oldMap == null && acc.CopyBillingToShipping__c)
               || (acc.CopyBillingToShipping__c
                   && acc.CopyBillingToShipping__c != oldMap.get (acc.Id).CopyBillingToShipping__c) ) {
                       acc.ShippingCity = acc.BillingCity;
                       acc.ShippingCountry = acc.BillingCountry;
                       acc.ShippingPostalCode = acc.BillingPostalCode;
                       acc.ShippingState = acc.BillingState;
                       acc.ShippingStreet = acc.BillingStreet;
                   }
        }
    }
    
    /*
    public static void copybillingtoshipping(list<account> acclist){
          for(account acc : acclist){
            if(acc.CopyBillingToShipping__c){
                acc.ShippingCity = acc.BillingCity;
                acc.ShippingCountry = acc.BillingCountry;
                acc.ShippingPostalCode = acc.BillingPostalCode;
                acc.ShippingState = acc.BillingState;
                acc.ShippingStreet = acc.BillingStreet;
            }
        }
    }
	*/

    public static void createrelatedopportunity(list<account> acclist){
        list<opportunity> opplist = new list<opportunity>();
        for (account acc : acclist){
            opportunity opp=new opportunity();
            opp.name = acc.name;
            opp.stagename = 'Prospecting';
            opp.closedate = system.today();
            opp.accountid = acc.id;
            opplist.add(opp);
        }
        if(!opplist.isempty()){
            insert opplist;
            
        }
    }
	    
    public static void createrealatedcontact(list<account> acclist){
        list<contact> conlist = new list <contact>();
            for(account acc: acclist){
            contact con = new contact();
            con.firstName = 'Test FName';
            con.lastName = 'Test LName'+ acc.name;
            con.accountid = acc.id;
            conlist.add(con);
        }
        if(!conlist.isempty()){
            insert conlist;
        }
    }
    
    public static void createcontactoropp(list<account> acclist){
        list<contact> conlist = new list<contact>();
        list<opportunity> opplist = new list<opportunity>();
        
        for(account acc:acclist){
            //contact
            if(acc.new_contact__c){
                contact con = new contact();
                con.firstname ='Test' + acc.name;
                con.lastname = 'Test' + acc.name;
                con.accountid = acc.id;
                conlist.add(con);
            }
            //opportunity
            if(acc.new_opportunity__c && acc.Active__c == 'yes'){
                opportunity opp = new opportunity();
                opp.name = acc.name;
                opp.stagename = 'Prospecting';
                opp.closedate = system.today();
                opp.AccountId = acc.id;
                opplist.add(opp);
            }
        }
        
        if(!conlist.isempty()){
            insert conlist;
        }
        if(opplist.size()>0){
            insert opplist;
        }
    }
    
    public static void updateAccDescOnPhoneUpdate (List<Account> accList, Map<Id,Account> oldAccMap){
		for(account acc: accList) {
            if(acc.Phone != oldAccMap.get (acc.Id).Phone) {
                acc.Description = 'Phone is Updated! Old Value:' + oldAccMap.get (acc.Id). Phone + ' & New Value:' + acc.Phone;
			}
		}
    }
    
    /*
    public static void updaterelatedcontacts (List<Account> accList, Map<Id,Account> oldAccMap){
        List<Contact> conlist = new List<Contact>();
        Map<Id,Account> accToAccountMap = new Map<Id,Account>();
        
        for(Account acc : accList) {
            if(acc.Phone != null && acc.Phone != oldAccMap.get(acc.Id).Phone && oldAccMap != null) {
                accToAccountMap.put(acc.Id, acc);
            }
		}
        
        if(accToAccountMap.size() > 0) {
            for(Contact con: [SELECT Id, HomePhone, AccountId FROM Contact
                               WHERE AccountId IN: accToAccountMap.keySet()]) {
            if(accToAccountMap.containsKey (con.AccountId)) {
                con.HomePhone = accToAccountMap.get (con.AccountId).Phone;
                conlist.add(con);
            	}
            }
        }

        if(conlist.size()>0){
            update conlist;
        }
    }
    */
    
    public static void updaterelatedcontacts (List<Account> accList, Map<Id,Account> oldAccMap){
        List<Contact> conlist = new List<Contact>();
        //Map<Id,Account> accToAccountMap = new Map<Id,Account>();
        set<id> accids = new set<id>();
        
        for(Account acc : accList) {
            if(acc.Phone != null && acc.Phone != oldAccMap.get(acc.Id).Phone && oldAccMap != null) {
                //accToAccountMap.put(acc.Id, acc);
                accids.add(acc.id);
            }
		}
        
        //using map
        /*
        if(accids.size() > 0) {
            for(Contact con: [SELECT Id, HomePhone, AccountId FROM Contact
                               WHERE AccountId IN: accToAccountMap.keySet()]) {
            if(accToAccountMap.containsKey (con.AccountId)) {
                con.HomePhone = accToAccountMap.get (con.AccountId).Phone;
                conlist.add(con);
            	}
            }
        }
		*/
        
        
        
        //using parent to child sql
        for(account acc: [select id,phone,(select homephone from contacts)
                          from account where id in:accids ]){
                              if(acc.contacts !=null){
                                  for(contact con : acc.contacts){
                                      con.homephone = acc.phone;
                                      conlist.add(con);
                                  }
                              }
                          } 
        
        if(conlist.size()>0){
            update conlist;
        }
    }
    
    /*
    public static void updatecontactsmailingaddress(List<Account> accList, Map<Id,Account> oldAccMap){
        Map<Id, Account> accToAccountMap = new Map<Id, Account> ();
         list<contact> conlist = new list<contact>();
                          
        for (Account acc : accList) {
            if((acc.BillingCity != oldMap.get(acc.id).BillingCity
                ||acc.BillingCountry != oldMap.get(acc.id).Billing Country
                ||acc.BillingPostal Code != oldMap.get (acc.id).BillingPostal Code
                ||acc.BillingState != oldMap.get (acc.id).Billingstate
                ||acc.BillingStreet != oldMap.get (acc.id).BillingStreet)
               && oldMap!=null){
                   accToAccountMap.put(acc.id, acc);
               }
        }
        
        for (Contact con: [SELECT ID, AccountId FROM Contact
                           WHERE AccountId IN: accToAccountMap.keySet()]){
                               if(acctoaccountmap.containskey(con.accountid)){
                                   con.mailingcity = acctoaccountmap.get(con.accountid).bilingcity;
                                   con.mailingcountry = acctoaccountmap.get(con.accountid).bilingcountry;
                               	   con.mailingpostalcode = acctoaccountmap.get(con.accountid).bilingpostalcode;
                               	   con.mailingstate = acctoaccountmap.get(con.accountid).bilingstate;
                                   con.mailingstreet = acctoaccountmap.get(con.accountid).bilingstreet;
                               }
                               conlist.add(con);
                               
                           }
        if(!conlist.isempty()){
            update conlist;
        }
    }
	*/
    
}