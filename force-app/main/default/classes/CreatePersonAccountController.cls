public with sharing class CreatePersonAccountController {
    // public CreatePersonAccountController() {

    // }

    @AuraEnabled
    public static Id createPersonAccount(String firstName, String lastName, String email, String phone) {
        Account account = new Account();
        account.RecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Person Account').getRecordTypeId();
        account.FirstName = firstName;
        account.LastName = lastName;
        account.PersonEmail = email;
        account.PersonMobilePhone = phone;
        insert account;
        return account.Id;
    }
}