<%@ page contentType="text/html;charset=UTF-8"%>
<HEAD>
<script type="text/javascript" src="js/nianyueri.js">
	
</script>
<script type="text/javascript" src="js/shengxianshi.js">
	
</script>
<link rel="stylesheet" type="text/css" href="css/css.css" />
<style type="text/css">
html {
	overflow-y: scroll;
	vertical-align: baseline;
}

body {
	font-family: Microsoft YaHei, Segoe UI, Tahoma, Arial, Verdana,
		sans-serif;
	font-size: 12px;
	color: #fff;
	height: 100%;
	line-height: 1;
}

* {
	margin: 0;
	padding: 0
}

ul, li {
	list-style: none
}

h1 {
	font-size: 30px;
	font-weight: 700;
	text-shadow: 0 1px 4px rgba(0, 0, 0, .2)
}

.login-box {
	width: 410px;
	margin: 50px auto 0 auto;
	text-align: center;
	padding: 30px;
	background: url(image/mask.png);
	border-radius: 10px;
}

.login-box .name, .login-box .password, .login-box .code, .login-box .remember
	{
	font-size: 16px;
	text-shadow: 0 1px 2px rgba(0, 0, 0, .3)
}

.login-box .remember input {
	box-shadow: none;
	width: 15px;
	height: 15px;
	margin-top: 25px
}

.login-box .remember {
	padding-left: 40px
}

.login-box .remember label {
	display: inline-block;
	height: 42px;
	width: 70px;
	line-height: 34px;
	text-align: left
}

.login-box label {
	display: inline-block;
	width: 100px;
	text-align: right;
	vertical-align: middle
}

.login-box #code {
	width: 60px
}

.login-box .codeImg {
	float: right;
	margin-top: -40px;
}

.login-box img {
	width: 70px;
	height: 40px;
	border: none
}

input[type=text], input[type=password] {
	width: 270px;
	height: 42px;
	margin-top: 5px;
	margin-bottom: 5px;
	padding: 0px 15px;
	border: 1px solid rgba(255, 255, 255, .35);
	border-radius: 6px;
	color: #fff;
	letter-spacing: 2px;
	font-size: 16px;
	background: transparent;
}

select {
	border: 1px solid rgba(255, 255, 255, .35);
	border-radius: 6px;

	letter-spacing: 2px;
	background: transparent;
}

button {
	cursor: pointer;
	width: 8%;
	height: 30px;
	padding: 0;
	background: #ef4300;
	border: 1px solid #ff730e;
	border-radius: 6px;
	font-weight: 700;
	color: #fff;
	font-size: 24px;
	letter-spacing: 10px;
	text-shadow: 0 1px 2px rgba(0, 0, 0,1)
	
}

input:focus {
	outline: none;
	box-shadow: 0 2px 3px 0 rgba(0, 0, 0, .1) inset, 0 2px 7px 0
		rgba(0, 0, 0, .2)
}

button:hover {
	box-shadow: 0 15px 30px 0 rgba(255, 255, 255, .15) inset, 0 2px 7px 0
		rgba(0, 0, 0, .2)
}

.screenbg {
	position: fixed;
	bottom: 0;
	left: 0;
	z-index: -999;
	overflow: hidden;
	width: 100%;
	height: 100%;
	min-height: 100%;
}

.screenbg ul li {
	display: block;
	list-style: none;
	position: fixed;
	overflow: hidden;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: -1000;
	float: right;
}

.screenbg ul a {
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	display: inline-block;
	margin: 0;
	padding: 0;
	cursor: default;
}

.screenbg a img {
	vertical-align: middle;
	display: inline;
	border: none;
	display: block;
	list-style: none;
	position: fixed;
	overflow: hidden;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: -1000;
	float: right;
}

.bottom {
	margin: 8px auto 0 auto;
	width: 100%;
	position: fixed;
	text-align: center;
	bottom: 0;
	left: 0;
	overflow: hidden;
	padding-bottom: 8px;
	color: #ccc;
	word-spacing: 3px;
	zoom: 1;
}

.bottom a {
	color: #FFF;
	text-decoration: none;
}

.bottom a:hover {
	text-decoration: underline;
}
.table1 {

	border-collapse: separate;
	border-spacing: 5px;
	margin :0px;
	background: rgba(0,0,0,0.3);
	 border-radius:10px;

	 line-height:50px;
	 
	
}
</style>
</HEAD>
<HTML>

