<%@ page contentType="text/html;charset=UTF-8"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统登录</title>

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
	background: #999;
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
	text-shadow: 0 1px 2px rgba(0, 0, 0, .1)
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
	margin-top: 25px;
	padding: 0px 15px;
	border: 1px solid rgba(255, 255, 255, .15);
	border-radius: 6px;
	color: #fff;
	letter-spacing: 2px;
	font-size: 16px;
	background: transparent;
}

button {
	cursor: pointer;
	width: 100%;
	height: 44px;
	padding: 0;
	background: #ef4300;
	border: 1px solid #ff730e;
	border-radius: 6px;
	font-weight: 700;
	color: #fff;
	font-size: 24px;
	letter-spacing: 15px;
	text-shadow: 0 1px 2px rgba(0, 0, 0, .1)
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
</style>

<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".screenbg ul li").each(function() {
			$(this).css("opacity", "0");
		});
		$(".screenbg ul li:first").css("opacity", "1");
		var index = 0;
		var t;
		var li = $(".screenbg ul li");
		var number = li.size();
		function change(index) {
			li.css("visibility", "visible");
			li.eq(index).siblings().animate({
				opacity : 0
			}, 3000);
			li.eq(index).animate({
				opacity : 1
			}, 3000);
		}
		function show() {
			index = index + 1;
			if (index <= number - 1) {
				change(index);
			} else {
				index = 0;
				change(index);
			}
		}
		t = setInterval(show, 8000);
		//根据窗口宽度生成图片宽度
		var width = $(window).width();
		$(".screenbg ul img").css("width", width + "px");
	});
</script>

</head>
	
<body>

	<div class="login-box">
		<h1>后台登录</h1>
		<form method="post" action="helpLogin">
			<div class="name">
				<label>账 号：</label> <input type="text" name="logname"
					onkeyup="check1()" id="username"> <span id="tishi1"></span>
					
			</div>
			<div class="password">
				<label>密 码：</label> <input type="password" name="password">
			</div>
			<div class="code">
				<label>验证码：</label> <input type="text" name="validateCode"
					maxlength="4" tabindex="3">
				<div class="codeImg">
					<img alt="验证码看不清，换一张"
						src="${pageContext.request.contextPath}/DrawImage"
						id="validateCodeImg" onclick="changeImg()">
				</div>
			</div>
			<br>
			<br>
			<div class="name" style="text-align:left">
				<label >权 限:</label> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="radio" name="quanxian" value="user"
					checked="default">会员&nbsp&nbsp&nbsp&nbsp&nbsp <input type="radio" name="quanxian"
					value="admin">管理员
			</div>
			<br>
			<br>
			<div class="login">
				<button type="submit" tabindex="5">登录</button>
			</div>
		</form>
	</div>



	<div class="screenbg">
		<ul>
			<li><a href="javascript:;"><img src="image/bg.jpg"></a></li>
			<li><a href="javascript:;"><img src="image/0.jpg"></a></li>
			<li><a href="javascript:;"><img src="image/1.jpg"></a></li>
		</ul>
	</div>
	<div style="text-align: center;">
		<p>
			meiyoubanquan
		</p>
	</div>
</body>
<script language="javascript">
	//刷新验证码
	function changeImg() {
		document.getElementById("validateCodeImg").src = "${pageContext.request.contextPath}/DrawImage?"
				+ Math.random();
	}
	function check1() {//验证账号不能为空
		var username = document.getElementById("username").value;
		if (username == "") {
			document.getElementById("tishi1").innerHTML = "<br><br><font color=red ; font-weight:bold>账号不能为空</font>";
			document.getElementById("submit").disabled = true;
		} else {
			document.getElementById("tishi1").innerHTML = "";
			document.getElementById("submit").disabled = false;
		}
	}
</script>
</html>
