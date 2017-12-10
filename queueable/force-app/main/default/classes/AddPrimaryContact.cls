public class AddPrimaryContact implements Queueable {
     
  private Contact contact;
  private String state;
    
  public AddPrimaryContact(Contact record, String state) {
    this.contact = record;
    this.state = state;
  }

  public void execute(QueueableContext context) {
    List<Account> accounts = new List<account>([select id, name, BillingState from account where account.BillingState = :this.state limit 200]);
    List<contact> contacts = new List<contact>();
    for(account a: accounts) {
      contact c = new contact();
      c = this.contact.clone(false, false, false, false);
      c.AccountId = a.Id;
      contacts.add(c);
    }
    insert contacts;
  }
}
