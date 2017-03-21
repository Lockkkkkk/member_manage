package myservlet.control;

import mybean.data.*;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class HandleChange extends HttpServlet {

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
		out.println(name);
		try {
			con = DriverManager.getConnection(uri, "root", "123");
			sql=con.createStatement();
			String condition="select * from member where logname='"+name+"'";
			ResultSet rs=sql.executeQuery(condition);
			while(rs.next())
			{
				out.print("<tr>");
				out.print("<td>"+rs.getString(1)+"<td>");
				out.print("<td>"+rs.getString(3)+"<td>");
				out.print("<td>"+rs.getString(4)+"<td>");
				out.print("<td>"+rs.getString(5)+"<td>");
				out.print("<td>"+rs.getString(6)+"<td>");
				out.print("<td>"+rs.getString(7)+"<td>");
				out.print("<td>"+rs.getString(8)+"<td>");
				out.print("</tr>");
			}
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("change.jsp");
		dispatcher.forward(request, response);
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
}
	
