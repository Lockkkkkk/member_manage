package myservlet.control;
import mybean.data.*;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class HandleModifyMess extends HttpServlet{
   public void init(ServletConfig config) throws ServletException{
      super.init(config);
      try { Class.forName("com.mysql.jdbc.Driver");
      }
      catch(Exception e){} 
   }
   public String handleString(String s){
      try{  byte bb[]=s.getBytes("iso-8859-1");
            s=new String(bb);
      }
      catch(Exception ee){} 
      return s;  
   }
   public  void  doPost(HttpServletRequest request,HttpServletResponse response) 
                        throws ServletException,IOException{
      HttpSession session=request.getSession(true); 
      Login login=(Login)session.getAttribute("login");
      boolean ok=true; 
      if(login==null){
         ok=false; 
         response.sendRedirect("login.jsp");   
      }
      if(ok==true){
         continueDoPost(request,response);
      }
   }
   public  void   continueDoPost(HttpServletRequest request, HttpServletResponse response) 
                                throws ServletException,IOException{
      HttpSession session=request.getSession(true); 
      Login login=(Login)session.getAttribute("login");
      String logname=login.getLogname();
      Connection con; 
      Statement sql; 
      ModifyMessage modify=new ModifyMessage(); 
      request.setAttribute("modify",modify);
      String
      phone=request.getParameter("newPhone").trim(),
      birthday=request.getParameter("year")+"-"+request.getParameter("month")
    	      +"-"+request.getParameter("day"),
      address=request.getParameter("cmbProvince")+request.getParameter("cmbCity")+
        	  request.getParameter("cmbArea");
      address= new String(address.getBytes("iso-8859-1"), "utf-8");
      System.out.println(address);
      String email=request.getParameter("email")+request.getParameter("houzhui");
      email=new String(email.getBytes("iso-8859-1"),"utf-8");
      String nichen=request.getParameter("nichen");
      nichen=new String(nichen.getBytes("iso-8859-1"),"utf-8");
      String backNews="";
      try{ 
           String uri="jdbc:mysql://127.0.0.1/MakeFriend?"+
                       "user=root&password=123&characterEncoding=utf-8";
           con=DriverManager.getConnection(uri);
           String updateCondition="UPDATE member SET phone='"+
                                   phone+"',birthday='"+birthday+"',email='"+email+"',nichen='"+nichen+"',address='"+address+
                                   "' WHERE logname='"+logname+"'";
           sql=con.createStatement();
           int m=sql.executeUpdate(updateCondition);
           if(m==1){
                backNews="修改信息成功";
                modify.setBackNews(backNews);
                modify.setNichen(nichen);
                modify.setAddress(address);    
                modify.setNewPhone(phone);
                modify.setBirthday(birthday); 
                modify.setNewEmail(email);
           }
           else{
                backNews="信息填写不完整或信息中有非法字符";
                modify.setBackNews(backNews);  
           }
           con.close();
       }
       catch(SQLException exp){
           modify.setBackNews(""+exp); 
       }
       RequestDispatcher dispatcher=
       request.getRequestDispatcher("showModifyMess.jsp");
       dispatcher.forward(request, response);
   }
   public  void  doGet(HttpServletRequest request,HttpServletResponse response) 
                        throws ServletException,IOException{
      doPost(request,response);
   }
}
