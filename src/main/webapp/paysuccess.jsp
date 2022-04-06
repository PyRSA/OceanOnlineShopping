<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>砺锋时装城</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
		<script src="bootstrap/js/jquery-3.1.0.min.js" ></script>
		<script src="bootstrap/js/jquery-1.11.2.min.js"></script>
		<script src="bootstrap/js/bootstrap.min.js" ></script>
		<link rel="stylesheet" href="css/navbar.css" />
		<script src="js/navbar.js" ></script>
		<link rel="stylesheet" href="css/paysuccess.css" type="text/css" />
		<script type="text/javascript">
		$(function(){
			startSecond();
		});
		var interval;
		function startSecond() {
			interval = window.setInterval("changeSecond()", 1000);
		};

		function changeSecond() {
			var second = document.getElementById("second");
			var svalue = second.innerHTML;
			svalue = svalue - 1;
			if (svalue == 0) {
				window.clearInterval(interval);
				location.href = "index.jsp";
				return;
			}
			second.innerHTML = svalue;
		}
		</script>

	

</head>

<body class="main">

	<jsp:include page="jspt/navbar.jsp"></jsp:include>




	<div id="divcontent">
		<table width="850px" border="0" cellspacing="0">
			<tr>
				<td style="padding:30px; text-align:center"><table width="60%"
						border="0" cellspacing="0" style="margin-top:70px">
						<tr>
							<td style="width:98"><img
								src="img/userheadimg/0.jpg" width="128" height="128" />
							</td>
							<td style="padding-top:30px"><font
								style="font-weight:bold; color:#FF0000;font-size:36px;">支付成功</font><br />
								<br />
								<c:if test="${sum>=100 }">
								 <a href="choujian/index.html">购物满100,点击此处可参加抽奖,若不抽,<span id="second">5</span>秒后自动为您转跳到抽奖页面</a></td>
								</c:if>
								<c:if test="${sum<100 }">
								 <a href="index.jsp"><span id="second">5</span>秒后自动为您转跳回首页</a></td>
								</c:if>
						</tr>
					</table>
					<h1>&nbsp;</h1></td>
			</tr>
		</table>
	</div>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>


	<jsp:include page="jspt/bottombar.jsp"/>


</body>
</html>
