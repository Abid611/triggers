trigger contactTrigger on Contact (after insert, after update) {
	
    if(Trigger.isAfter){
        
        if(Trigger.isInsert || Trigger.isUpdate){
            
            Set<Id> accToUpdate = new Set<Id>();
            
            for(Contact con: Trigger.New){
                accToUpdate.add(con.AccountId);
            }
            
            //now I have to update the field on the account object Total_Contact__c	
            //
            List<Account> accWithContact = [SELECT ID,Total_Contact__c FROM ACCOUNT WHERE ID IN: accToUpdate];
            List<Account> accList = new List<Account>();
            for(Account acc: accWithContact){
                acc.Total_Contact__c = acc.Total_Contact__c + 1;
                accList.add(acc);
            }
            
            update accList;
        }
        
      
            
           
        
    }
    
    
}