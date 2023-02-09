trigger AccountTrigger on Account (before insert, before update, After Insert) {
    
    if(Trigger.isAfter && Trigger.isInsert)
    {
        list<Contact> contlist = new list<contact>();
        for(Account Act1: Trigger.new)
        {
            contact con = new contact();
            con.LastName = Act1.Name;
            con.AccountId=Act1.Id;
            contlist.add(con);
        }
        if(contlist.size()>0)
        {
            insert contlist;
        }
    }
    
    if(Trigger.isBefore && Trigger.isUpdate)
    {
        for(Account AccRecnew: Trigger.new)
        {
            Account Accoldrec = Trigger.oldMap.get(AccRecnew.id);
            if(AccRecnew.Name != Accoldrec.Name)
            {
                AccRecnew.addError('Account name cannot be change once it is created');
            }
        }
    }
    
    
    if(Trigger.isBefore && (Trigger.isInsert||Trigger.isUpdate))
    {
        	for(Account accRec:Trigger.new)
            {
                if(accRec.ShippingCountry == null)
                {
                	accRec.ShippingCountry = accRec.BillingCountry;
                }
                if(accRec.ShippingCity == null)
                {
                accRec.ShippingCity = accRec.BillingCity;
                }
                if(accRec.ShippingState == null)
                {                    
                    accRec.ShippingState = accRec.Billingstate;
                }
                if(accRec.ShippingStreet==null)
                {
                accRec.ShippingStreet=accRec.BillingStreet;
                }
                if(accRec.ShippingPostalCode == null)
                {
                accRec.ShippingPostalCode=accRec.BillingPostalCode;
                }
            }
    }
    
    if(Trigger.isBefore && Trigger.isInsert)
    {
        for(Account act: Trigger.new)
        {
         if(act.AnnualRevenue<1000)
         {
             act.addError('Annual Revenue Cannot be less than 1000');
         }
        }
    }
    
    if(trigger.isAfter && trigger.isUpdate)
    {
        set<id> accidbillingchnaged = new set<id>();
        for(Account Act2: Trigger.new)
        {
            Account oldact = Trigger.oldMap.get(Act2.id);
                if(Act2.BillingStreet != oldact.BillingStreet)
            {
		           accidbillingchnaged.add(Act2.id);     
            }
        }
        
        list<Account> accwithcontact = [select id,name,(select id,name from contacts)from Account where ID in: accidbillingchnaged];
        list<Contact> contlist = new list<contact>();
        
        for(Account act:accwithcontact)
        {
            list<Contact> contlist2 = act.Contacts;
            for(contact con: contlist2)
            {
                con.MailingStreet = act.BillingStreet;
                con.MailingState = act.BillingState;
                con.MailingCountry=act.BillingCountry;
				con.MailingCity=act.BillingCity;
                contlist.add(con);
            }
        }
        
        if(contlist.size()>0)
        {
            update contlist;
        }
    }

}