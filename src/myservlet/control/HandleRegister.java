package myservlet.control;

import mybean.data.*;
import java.sql.*;
import java.io.*;
import java.net.URLDecoder;

import javax.servlet.*;
import javax.servlet.http.*;

public class HandleRegister extends HttpServlet {
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
		if (clientCheckcode.equals(serverCheckcode)) {
			Connection con;
			Statement sql;
			Register reg = new Register();
			request.setAttribute("register", reg);
			String logname = request.getParameter("logname"), sex = request.getParameter("sex"),
					password = request.getParameter("password"), phone = request.getParameter("phone"),
					birthday = request.getParameter("year") + "-" + request.getParameter("month") + "-"
							+ request.getParameter("day");
			String address = request.getParameter("cmbProvince") + request.getParameter("cmbCity")
					+ request.getParameter("cmbArea"),
					email = request.getParameter("email") + request.getParameter("houzhui"),
					nichen = request.getParameter("nichen");

			if (logname == null)
				logname = "";
			if (password == null)
				password = "";
			boolean isLD = true;
			for (int i = 0; i < logname.length(); i++) {
				char c = logname.charAt(i);
				if (!((c <= 'z' && c >= 'a') || (c <= 'Z' && c >= 'A') || (c <= '9' && c >= '0')))
					isLD = false;
			}
			boolean boo = logname.length() > 0 && password.length() > 0 && isLD;
			String backNews = "";
			try {
				logname = handleString(logname);
				password = handleString(password);
				phone = handleString(phone);
				sex = handleString(sex);
				birthday = handleString(birthday);
				address = new String(address.getBytes("iso-8859-1"), "utf-8");
				nichen = new String(nichen.getBytes("iso-8859-1"), "utf-8");
				email = new String(email.getBytes("iso-8859-1"), "utf-8");
				System.out.println(email);
				System.out.println(nichen);
				String pic = "public.jpg";
				String insertRecord = "('" + logname + "','" + password + "','" + email + "','" + nichen + "','" + phone
						+ "','" + sex + "','" + pic + "','" + birthday + "','" + address + "')";
				String uri = "jdbc:mysql://127.0.0.1/makefriend?" + "user=root&password=123&characterEncoding=utf-8";
				con = DriverManager.getConnection(uri);
				String insertCondition = "INSERT INTO member (logname,password,email,nichen,phone,sex,pic,birthday,address) VALUES "
						+ insertRecord;
				sql = con.createStatement();
				if (boo) {
					int m = sql.executeUpdate(insertCondition);
					if (m != 0) {
						backNews = "恭喜你，注册成功";
						reg.setBackNews(backNews);
						reg.setLogname(logname);
						reg.setNichen(nichen);
						reg.setAddress(address);
						reg.setBirthday(birthday);
						reg.setPhone(phone);
						reg.setSuccess(true);
					}
				} else {
					backNews = "信息填写不完整或名字中有非法字符";
					reg.setBackNews(backNews);
					reg.setSuccess(false);
				}
				con.close();
			} catch (SQLException exp) {
				backNews = "该会员名已被使用，请您更换名字";
				reg.setBackNews(backNews);
				reg.setSuccess(false);
			}
			if(reg.isSuccess()==true)
				out.print("<script> alert('success!');window.location.href='login.jsp'</script>");
		}
		else {
			out.print("<script> alert('validateCode false!');window.location.href='register.jsp'</script>");
	}
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
}
