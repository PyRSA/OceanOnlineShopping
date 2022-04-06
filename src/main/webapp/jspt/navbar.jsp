<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--隐藏登录块 -->

<div id="maxDiv" hidden="hidden" class="container">
	<div class="col-md-4 col-sm-3 col-xs-12"></div>
	<div class="col-md-3 col-sm-6 col-xs-12" id="login">
		<div id="closeLogin">
			<button type="button" class="btn btn-link glyphicon glyphicon-remove"></button>
		</div>
		<h1>登录</h1>
		<br />
		<div class="input-group col-xs-12">
			<input type="text" name="username" class="form-control loginInput"
				placeholder="请输入用户名" aria-describedby="basic-addon1">
		</div>
		<br>
		<div class="input-group col-xs-12">
			<input type="password" name="passwd" class="form-control loginInput"
				placeholder="请输入密码" aria-describedby="basic-addon2">
		</div>
		<div class="text-right">
			<a href="javascript:void(0)">忘记密码？</a>
		</div>
		<div class="text-center">
			<a href="javascript:void(0)">注册新账户>></a>
		</div>
		<input type="checkbox" name="zidong" value="true" checked="checked" />自动登录<br />
		<button type="button" class="btn btn-danger col-xs-12" id="loginbtn">登录</button>
	</div>
	<div class="col-md-5 col-sm-3 col-xs-12"></div>
</div>
<!--end 隐藏登录块 -->

<!--导航条-->
<div>
	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-text" data-toggle="collapse" href="javascript:void(0)"> <span
				class="glyphicon glyphicon-map-marker">&nbsp;送至：</span>广东
			</a> <a href="index.jsp" class="navbar-text">主页</a>
		</div>
		<div class="collapse navbar-collapse navbar-right">
			<span class="navbar-text" id="lxkh">
				<img alt="" src="img/qq.jpg" width="15px">
				<a>联系客服</a>
			</span>
			<a class="nav navbar-text" id="cart" href="javascript:void(0)" onclick="return cart()"> 购物车<span
				class="glyphicon glyphicon-shopping-cart"></span>
			</a>
			
			<p class="navbar-text" id="helloStr">
				<c:if test="${empty sessionScope.user.username}">
					<a href="javascript:void(0)">游客</a>
					<a href="javascript:void(0)" class="loginbutton" style="color:blue;">请登录</a>
				</c:if>
				<c:if test="${not empty sessionScope.user.username}">
					<a href="user.jsp" id="username">${sessionScope.user.username }</a>
					<a href="javascript:void(0)" class="logoutbutton" style="color:red;">退出</a>
				</c:if>
			</p>
		</div>
	</div>
	</nav>
</div>
		<script type="text/javascript">
		//购物车
			function cart(){

				var username = $("#username").html();
				if(username == null || username == ""){
					alert("请先登录!");
					return false;
				}else{

					location.href="findCart";
				}
			}
		
		$(function(){
			$(".logoutbutton").click(function(){
				if(confirm("是否退出登录？")){
					window.location.href="logout";
				}
					
			});
		});

		</script>
<!--end 导航条-->
