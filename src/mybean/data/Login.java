package mybean.data;
public class Login{
   String  logname,password,backNews="";   
   boolean success=false; 
   boolean quanxian=false;
   public boolean isQuanxian() {
	return quanxian;
}
public void setQuanxian(boolean quanxian) {
	this.quanxian = quanxian;
}
public boolean isRand() {
	return rand;
}
public void setRand(boolean rand) {
	this.rand = rand;
}
boolean rand=false;
   public void setLogname(String name){
      logname=name;
   }
   public String getLogname(){
      return logname;
   }
   public void setPassword(String pw){
      password=pw;
   }
   public String getPassword(){
      return password;
   }
   public String getBackNews(){
      return backNews;
   }
   public void setBackNews(String s){
      backNews=s;
   } 
   public void setSuccess(boolean b){
      success=b;
   }
   public boolean getSuccess(){
      return success;
   }
}

