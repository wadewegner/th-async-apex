@isTest
private class AccountProcessorTest {

  public static testmethod void TestAccountProcessorTest()
  {
    Account a = new Account();
    a.Name = 'Test Account';
    Insert a;

    Contact cont = New Contact();
    cont.FirstName ='Wade';
    cont.LastName ='Wegner';
    cont.AccountId = a.Id;
    Insert cont;
    
    list<Id> setAccId = new List<Id>();
    setAccId.add(a.id);

    Test.startTest();
      AccountProcessor.countContacts(setAccId);
    Test.stopTest();
    
    Account ACC = [select Number_of_Contacts__c from Account where id = :a.id LIMIT 1];
    System.assertEquals ( Integer.valueOf(ACC.Number_of_Contacts__c) ,1);
  }
}