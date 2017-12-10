@IsTest
public class AddPrimaryContactTest {
    
  @IsTest
  public static void testing() {
    List<account> accounts = new List<account>();
    for (Integer i=0; i<50;i++) {
      account a = new account(name=string.valueOf(i),billingstate='NY');
      system.debug('account a = '+a);
      accounts.add(a);
    }
    for (Integer i=0; i<50;i++) {
      account a = new account(name=string.valueOf(50+i),billingstate='CA');
      system.debug('account a = '+a);
      accounts.add(a);
    }      
    insert accounts;
    Test.startTest();
    contact c = new contact(lastname='alex');
    AddPrimaryContact apc = new AddPrimaryContact(c,'CA');
    system.debug('apc = '+apc);
    System.enqueueJob(apc);
    Test.stopTest();
    List<contact> contacts = new List<contact>([select id from contact]);
    Integer size = contacts.size();
    system.assertEquals(50, size);
  }
}