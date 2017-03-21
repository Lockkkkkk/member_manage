<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<link rel="stylesheet" type="text/css" href="css/css.css" />
<body >

			<script type="text/javascript">
				function updateDate() {
					document.getElementById('time').innerHTML = new Date()
							.toLocaleString()
							+ " 星期" + "日一二三四五六".charAt(new Date().getDay());
				}
				setInterval("updateDate();", 1000);
			</script>
			
			<div id="time">
				<script type="text/javascript">
					updateDate();
				</script>
			</div>
</body>
</html>