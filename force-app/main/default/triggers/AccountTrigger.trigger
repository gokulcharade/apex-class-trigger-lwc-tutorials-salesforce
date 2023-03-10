//trigger AccountTrigger on Account (before insert, before update) 
trigger AccountTrigger on Account (before insert, after insert,before update,after update){
    
    if (trigger.isinsert){
        if(trigger.isbefore){
            //accounttriggerhandler.updaterating(trigger.new);
            accounttriggerhandler.updaterating(trigger.new,null);
    		//accounttriggerhandler.copybillingtoshipping(trigger.new);
            accounttriggerhandler.copybillingtoshipping(trigger.new,null);
        
        }
        else if(trigger.isafter){ 
            //accounttriggerhandler.createrealatedcontact(trigger.new);
            //accounttriggerhandler.createrelatedopportunity(trigger.new);
            accounttriggerhandler.createcontactoropp(trigger.new);
        }
    }
    
    if (Trigger.isUpdate) {
		if(Trigger.isBefore) {
			accounttriggerhandler.updateAccDescOnPhoneUpdate(Trigger.New,Trigger.oldMap);
            accounttriggerhandler.copybillingtoshipping(trigger.new,Trigger.oldMap);
        	accounttriggerhandler.updaterating(trigger.new,trigger.oldmap);
		}
        else if(trigger.isafter){
    		accounttriggerhandler.updaterelatedcontacts(trigger.new,trigger.oldmap);
	        //accounttriggerhandler.updatecontactsmailingaddress(trigger.new,trigger.oldmap);
	        
        }
	}
    
    
}