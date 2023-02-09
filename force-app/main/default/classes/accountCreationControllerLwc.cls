public with sharing class accountCreationControllerLwc {    


//Account search method
 @AuraEnabled(cacheable=true)
 public static List<account> getAccountFrom (String actName){
     String KeyString = '%' +  actName + '%';
     return [Select Id, Name From Account Where Name like:KeyString];
 }
 


}