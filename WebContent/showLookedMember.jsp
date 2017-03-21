<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="mybean.data.MemberInform"%>
<HEAD>
<jsp:useBean id="inform" class="mybean.data.MemberInform"
	scope="request" />
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

.table1 {
	border-collapse: separate;
	border-spacing: 5px;
	margin: 0px;
	background: rgba(0, 0, 0, 0.3);
	border-radius: 10px;
	margin-left: 100px;
	line-height: 50px;
	color: #fff;
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
					<i class="icon-font"></i><a href="showLoginMess.jsp">首页</a><span class="crumb-step">&gt;</span>
					<span class="crumb-name">浏览会员</span> <span class="crumb-step">&gt;</span>
					<span class="crumb-name">编辑信息</span>
					<div id="time">
						<!-- 加入时间 -->
						<script type="text/javascript">
							updateDate();
						</script>
					</div>
				</div>
			</div>
			<br>
			<br>
			<div>		
				<table class="table1">
					<tr>
						<th>会员名</th>
						<th>邮箱</th>
						<th>昵称</th>
						<th>性别</th>
						<th>联系电话</th>
						<th>生日</th>
						<th>所在地</th>
						<th>操作</th>
					</tr>
					<tr>
						<td><jsp:getProperty name="inform" property="logname" /></td>
						<td><jsp:getProperty name="inform" property="email" /></td>
						<td><jsp:getProperty name="inform" property="nichen" /></td>
						<td><jsp:getProperty name="inform" property="sex" /></td>
						<td><jsp:getProperty name="inform" property="phone" /></td>
						<td><jsp:getProperty name="inform" property="birthday" /></td>
						<td><jsp:getProperty name="inform" property="address" /></td>
						<td><form action="helpdelete" method="post"><input type=submit value='delete' >
						<input type=hidden name='username' value=<%=inform.getLogname() %>></form>
						<form action='change1.jsp' method=post><input type=submit value='change'>
						<input type=hidden name='username' value=<%=inform.getLogname() %>>
						</form>
				</table></div>

		
</BODY>
</HTML>
