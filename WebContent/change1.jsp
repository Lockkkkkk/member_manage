<%@ page contentType="text/html;charset=UTF-8"%>
<HEAD>
<script type="text/javascript" src="js/nianyueri.js">
	
</script>
<script type="text/javascript" src="js/shengxianshi.js">
	
</script>
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
<%
	String name = request.getParameter("username");
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
					<span class="crumb-step">&gt;</span>
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
			<div>
				<FORM action="showchange.jsp" name=form method=post>
					<input type=hidden name="username" value=<%=name%>>
					<table class="table1">
						<tr>
							<td align="center">账&nbsp&nbsp号</td>
							<td>不可修改</td>
						</tr>

						<tr>
							<td align="center">昵&nbsp&nbsp称</td>
							<td><input type="text" name="nichen" maxlength="20"
								style="width: 180px; height: 30px;"></td>
						</tr>
						<tr>
							<td align="center">邮&nbsp&nbsp箱</td>
							<td><input type="text" name="email" id="email"
								style="width: 180px; height: 30px;"> <select
								name="houzhui" size="1" style="height: 30px;">
									<option value="@qq.com">@qq.com
									<option value="@126.com">@126.com
							</select></td>
						</tr>

						<tr>
							<td align="center">联系电话</td>
							<td><Input type=text name="phone"
								style="width: 180px; height: 30px;"></td>
						</tr>


						<tr>
							<td align="center">生&nbsp&nbsp日</td>
							<td><select name="gongli">
									<option value="gongli">公历
									<option value="nongli">农历
							</select> <select name="year" onchange="initDate()">
									<script type="text/javascript">
										var year = new Date().getFullYear();
										for (var i = year - 116; i <= year; i++) {
											document
													.write("<option value=" + i + ">"
															+ i + "</option>");
										}
									</script>
							</select> <select name="month" onchange="initDate()">
									<script type="text/javascript">
										for (var i = 1; i <= 12; i++) {
											document
													.write("<option value=" + i + ">"
															+ i + "</option>");
										}
									</script>
							</select> <select name="day">
									<script type="text/javascript">
										for (var i = 1; i <= 31; i++) {
											document
													.write("<option value=" + i + ">"
															+ i + "</option>");
										}
									</script>
							</select></td>
						</tr>
						<tr>
							<td align="center">所&nbsp在&nbsp地</td>
							<td><select id="cmbProvince" name="cmbProvince"></select> <select
								id="cmbCity" name="cmbCity"></select> <select id="cmbArea"
								name="cmbArea"></select> <script type="text/javascript">
									addressInit('cmbProvince', 'cmbCity',
											'cmbArea');
								</script> </select></td>
						</tr>
						<tr>

							<td></td>
							<td><Input type=submit name="g" value="提交修改" class="submit" ><Input
								type=reset value="重置" class="submit" style="margin-left: 50px;"></td>
						</tr>
					</table>
			</div>
			<
</BODY>
</HTML>
