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
		String clientCheckcode = request.getParameter("validateCode");// ���տͻ���������ύ��������֤��
		String serverCheckcode = (String) request.getSession().getAttribute("checkcode");// �ӷ������˵�session��ȡ����֤��
		if (clientCheckcode.equals(serverCheckcode)) {// ���ͻ�����֤��ͷ���������֤�Ƚϣ������ȣ����ʾ��֤ͨ��
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
				backNews = logname + "�Ѿ���¼��";
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
								backNews = "��¼�ɹ�," + "��ӭ��! " + request.getParameter("logname");
								loginBean.setBackNews(backNews);
								loginBean.setSuccess(true);
								loginBean.setLogname(logname);
							} else {
								backNews = "��������û��������ڻ��������";
								loginBean.setBackNews(backNews);
								loginBean.setSuccess(false);
								loginBean.setLogname(logname);
								loginBean.setPassword(password);
							}
						} else {
							backNews = "��������û��������ڻ��������";
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
					RequestDispatcher dispatcher = request.getRequestDispatcher("showLoginMess.jsp");// ת��
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
								backNews = "��¼�ɹ�!" + "��ӭ�����Ա " + request.getParameter("logname");
								loginBean.setBackNews(backNews);
								loginBean.setSuccess(true);
								loginBean.setLogname(logname);
							} else {

								backNews = "��������û��������ڻ��������";
								loginBean.setBackNews(backNews);
								loginBean.setSuccess(false);
								loginBean.setLogname(logname);
								loginBean.setPassword(password);
							}
						} else {
							backNews = "��������û��������ڻ��������";
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
					RequestDispatcher dispatcher = request.getRequestDispatcher("showLoginMess.jsp");// ת��
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
