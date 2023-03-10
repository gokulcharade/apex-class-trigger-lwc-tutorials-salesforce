public class eight_loops {
	//five type loops
	//do while loop
    //while loop
	//for loop
	//for each loop
	public static void loopmethod(){
        integer i=0;
        do{
            system.debug('for do while loop: '+i);
            i++;
        }while(i<10);
        
        integer j=1;
        while(j<10){
            system.debug('for while loop: '+j);
        	j++;
        }
        
        for(integer k=0;k<10;k++){
            system.debug('for loop: ' +k);
        }
        
        list<string> strlist = new list<string>{'rohit','abhishek'};
        for(string str:strlist){
            system.debug(str);
        }
    }
}