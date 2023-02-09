@isTest
public class AccountIndustryhandlertest {
    @isTest
    public static void industryaccountinserttest(){
        Account acc = new Account();
        acc.Name = 'Nikhil Industry test';
        acc.Phone = '9866174518';
        
        insert acc;
        Account updatedaccount = [select name,Industry from Account where id =: acc.id];
        system.debug('industry value is: '+updatedaccount.Industry);
    }

}