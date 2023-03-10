public with sharing class CreatePersonAccountWithUserController {
    @AuraEnabled(cacheable=false)
    public static void createPersonAccountWithUser(String firstName, String lastName, String email) {
            // Create Person Account
            Id RecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('PersonAccount').getRecordTypeId();
            
            Account newAccount = new Account();
            string userFirstName = firstName;
            string userLastName = lastName;
            string userEmail = email;
           
            newAccount.FirstName = userFirstName;
            newAccount.LastName = userLastName;
            newAccount.PersonEmail = userEmail;
            newAccount.RecordTypeId = RecordTypeId;

            insert newAccount;

            Account personAccount = [SELECT Id, PersonContactId, Name FROM Account WHERE Id =: newAccount.Id];
            Id userContactId = personAccount.PersonContactId;

            string profileName = 'Cloned Profile';
            Profile profile = [SELECT ID , Name FROM Profile WHERE Name =: profileName];
            Id profileId = profile.Id;

            // Create User
            User newUser = new User();
                newUser.Username = userEmail;
                newUser.Email = userEmail;
                newUser.FirstName = userFirstName;
                newUser.LastName = userLastName;
                newUser.Alias = userFirstName;
                newUser.TimeZoneSidKey = 'America/New_York'; // Use a specific time zone
                newUser.LocaleSidKey = 'en_US'; // Use a specific locale
                newUser.EmailEncodingKey = 'UTF-8'; // Use a specific email encoding
                newUser.LanguageLocaleKey = 'en_US'; // Use a specific language locale
                newUser.ProfileId = profileId;
                insert newUser;
    }
}
