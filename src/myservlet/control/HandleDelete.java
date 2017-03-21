package myservlet.control;

import mybean.data.*;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class HandleDelete extends HttpServlet {

	public void init(ServletConfig config) throws ServletException {

		super.init(config);
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		Connection con = null;
		Statement sql = null;
		String uri = "jdbc:mysql://127.0.0.1/MakeFriend";
		String name = request.getParameter("username");
		String backNews = "";
		try {
			con = DriverManager.getConnection(uri, "root", "123");
			sql = con.createStatement();
			int rs = sql.executeUpdate("delete from member where logname='" + name + "'");
			if (rs != 0) {
				out.print("<script> alert('success!');window.location.href='choiceLookType.jsp'</script>");
			} else
				out.print("<script> alert('false!');window.location.href='choiceLookType.jsp'</script>");
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
}
