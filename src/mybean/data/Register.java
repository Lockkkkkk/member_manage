package mybean.data;
public class Register{
   String logname="",password="",email="", phone="", message="",nichen="", birthday="",address="";
   public String getNichen() {
	return nichen;
}
public String getBirthday() {
	return birthday;
}
public void setBirthday(String birthday) {
	this.birthday = birthday;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public void setNichen(String nichen) {
	this.nichen = nichen;
}
String backNews; 
   public boolean isSuccess() {
	return success;
}
public void setSuccess(boolean success) {
	this.success = success;
}
boolean success=false;
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
   public void setEmail(String em){
      email=em;
   }
   public String getEmail(){
      return email;
   }
   public void setPhone(String ph){
      phone=ph;
   }
   public String getPhone(){
      return phone;
   }
   public String getMessage(){
      return message;
   } 
   public void setMessage(String m){
      message=m;
   } 
   public String getBackNews(){
      return backNews;
   }
   public void setBackNews(String s){
      backNews=s;
   } 
}
