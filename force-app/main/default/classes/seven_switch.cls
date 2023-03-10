public class seven_switch {
    public static void switchmethod(string name){
        switch on name{
            when 'rohit'{
				system.debug('he is a salesforce developer');
            }
            when 'suraj'{
                system.debug('he is a java developer');
            }
            when else{
                system.debug('we dont have information about '+name);
            }
        }
    }
}