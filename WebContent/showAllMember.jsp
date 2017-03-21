<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="mybean.data.ShowByPage"%>
<head>
<jsp:useBean id="show" class="mybean.data.ShowByPage" scope="session" />
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
</HEAD>
<HTML>
<Body>


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
					<i class="icon-font"></i><a href="showLoginMess.jsp">首页</a><span
						class="crumb-step">&gt;</span> <span class="crumb-name">浏览会员</span>
					<div id="time">
						<!-- 加入时间 -->
						<script type="text/javascript">
							updateDate();
						</script>
					</div>
				</div>
			</div>
			<BR>当前所有会员内容为： <br> <br>
			<div>
				<table class="table1">
					<tr>
						<th align="center">会员名</th>
						<th align="center">邮箱</th>
						<th align="center">昵称</th>
						<th align="center">性别</th>
						<th align="center">联系电话</th>
						<th align="center">生日</th>
						<th align="center">所在地</th>
						<th align="center">操作</th>
					</tr>
					<span class="font111"><jsp:getProperty name="show"
							property="presentPageResult" /></span>
				</table>
				<center>
					<BR>每页最多显示<jsp:getProperty name="show" property="pageSize" />条信息
					<BR>当前显示第<Font color=blue> <jsp:getProperty name="show"
							property="showPage" />
					</Font>页,共有 <Font color=blue><jsp:getProperty name="show"
							property="pageAllCount" /> </Font>页。 <BR>单击“上一页”或“下一页”按纽查看信息
					<Table>
						<tr>
							<td><FORM action="helpShowMember" method=post>
									<Input type=hidden name="showPage"
										value="<%=show.getShowPage() - 1%>"> <Input
										type=submit name="g" value="上一页" class="submit">
								</FORM></td>
							<td><FORM action="helpShowMember" method=post>
									<Input type=hidden name="showPage"
										value="<%=show.getShowPage() + 1%>"> <Input
										type=submit name="g" value="下一页" class="submit">
								</Form></td>
							<td>
								<FORM action="helpShowMember" method=post>
									输入页码：<Input type=text name="showPage" size=5> <Input
										type=submit name="g" value="提交" class="submit">
								</FORM>
							</td>
						</tr>
					</Table>
				</center>
			</div>
</BODY>
</HTML>
