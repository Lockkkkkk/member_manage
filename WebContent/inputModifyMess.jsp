<%@ page contentType="text/html;charset=UTF-8"%>
<HEAD>
<script type="text/javascript" src="js/nianyueri.js">
	
</script>
<script type="text/javascript" src="js/shengxianshi.js">
	
</script>
<script type="text/javascript">//时间的js	
	function updateDate() {
		document.getElementById('time').innerHTML = new Date().toLocaleString()
				+ " 星期" + "日一二三四五六".charAt(new Date().getDay());
	}
	setInterval("updateDate();", 1000);
</script>
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

</HEAD>
<HTML>
<BODY>
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

		<!--  主界面的上边框 -->
		<!--/sidebar-->
		<div class="main-wrap" style="background: url(image/1.jpg);" >
			<div class="crumb-wrap">
				<div class="crumb-list">
					<i class="icon-font"></i><a href="showLoginMess.jsp">首页</a><span class="crumb-step">&gt;</span><span
						class="crumb-name">修改信息</span>
					<div id="time">
						<!-- 加入时间 -->
						<script type="text/javascript">
							updateDate();
						</script>
					</div>
				</div>
			</div>
			<div >
			<span style="font-size:20;margin-left: 10px;">请输入您修改的信息,点提交确认;</span>
			<br>
				<br>
				<FORM action="helpModifyMess" name=form method=post>
					<table class="table1" style="width: 50%">
						<tr>
							<td align="center">昵&nbsp&nbsp称</td>
							<td><input type="text" name="nichen" maxlength="20"
								style="width: 180px; height: 30px;"></td>
						</tr>
						<tr>
							<td align="center">联系电话</td>
							<td><Input type=text name="newPhone"
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
							<td><Input type=submit name="g" value="提交修改" class="submit" style="margin-right: 30px;"><Input
								type=reset value="重置" class="submit"></td>
						</tr>
					</table>
			</div>
		</div>
		


	</div>

</BODY>
</HTML>
