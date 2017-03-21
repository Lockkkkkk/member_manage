<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="mybean.data.ModifyMessage"%>
<%@ page import="java.sql.*"%>
<HEAD>
<link rel="stylesheet" type="text/css" href="css/common.css" />
<link rel="stylesheet" type="text/css" href="css/main.css" />
<link rel="stylesheet" type="text/css" href="css/css.css" />
<jsp:useBean id="login" class="mybean.data.Login" scope="session" />

<style type="text/css">
.font2 {
	margin: 0px;
	padding: 0px;
	background-color: #E7EAEB;
	font-family: "微软雅黑", "黑体", "宋体";
	font-size: 30px;
	height: 15px;
	opacity: 0.9;
}

.font111 {
	color: #fff;
}

.top {
	height: 60px;
	line-height: 20px;
	background: url(image/bg2.png);
}
</style>
<script type="text/javascript">
	//时间的js
	function updateDate() {
		document.getElementById('time').innerHTML = new Date().toLocaleString()
				+ " 星期" + "日一二三四五六".charAt(new Date().getDay());
	}
	setInterval("updateDate();", 1000);
</script>
</HEAD>
<HTML>

<%
	String name = request.getParameter("username");
	String email = request.getParameter("email") + request.getParameter("houzhui");
	String nichen = request.getParameter("nichen");
	String birthday = request.getParameter("year") + "-" + request.getParameter("month") + "-"
			+ request.getParameter("day");
	String address = request.getParameter("cmbProvince") + request.getParameter("cmbCity")
			+ request.getParameter("cmbArea");
	address = new String(address.getBytes("iso-8859-1"), "utf-8");
	nichen = new String(nichen.getBytes("iso-8859-1"), "utf-8");
	email = new String(email.getBytes("iso-8859-1"), "utf-8");
	String phone = request.getParameter("phone");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con;
	Statement sql;
	ResultSet rs;
	String uri = "jdbc:mysql://127.0.0.1/makefriend?" + "user=root&password=123&characterEncoding=utf-8";
	con = DriverManager.getConnection(uri);
	String condition = "update member set email='" + email + "',nichen='" + nichen + "',birthday='" + birthday
			+ "',address='" + address + "',phone='" + phone + "' where logname = '" + name + "'";
	sql = con.createStatement();
	int update = sql.executeUpdate(condition);
	condition = "select * from member where  logname='" + name + "'";
	rs = sql.executeQuery(condition);
	while (rs.next()) {
%>
<BODY>

	<div class="top" style="text-align: right">
		<span>欢迎你,尊敬的管理员，点我 <A href="helpExitLogin">退出登录</A>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		</span>
		<div style="text-align: CENTER">
			<font style="font-family: 微软雅黑; font-size: 40PX;">会员平台管理系统</font>
		</div>
	</div>

	<!-- 侧边栏 -->
	<div class="container clearfix">
		<div class="sidebar-wrap">
			<div class="sidebar-title">
				<h1>菜单</h1>
			</div>
			<div class="sidebar-content">
				<ul class="sidebar-list">
					<li><a href="#"><i class="icon-font">&#xe003;</i>常用操作</a>
						<ul class="sub-menu">
							<li><A href="choiceLookType.jsp"><i class="icon-font">&#xe005;</i>浏览会员</a></li>
							<li><A href="modifyPassword.jsp"><i class="icon-font">&#xe006;</i>修改密码</a></li>
							<li><A href="showLoginMess.jsp"><i class="icon-font">&#xe008;</i>返回主页</a></li>
							<li><A><i class="icon-font">&#xe008;</i>尚未开发</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
		<div class="main-wrap" style="background: url(image/1.jpg);">

			<div class="crumb-wrap">
				<div class="crumb-list">
					<i class="icon-font"></i><a>首页</a><span class="crumb-step">&gt;</span>
					<span class="crumb-name">浏览会员</span>
					<div id="time">
						<!-- 加入时间 -->
						<script type="text/javascript">
							updateDate();
						</script>
					</div>
				</div>
			</div>



			您修改后信息如下：
			<div>
				<table class="table1" style="width: 50%;">
					<tr>
						<td align="center">账&nbsp&nbsp号</td>
						<td><span class="font111"> <%
 	out.print(rs.getString(1));
 %>
						</span></td>
					</tr>

					<tr>
						<td align="center">昵&nbsp&nbsp称</td>
						<td><span class="font111"> <%
 	out.print(rs.getString(4));
 %></span></td>
					<tr>
					<tr>
						<td align="center">邮&nbsp&nbsp箱</td>
						<td><span class="font111"> <%
 	out.print(rs.getString(3));
 %></span></td>
					<tr>
					<tr>
						<td align="center">电&nbsp&nbsp话</td>
						<td><span class="font111"> <%
 	out.print(rs.getString(6));
 %>
						</span></td>
					</tr>
					<tr>
						<td align="center">生&nbsp&nbsp日</td>
						<td><span class="font111"> <%
 	out.print(rs.getString(7));
 %></span></td>
					<tr>
						<td align="center">所&nbsp在&nbsp地</td>
						<td><span class="font111"> <%
 	out.print(rs.getString(8));
 %></span></td>
					</tr>

				</table>
			</div>


			<%
				}
				rs.close();
				con.close();
			%>
		
</BODY>
</HTML>

