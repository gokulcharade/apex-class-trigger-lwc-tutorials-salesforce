public class UpdateParentAccount implements Queueable {
    private List<Account> accList;
    private Id parentAccid;
    
    public UpdateParentAccount(List<Account> accRecords, Id id){ 
        this.accList = accRecords;
        this.ParentAccId = id;
    }
    
	public void execute(QueueableContext context){ 
            for(Account acc: accList){
                acc.ParentId = parentAccId;
            }
            update accList;
        }
}

/*
List<Account> accList = [SELECT Id FROM Account 
                        WHERE billingstate ='NY'];
Id parentId = [SELECT Id FROM Account
                                                           WHERE Name='Account 025'][0]. Id;
UpdateParentAccount updateJob= new UpdateParent Account (accList, parentId); 
Id jobId = System.enqueue Job (updateJob);


*/