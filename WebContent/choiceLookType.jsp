<%@ page contentType="text/html;charset=UTF-8"%>
<!doctype html>
<html>
<head>
<title>用户中心</title>
<link rel="stylesheet" type="text/css" href="css/common.css" />
<link rel="stylesheet" type="text/css" href="css/main.css" />
<link rel="stylesheet" type="text/css" href="css/css.css" />
<jsp:useBean id="login" class="mybean.data.Login" scope="session" />
<style type="text/css">
.top {
	height: 60px;
	line-height: 20px;
	background: url(image/bg2.png);
}
</style>
<script type="text/javascript"> //时间的js
	function updateDate() {
		document.getElementById('time').innerHTML = new Date().toLocaleString()
				+ " 星期" + "日一二三四五六".charAt(new Date().getDay());
	}
	setInterval("updateDate();", 1000);
</script>

</head>

<body>
	<!--  网页头部 -->
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
							<li><A href="choiceLookType.jsp"><i class="icon-font">&#xe005;</i>浏览会员</a></li>
							<li><A href="modifyPassword.jsp"><i class="icon-font">&#xe006;</i>修改密码</a></li>
							<li><A href="showLoginMess.jsp"><i class="icon-font">&#xe008;</i>返回主页</a></li>
							<li><A><i class="icon-font">&#xe008;</i>尚未开发</a></li>
						</ul></li>
				</ul>
			</div>
		</div>

		<!--  主界面的上边框 -->
		<!--/sidebar-->
		<div class="main-wrap">

			<div class="crumb-wrap">
				<div class="crumb-list">
					<i class="icon-font"></i><a href="index.html">首页</a><span
						class="crumb-step">&gt;</span><span class="crumb-name">浏览会员</span>
					<div id="time"><!-- 加入时间 -->
						<script type="text/javascript">
							updateDate();
						</script>
					</div>

				</div>

			</div>
		</div>
		<div class="search-wrap">
			<div class="search-content">
				<FORM action="helpShowMember" method="get" name="form">
					<table class="search-tab">
						<th>&nbsp&nbsp输入要查找的会员名:</th>
						<td><input class="common-text" placeholder="关键字"
							name="logname" value="" id="" type="text"></td>
						<td><input class="btn btn-primary btn2" name="submit"
							value="查询" type="submit"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<div class="search-wrap">
			<div class="search-content">
				<FORM action="helpShowMember" method="post" name="form">
					<table class="search-tab">
						<th>&nbsp&nbsp&nbsp分页显示所有会员</th>
						<td><INPUT type="hidden" value="1" name="showPage" size=6>
							<INPUT type="submit" value="显示" name="submit"
							class="btn btn-primary btn2"></td>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>

</html>
