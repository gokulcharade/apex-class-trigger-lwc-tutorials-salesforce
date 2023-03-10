@isTest
public class AccountCalculatorTest {
    @isTest
    private static void countContactsTest(){
        List<Account> accList = new List<Account>();
        
        for(Integer i=0; i<250; i++){
            accList.add(new Account(Name='Test'+i));
        }
        insert accList;
        
        List<Contact> conList = new List<Contact>();
        List<Id> accIds = new List<Id>();
        for(Account acc: accLIst){
            conList.add(new Contact (FirstName ='Test', LastName=acc.Name, AccountId=acc.Id));
            accids.add(acc.id);
         }
                        
         insert conList;         
         Test.startTest();
         AccountCalculator.countContacts(accids);
         Test.stopTest();
         List<Account> accs = [SELECT Id, number_of_contacts__c FROM Account];

          system.assertEquals(1,accs[0].number_of_contacts__c, 'contacts are not counted successfully');      
    }
}