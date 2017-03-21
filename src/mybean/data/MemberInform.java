package mybean.data;
public class MemberInform{
   String logname,email,phone,backNews,birthday,address,nichen,sex; 
   public void setLogname(String name){
      logname=name;
   }
   public String getLogname(){
      return logname;
   }
   public void setEmail(String em){
      email=em;
   }
   public String getSex() {
	return sex;
}
public void setSex(String sex) {
	this.sex = sex;
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
public String getNichen() {
	return nichen;
}
public void setNichen(String nichen) {
	this.nichen = nichen;
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

   public String getBackNews(){
      return backNews;
   }
   public void setBackNews(String s){
      backNews=s;
   } 
}
