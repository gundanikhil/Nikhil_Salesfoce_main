trigger TotalContacts on Contact (after insert) {
    
    //List<Contact> lstContact =Trigger.new;
    List<Contact> lstContact = new List<Contact>();
       lstContact=  Trigger.new;
    //integer concount = 0;
    //slist<Contact> con = new list<Contact>();
    
    Account objAccount = new Account();
    
    objAccount  = [select id,description 
                   	from Account 
                   where id =: lstcontact[0].accountid];

    objAccount.description = 'contact is created';
    
    update objAccount;

}