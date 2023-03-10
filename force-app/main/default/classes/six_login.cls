Public Class six_login{  
  Public static void logi(string loginName, string Password){
     string Lname  = 'Nitesh31';
     string Pword  = 'CricBuzz';

  If (Lname != loginName && Pword != Password){
     system.debug('Incorrect LoginName or Password');  
       }
      else if(Lname != loginName) {
          system.debug('LoginName is Wrong');
      } 
      else if (Pword != Password){
          system.debug('Password is Wrong'); 
      }
      
  else {
     system.debug('You have logged in'); 
       }  
    }
  }