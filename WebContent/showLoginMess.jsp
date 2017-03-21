<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="mybean.data.Login"%>
<%@ page import="java.sql.*"%>
<HEAD>
<title>用户中心</title>
<link rel="stylesheet" type="text/css" href="css/common.css" />
<link rel="stylesheet" type="text/css" href="css/main.css" />
<link rel="stylesheet" type="text/css" href="css/css.css" />
<jsp:useBean id="login" class="mybean.data.Login" scope="session" />
</HEAD>
<HTML>
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
<BODY>


	<%
		if (login.getSuccess() == true) {
			if (login.isQuanxian() == false) {
	%>

	<!-- 会员登陆的网页头部 -->
	<%
		String name = login.getLogname();
	%>
	<div class="top" style="text-align: right">
		<span>欢迎你,尊敬的<%=name%>，点我 <A href="helpExitLogin">退出登录</A>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
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
						<li><A href="upload.jsp"><i class="icon-font">&#xe006;</i>上传图片</a></li>
							<li><A href="showUserloginmess.jsp"><i class="icon-font">&#xe005;</i>个人信息</a></li>
							<li><A href="inputModifyMess.jsp"><i class="icon-font">&#xe005;</i>修改信息</a></li>
							<li><A href="modifyPassword.jsp"><i class="icon-font">&#xe006;</i>修改密码</a></li>
							<li><A><i class="icon-font">&#xe008;</i>返回主页</a></li>
							<li><A><i class="icon-font">&#xe008;</i>尚未开发</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
		<div class="main-wrap" style="background: url(image/1.jpg);">

			<div class="crumb-wrap">
				<div class="crumb-list">
					<i class="icon-font"></i><a>首页</a><span class="crumb-step">&gt;</span>
				</div>
			</div>
			<br> <Font class="font2" style="margin-left: 100px;"> <jsp:getProperty
					name="login" property="backNews" />
			</Font>
			<%
				} else {
			%>
			<!-- 管理员登陆的 网页头部 -->

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
									<li><A ><i class="icon-font">&#xe008;</i>返回主页</a></li>
									<li><A><i class="icon-font">&#xe008;</i>尚未开发</a></li>
								</ul></li>
						</ul>
					</div>
				</div>
				<div class="main-wrap" style="background: url(image/1.jpg);">

					<div class="crumb-wrap">
						<div class="crumb-list">
							<i class="icon-font"></i><a>首页</a><span class="crumb-step">&gt;</span>
							<div id="time">
								<!-- 加入时间 -->
								<script type="text/javascript">
									updateDate();
								</script>
							</div>
						</div>
					</div>
					<BR> <Font class="font2" style="margin-left: 100px;"> <jsp:getProperty
							name="login" property="backNews" />
					</Font>
					<%
						}

						} else {
					%>
               还没登录;
					<%
						}
					%>
				</div>
			</div>

			</CENTER>
</BODY>
</HTML>
