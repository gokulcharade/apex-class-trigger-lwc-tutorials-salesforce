trigger opportunitytrigger on Opportunity (before insert, after insert, before update) {
    if(trigger.isinsert){
        if(trigger.isbefore){
            opportunitytriggerhandler.updatedescription(trigger.new);
            opportunitytriggerhandler.updatedescriptionbasedonstage(trigger.new,null);
       
        }
        else if(trigger.isafter){
             opportunitytriggerhandler.populatelatestoppamt(trigger.new); 
        } 
	}
    
      if(trigger.isupdate){
        if(trigger.isbefore){
             opportunitytriggerhandler.updatedescriptionbasedonstage(trigger.new,trigger.oldmap);
        }
	}
}