public with sharing class CreatePersonAccountWithUser {
    
    public static void createPersonAccountWithUser(String firstName, String lastName, String email, String username, String password) {
        
        Savepoint sp = Database.setSavepoint(); // Savepoint for rollback
        
        try {
            // Create Person Account
            Account newAccount = new Account(
                RecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Person Account').getRecordTypeId(),
                FirstName = firstName,
                LastName = lastName,
                PersonEmail = email
            );
            
            insert newAccount;
            
            // Create User
            User newUser = new User(
                Username = username,
                Email = email,
                FirstName = firstName,
                LastName = lastName,
                Alias = username.substring(0, 8),
                TimeZoneSidKey = 'America/Los_Angeles',
                LocaleSidKey = 'en_US',
                EmailEncodingKey = 'UTF-8',
                LanguageLocaleKey = 'en_US',
                ProfileId = [SELECT Id FROM Profile WHERE Name='Standard User'].Id,
                ContactId = newAccount.Id,
                IsActive = true,
                UserRoleId = null,
                TimeZoneSidKey = 'America/Los_Angeles',
                LocaleSidKey = 'en_US'
            );
            
            insert newUser;
            
        } catch (Exception e) {
            Database.rollback(sp); // Rollback if any exception is thrown
            throw e;
        }
    }
}
