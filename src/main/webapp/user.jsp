<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
		<script src="bootstrap/js/jquery-3.1.0.min.js"></script>
		<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="css/navbar.css" />
		<script src="js/navbar.js"></script>
		<link rel="stylesheet" href="css/user.css" />
		<script type="text/javascript" src="js/user.js" ></script>
	</head>

	<body>
		<c:if test="${empty sessionScope.user || empty requestScope.ordersnum || empty requestScope.cartnum}">
			<jsp:forward page="User"></jsp:forward>
		</c:if>
		<%@include file="jspt/navbar.jsp" %>
		<!--网站导航-->
		<div class="container">
			<div class="row text-right">
				<a href="index.jsp">书城首页</a>><span>用户</span>
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
							<a href="#page1 " data-toggle="tab">个人资料</a>
						</li>
						<li>
							<a href="#page2" data-toggle="tab">购物信息</a>
						</li>
					</ul>
					<div class="tab-content">
						<!--个人资料-->
						<div class="tab-pane active" id="page1">
							<div class="text-center">
								<span>基本资料</span>
								<hr/>
							</div>
							<div class="row text-center" style="height: 200px">
								<div class="col-sm-5 text-right">
									<img id="userheadimg" src="${sessionScope.user.headimg }" style="width: 150px;height: 150px;border: solid 2px;"/>
								</div>
								<div class="col-sm-5 text-left">
									<form enctype="multipart/form-data" id="upload">
									    选择一个文件:
									    <input type="file" name="uploadFile" />
									    <br/><br/>
									    <button type="button" id="ghtx">上传</button>
									</form>
								</div>
							</div>
							<div class="userDataDiv row">
								<div class="col-sm-5 text-right">
									<b>*</b> 用户名
								</div>
								<div class="col-sm-5">
									<input type="text" disabled="disabled" name="username" value="${sessionScope.user.username }" title="用于登录,谨慎修改"/>&nbsp;
									
									<span></span>
								</div>
								<div class="col-sm-5 text-right">
									<b>*</b> 性别
								</div>
								<div class="col-sm-5">
									<input type="radio" name="gender" value="m" ${sessionScope.user.gender=="m"?"checked='checked'":"" } />男
									<input type="radio" name="gender" value="f" ${sessionScope.user.gender=="f"?"checked='checked'":"" }/>女
									<span></span>
								</div>
								<div class="col-sm-5 text-right">
									<b>*</b> Email
								</div>
								<div class="col-sm-5">
									<input type="text" name="email" value="${sessionScope.user.email }" /><span></span>
								</div>
								<div class="col-sm-5 text-right">
									<b>*</b> 电话号码
								</div>
								<div class="col-sm-5">
									<input type="text" name="telephone" value="${sessionScope.user.telephone }" /><span></span>
								</div>
								<div class="col-sm-5 text-right">
									用户类型
								</div>
								<div class="col-sm-5">
									<input type="text" name="type" value="会员" disabled="disabled" />
								</div>
								<div class="col-sm-5 text-right">
									注册时间
								</div>
								<div class="col-sm-5">
									<input type="text" name="regtime" value="${sessionScope.user.registTime }" disabled="disabled" />
								</div>
								<div class="col-sm-5 text-right">
									个人简述
								</div>
								<textarea name="" rows="5" cols="40">${sessionScope.user.introduce }</textarea>
								<div class="col-sm-12 text-center">
									注：带"*"为必填
								</div>
								<div class="col-sm-12 text-center">
									<button class="btn btn-danger" id="save">保存修改</button>
								</div>
							</div>
						</div>
						<!--购物信息-->
						<div class="tab-pane" id="page2">
							<div class="container">
								<div class="row buyMsg">
									<div class="col-sm-4 text-right">订单次数</div>
									<div class="col-sm-4">${requestScope.ordersnum }次</div>
									<div class="col-sm-4">
										<a href="orders.jsp" class="btn btn-default">
											<span class="glyphicon glyphicon-list-alt"></span> &nbsp;查看订单
										</a>
									</div>
									<div class="col-sm-4 text-right">购物车</div>
									<div class="col-sm-4">${requestScope.cartnum }件</div>
									<div class="col-sm-4">
										<a href="cart.jsp" class="btn btn-default">
											<span class="glyphicon glyphicon-shopping-cart"></span> 查看购物车
										</a>
									</div>
								</div>
								
								<div class="row text-center address">
									<h4>收货地址</h4>
									<div class="col-sm-12 text-center addressMsg">
										<div>
											<span>${sessionScope.user.shippingAddress }</span>
										</div>
										<div>
											<span>${sessionScope.user.name }</span>
											<span>${sessionScope.user.telephone }</span>
										</div>
										<button class="btn btn-danger ModifyBtn">修改
											<span class="glyphicon glyphicon-edit"></span>
										</button>
									</div>
									<div class="col-md-11 col-sm-11 ModifyAddressMsg" hidden="hidden">
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
												code: 110000
											});
										</script>
										<div class="col-md-6 text-right">详细地址</div>
										<div class="col-md-6 text-left">
											<input type="text" name="address"/><span></span>
										</div>
										<div class="col-md-6 text-right">电话号码</div>
										<div class="col-md-6 text-left">
											<input type="text" name="telephone"  value="${sessionScope.user.telephone }"/><span></span>
										</div>
										<div class="col-md-6 text-right">收件人</div>
										<div class="col-md-6 text-left">
											<input type="text" name="name" value="${sessionScope.user.name }"/><span></span>
										</div>
										<button class="btn btn-info ModifyAddressMsgBtn">确认</button>
										<button class="btn btn-danger ModifyAddressMsgClose">关闭</button>
									</div>
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