<BODY background=image/bg.jpg>

	<CENTER>
		<div>
			<FORM action="helpRegister" name=form method=post>
				<h1 style="font-size: 50px;">注册账号</h1>
				<br>
		</div>
	</CENTER>
	<hr>
	<br>
	<a href="index.jsp"><span style="font-size: 15px;">点我返回首页</span></a>
	<center>
		<table class="table1" >
			<tr>
				<td align="center">账&nbsp&nbsp号</td>
				<td><input type="text" name="logname" id="logname"
					style="width: 180px; height: 30px;" maxlength="30"
					onkeyup="check1()"> <span id="tishi1"></span></td>
			</tr>
			<br>

			<tr>
				<td align="center">邮&nbsp&nbsp箱</td>
				<td><input type="text" name="email" id="email"
					style="width: 180px; height: 30px;"> <select name="houzhui"
					size="1" style="height: 30px;">
						<option value="@qq.com">@qq.com
						<option value="@126.com">@126.com
				</select></td>
			</tr>



			<tr>
				<td align="center">昵&nbsp&nbsp称</td>
				<td><input type="text" name="nichen" maxlength="20"
					style="width: 180px; height: 30px;"></td>
			</tr>


			<tr>
				<td align="center">密&nbsp&nbsp码</td>
				<td><input type=password name="password" id="pw1"
					maxlength="20" style="width: 180px; height: 30px;"></td>
			</tr>


			<tr>
				<td align="right">确认密码</td>
				<td><input type=password name="password1" maxlength="20"
					id="pw2" style="width: 180px; height: 30px;" onkeyup="check()"><span
					id="tishi"></span></td>
			</tr>


			<tr>
				<td align="center">性&nbsp&nbsp别</td>
				<td><input type="radio" name="sex" value="male"
					checked="default">&nbsp男 <input type="radio" name="sex"
					value="female"style="margin-left:15px;">&nbsp女</td>
			</tr>

			<tr>
				<td align="center">生&nbsp&nbsp日</td>
				<td><select name="gongli" style="margin-right:10px;">
						<option value="gongli">公历
						<option value="nongli">农历
				</select> <select name="year" onchange="initDate()" style="margin-right:10px;">
						<script type="text/javascript">
							var year = new Date().getFullYear();
							for (var i = year - 116; i <= year; i++) {
								document.write("<option value=" + i + ">" + i
										+ "</option>");
							}
						</script>
				</select> <select name="month" onchange="initDate()" style="margin-right:10px;">
						<script type="text/javascript">
							for (var i = 1; i <= 12; i++) {
								document.write("<option value=" + i + ">" + i
										+ "</option>");
							}
						</script>
				</select> <select name="day">
						<script type="text/javascript">
							for (var i = 1; i <= 31; i++) {
								document.write("<option value=" + i + ">" + i
										+ "</option>");
							}
						</script>
				</select></td>
			</tr>


			<tr>
				<td align="center">所&nbsp在&nbsp地</td>
				<td><select id="cmbProvince" name="cmbProvince"style="margin-right:10px;"></select> <select
					id="cmbCity" name="cmbCity" style="margin-right:10px;"></select> <select id="cmbArea"
					name="cmbArea" style="margin-right:10px;"></select> <script type="text/javascript">
						addressInit('cmbProvince', 'cmbCity', 'cmbArea');
					</script> </select></td>
			</tr>

			<tr>
				<td align="center">验&nbsp证&nbsp码</td>
				<td><input type="text" name="validateCode" maxlength="4"
					tabindex="3"> <img alt="验证码看不清，换一张"
					src="${pageContext.request.contextPath}/DrawImage"
					id="validateCodeImg" onclick="changeImg()" width="60" height="20"
					border="1" align="absmiddle"></td>

			</tr>


			<tr>
				<td align="right">手机号码</td>
				<td><input type="text" name="phone"
					style="width: 270px; height: 30px;"></td>
			</tr>




			<tr>
				<td></td>
				<td><font size="2">忘记密码时，可通过该手机号码快速找回密码
						<p>请输入中国大陆手机号码(不包含小灵通)</p>
				</font></td>
			</tr>
		</table>

		<br> <button type="submit" name="tijiao" id="submit" size="12"
			value="确定" style="position: absolute; left: 500px;">&nbsp确定 </button>
			<button type="reset" name="chongzhi" size="12" value="重置"
			style="margin-left:200px;">&nbsp重置</button>

		</form>
		<script>
			function changeImg() {//刷新验证码
				document.getElementById("validateCodeImg").src = "${pageContext.request.contextPath}/DrawImage?"
						+ Math.random();
			}
			function check() {//验证两次密码必须相同才可以登录
				var pw1 = document.getElementById("pw1").value;
				var pw2 = document.getElementById("pw2").value;
				if (pw1 == pw2) {
					document.getElementById("tishi").innerHTML = "<font color='green'>两次密码相同</font>";
					document.getElementById("submit").disabled = false;
				} else {
					document.getElementById("tishi").innerHTML = "<font color='red'>两次密码不相同</font>";
					document.getElementById("submit").disabled = true;
				}

			}
			function check1() {//验证账号不能为空
				var username = document.getElementById("logname").value;
				if (username == "") {
					document.getElementById("tishi1").innerHTML = "<font color='red'>账号不能为空</font>";
					document.getElementById("submit").disabled = true;
				} else {
					document.getElementById("tishi1").innerHTML = "";
					document.getElementById("submit").disabled = false;
				}
			}
		</script>
</Body>
</HTML>
