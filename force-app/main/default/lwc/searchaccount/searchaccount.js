import { LightningElement, track, wire } from 'lwc';
import getAccounts from '@salesforce/apex/accountCreationControllerLwc.getAccountFrom';
const DELAY = 100;
export default class SearchAccount extends LightningElement {
  accountName = '';
  @track accountList= [];
  @wire (getAccounts,{actName:'$accountName'})
  retrieveAccounts({error, data}){
      if(data){
          this.accountList=data;          
      }
      else if(error){

      }
      
  }


  handleKeyChange(event){
      //this.accountName = event.target.value;
      const searchString = event.target.value;
      window.clearTimeout(this.delayTimeout);
      this.delayTimeout = setTimeout(() => {
          this.accountName = searchString; 
      }, DELAY);
  }

}