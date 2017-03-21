<%@ page contentType="text/html;charset=UTF-8" %>
<HEAD>
</HEAD>
<HTML>
<link rel="stylesheet" type="text/css" href="css/css.css" />
<style type="text/css">
.div1 {
	width: 800px;
	background: rgba(192, 192, 192, 0.3);
	font-family: "微软雅黑";
}

.div2 {
	width: 200px;
	height: 300px;
	background: rgba(0, 0, 0, 0.4);
	margin: 0PX;
	font-size: 25px;
}

.chaolianjie {
	font-size: 25px;
}

.tableclass1 {
	
}
</style>
<BODY background=image/bg.jpg>
	<center>
		<div class="div1" align="center">
			<h1>欢迎进入会员管理系统</h1>
		</div>

		<hr>
	</center>


	<%@ include file="time.jsp"%>
	<div > 
		<table align="center">
			<tr>
				<td><a href="login.jsp" class="submit">登录</a></td>
				<td><a href="register.jsp" class="submit">注册</a></td>
			</tr>
		</table>
	</div>



</BODY>

</HTML>
