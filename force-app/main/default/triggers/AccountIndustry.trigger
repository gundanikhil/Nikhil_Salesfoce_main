trigger AccountIndustry on Account (before insert) {
    
    if(trigger.isbefore && trigger.isInsert)
    {
        AccountIndustryhandler.addingindustryinaccount(Trigger.new);
    }
    
    if(trigger.isbefore && trigger.isupdate)
    {
        AccountIndustryhandler.addingindustryinaccount(Trigger.new);
    }

}