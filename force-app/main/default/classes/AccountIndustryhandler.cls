public class AccountIndustryhandler {

    public static void addingindustryinaccount(list<Account> acclist){
		for(Account acc: acclist)
        {
            if(acc.Industry == null)
            {
                acc.Industry = 'Agriculture';
            }
        }
    }
}