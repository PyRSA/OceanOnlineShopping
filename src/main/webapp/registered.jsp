<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="UTF-8">
		<title>注册页面</title>
		<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
		<script src="bootstrap/js/jquery-3.1.0.min.js"></script>
		<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="css/navbar.css" />
		<script src="js/navbar.js"></script>
		<link rel="stylesheet" href="css/registered.css" />
		<script type="text/javascript" src="js/registered.js"></script>
	</head>

	<body>
		<c:if test="${not empty sessionScope.user }">
			<jsp:forward page="index.jsp"></jsp:forward>
		</c:if>
		<%@include file="jspt/navbar.jsp" %>
		<!--网站导航-->
		<div class="container">
			<div class="row text-right">
				<a href="index.jsp">书城首页</a>>
				<a href="user.jsp">用户</a>>注册
			</div>
		</div>
		<!--end网站导航-->

		<!--用户数据-->
		<!--订单页面-->
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<ul class="nav nav-tabs">
						<li class="active">
							<a href="#page1 " data-toggle="tab">新账户</a>
						</li>
					</ul>
					<div class="tab-content">
						<!--个人资料-->
						<div class="tab-pane active" id="page1">
							<div class="text-center">
								<span>基本资料</span>
							</div>
							<hr />
							<div class="userDataDiv row">
								<div class="col-sm-5 text-right">
									<b>*</b> 用户名
								</div>
								<div class="col-sm-5">
									<input type="text" name="username1" value="" title="用于登录,谨慎填写" />&nbsp;
									<span></span>
								</div>
								<div class="col-sm-5 text-right">
									<b>*</b> 性别
								</div>
								<div class="col-sm-5">
									<input type="radio" name="gender" value="m" checked="checked" />男
									<input type="radio" name="gender" value="f" />女
									<span></span>
								</div>
								<div class="col-sm-5 text-right">
									<b>*</b> Email
								</div>
								<div class="col-sm-5">
									<input type="text" name="email" id="emailinput" />
									<span></span>
								</div>
								<div class="col-sm-5 text-right">
									<b>*</b> 姓名
								</div>
								<div class="col-sm-5">
									<input type="text" name="name" value="" />
									<span></span>
								</div>
								<div class="col-sm-5 text-right">
									<b>*</b> 密码
								</div>
								<div class="col-sm-5">
									<input type="password" name="password1" value="" />
									<span></span>
								</div>
								<div class="col-sm-5 text-right">
									<b>*</b> 再次密码
								</div>
								<div class="col-sm-5">
									<input type="password" name="againpsw" value="" />
									<span></span>
								</div>
								<div class="col-sm-5 text-right">
									<b>*</b> 电话号码
								</div>
								<div class="col-sm-5">
									<input type="text" name="telephone" value=""/>
									<span></span>
								</div>
								<div class="col-sm-5 text-right">
									<b>*</b> 地址
								</div>
									<div class="col-sm-5">
										<div id="newaddress" class="citys">
									<p>
										省份
										<select name="province">
											<option>请选择</option>
										</select>
										城市
										<select name="city">
											<option>请选择</option>
										</select>
										区、县
										<select name="area">
											<option>请选择</option>
										</select>
									</p>
								</div>
								<link rel="stylesheet" type="text/css" href="css/cssreset-min.css">
								<link rel="stylesheet" type="text/css" href="css/common.css">
								<script type="text/javascript" src="js/jquery.citys.js"></script>
								<script type="text/javascript">
									$('#newaddress').citys({
										code: 440106
									});
								</script><br />
								</div>
								<div class="col-sm-5 text-right">
									<b>*</b> 详细地址
								</div>
								<div class="col-sm-5">
									<input type="text" name="xiangxi" /><span></span>
								</div>
								<div class="col-sm-5 text-right">
									个人简述
								</div>
								<textarea id="introduce" rows="5" cols="40">-</textarea>
								<div class="col-sm-5 text-right">
									<b>*</b> 验证码
								</div>
								<div class="col-sm-5">
									<input type="text" name="test" id="emailinput" /><button id="sendtestnumbtn">发送验证码到邮箱</button>
									<span></span>
								</div>
								<div class="col-sm-12 text-center">
									注：带"*"为必填
								</div>
								<div class="col-sm-12 text-center">
									<button class="btn btn-danger" name="reg" id="regbtn">立即注册</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--end订单页面-->
		<!--end 用户数据-->
		<%@include file="jspt/bottombar.jsp" %>
	</body>

</html>