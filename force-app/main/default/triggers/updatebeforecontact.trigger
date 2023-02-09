trigger updatebeforecontact on Contact (before insert,before update) {
    
    for(Contact c: trigger.new){
        c.Lastname = 'A'+c.Lastname;
    }
    
    

}