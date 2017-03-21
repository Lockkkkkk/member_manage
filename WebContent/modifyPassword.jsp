<%@ page contentType="text/html;charset=UTF-8"%>
<HEAD>
<link rel="stylesheet" type="text/css" href="css/common.css" />
<link rel="stylesheet" type="text/css" href="css/main.css" />
<link rel="stylesheet" type="text/css" href="css/css.css" />
<jsp:useBean id="login" class="mybean.data.Login" scope="session" /></HEAD>
<script type="text/javascript">
	//时间的js
	function updateDate() {
		document.getElementById('time').innerHTML = new Date().toLocaleString()
				+ " 星期" + "日一二三四五六".charAt(new Date().getDay());
	}
	setInterval("updateDate();", 1000);
</script>
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
<HTML>
<BODY>
	<%
		if (login.isQuanxian() == false) {
	%>
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
					<span class="crumb-name">修改密码</span>
					<div id="time">
						<!-- 加入时间 -->
						<script type="text/javascript">
							updateDate();
						</script>
					</div>
					<div> 
						<h1>请输入您的当前的密码和新密码：</h1>
						<br>
						<table class="table1">
							<form action="helpModifyPassword" Methed="post">
								<tr>
									<td>当前密码：</td>
									<td><Input type=password name="oldPassword"></td>
								</tr>
								<tr>
									<td>新密码：</td>
									<td><Input type=password name="newPassword"></td>
								</tr>

								<tr>
									<td></td>
									<td><Input type=submit name="g" value="提交" class="submit"></td>
								</tr>
						</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<%
		} else {
	%>
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
					<span class="crumb-name">修改密码</span>
					<div id="time">
						<!-- 加入时间 -->
						<script type="text/javascript">
							updateDate();
						</script>
					</div>
					<div> 
						<h1>请输入您的当前的密码和新密码：</h1>
						<br>
						<table class="table1">
							<form action="helpModifyPassword" Methed="post">
								<tr>
									<td>当前密码：</td>
									<td><Input type=password name="oldPassword"></td>
								</tr>
								<tr>
									<td>新密码：</td>
									<td><Input type=password name="newPassword"></td>
								</tr>

								<tr>
									<td></td>
									<td><Input type=submit name="g" value="提交" class="submit"></td>
								</tr>
						</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
		<%
			}
		%>
	
</BODY>
</HTML>
