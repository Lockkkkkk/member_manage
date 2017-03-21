package myservlet.control;

import mybean.data.*;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class HandleLogin extends HttpServlet {
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
		}
	}

	public String handleString(String s) {
		try {
			byte bb[] = s.getBytes("iso-8859-1");
			s = new String(bb);
		} catch (Exception ee) {
		}
		return s;
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String clientCheckcode = request.getParameter("validateCode");// 接收客户端浏览器提交上来的验证码
		String serverCheckcode = (String) request.getSession().getAttribute("checkcode");// 从服务器端的session中取出验证码
		if (clientCheckcode.equals(serverCheckcode)) {// 将客户端验证码和服务器端验证比较，如果相等，则表示验证通过
			String quanxian = request.getParameter("quanxian");
			String rand = request.getParameter("rand");
			Connection con;
			Statement sql;
			Login loginBean = null;
			String backNews = "";
			HttpSession session = request.getSession(true);
			try {
				loginBean = (Login) session.getAttribute("login");
				if (loginBean == null) {
					loginBean = new Login();
					session.setAttribute("login", loginBean);
				}
			} catch (Exception ee) {
				loginBean = new Login();
				session.setAttribute("login", loginBean);
			}
			String logname = request.getParameter("logname").trim(), password = request.getParameter("password").trim();
			boolean ok = loginBean.getSuccess();
			logname = handleString(logname);
			password = handleString(password);
			if (ok == true && logname.equals(loginBean.getLogname())) {
				backNews = logname + "已经登录了";
				loginBean.setBackNews(backNews);
			} else {
				if (quanxian.equals("user")) {
					loginBean.setQuanxian(false);
					String uri = "jdbc:mysql://127.0.0.1/MakeFriend";
					boolean boo = (logname.length() > 0) && (password.length() > 0);
					try {
						con = DriverManager.getConnection(uri, "root", "123");
						String condition = "select * from member where logname = '" + logname + "' and password ='"
								+ password + "'";
						sql = con.createStatement();
						if (boo) {
							ResultSet rs = sql.executeQuery(condition);
							boolean m = rs.next();
							if (m == true) {
								backNews = "登录成功," + "欢迎你! " + request.getParameter("logname");
								loginBean.setBackNews(backNews);
								loginBean.setSuccess(true);
								loginBean.setLogname(logname);
							} else {
								backNews = "您输入的用户名不存在或密码错误";
								loginBean.setBackNews(backNews);
								loginBean.setSuccess(false);
								loginBean.setLogname(logname);
								loginBean.setPassword(password);
							}
						} else {
							backNews = "您输入的用户名不存在或密码错误";
							loginBean.setBackNews(backNews);
							loginBean.setSuccess(false);
							loginBean.setLogname(logname);
							loginBean.setPassword(password);
						}
						con.close();
					} catch (SQLException exp) {
						backNews = "" + exp;
						loginBean.setBackNews(backNews);
						loginBean.setSuccess(false);
					}
					if(loginBean.getSuccess()==true)
					{
					RequestDispatcher dispatcher = request.getRequestDispatcher("showLoginMess.jsp");// 转发
					dispatcher.forward(request, response);}
					else out.print("<script> alert('password error !');window.location.href='login.jsp'</script>");
				}

				else {
					loginBean.setQuanxian(true);
					String uri = "jdbc:mysql://127.0.0.1/MakeFriend";
					boolean boo = (logname.length() > 0) && (password.length() > 0);
					try {
						con = DriverManager.getConnection(uri, "root", "123");
						String condition = "select * from admin where admin = '" + logname + "' and password ='"
								+ password + "'";
						sql = con.createStatement();
						if (boo) {
							ResultSet rs = sql.executeQuery(condition);
							boolean m = rs.next();
							if (m == true) {
								backNews = "登录成功!" + "欢迎你管理员 " + request.getParameter("logname");
								loginBean.setBackNews(backNews);
								loginBean.setSuccess(true);
								loginBean.setLogname(logname);
							} else {

								backNews = "您输入的用户名不存在或密码错误";
								loginBean.setBackNews(backNews);
								loginBean.setSuccess(false);
								loginBean.setLogname(logname);
								loginBean.setPassword(password);
							}
						} else {
							backNews = "您输入的用户名不存在或密码错误";
							loginBean.setBackNews(backNews);
							loginBean.setSuccess(false);
							loginBean.setLogname(logname);
							loginBean.setPassword(password);
						}
						con.close();
					} catch (SQLException exp) {
						backNews = "" + exp;
						loginBean.setBackNews(backNews);
						loginBean.setSuccess(false);
					}
					if(loginBean.getSuccess()==true){
					RequestDispatcher dispatcher = request.getRequestDispatcher("showLoginMess.jsp");// 转发
					dispatcher.forward(request, response);}
					else 
						out.print("<script> alert('password error!');window.location.href='login.jsp'</script>");
				}
			}

		} else {
			out.print("<script> alert('error!');window.location.href='login.jsp'</script>");
		}
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
}
