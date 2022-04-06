<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>管理员</title>
		<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
		<script type="text/javascript" src="bootstrap/js/jquery-3.1.0.min.js"></script>
		<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/navbar.js"></script>
		<link rel="stylesheet" href="css/navbar.css" />
		<link rel="stylesheet" href="css/admin.css" />
		<script type="text/javascript" src="js/admin.js"></script>
	</head>

	<body>
		<c:if test="${sessionScope.user.role != 'admin' }">
			<jsp:forward page="index.jsp"></jsp:forward>
		</c:if>
		<%@include file="jspt/navbar.jsp"%>
		<!--网站导航-->
		<div class="container">
			<div class="row text-right">
				<a href="index.jsp">书城首页</a>><span>管理员</span>
			</div>
		</div>
		<!--end网站导航-->

		<div class="container">
			<div class="row">
				<ul class="nav nav-tabs">
					<li class="active">
						<a href="#page0" data-toggle="tab">用户管理</a>
					</li>
					<li class="">
						<a href="#page1" data-toggle="tab">订单管理</a>
					</li>
					<li class="">
						<a href="#page3" data-toggle="tab">商品管理</a>
					</li>
				</ul>
				<div class="tab-content">
					<!--用户管理-->
					<div class="tab-pane active" id="page0">
						<br />
						<div class="container">
							<ul class="nav nav-pills">
								<li class="active">
									<a href="#adduser" data-toggle="tab">增加用户</a>
								</li>
								<li class="">
									<a href="#deleuser" data-toggle="tab">删除用户</a>
								</li>
								<li class="">
									<a href="#moduser" data-toggle="tab">修改用户</a>
								</li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="adduser">
									<br />
									<a class="btn btn-success" href="registered.jsp"><span class="glyphicon glyphicon-hand-right"></span> 前去注册新账户</a><br />
									<i>注：添加管理员应先注册普通账户再由已有的管理员修改该账户的用户的类型</i>
								</div>
								<div class="tab-pane" id="deleuser">
									<br />
									<input type="radio" name="deleuser" value="ID" checked="checked" />ID&nbsp;&nbsp;
									<input type="radio" name="deleuser" value="username" />用户名&nbsp;&nbsp;
									<input type="text" name="deleuserdate" />
									<button type="button" class="glyphicon glyphicon-search soso"></button><span></span>
									<br /><br />
									<div class="deleuserdateDiv" hidden="hidden">
										<h2>用户资料</h2>
										<table class="table" id="deleUserDate">
											<tr>
												<td>ID</td>
												<td></td>
											</tr>
											<tr>
												<td>用户名</td>
												<td></td>
											</tr>
											<tr>
												<td>姓名</td>
												<td></td>
											</tr>
											<tr>
												<td>性别</td>
												<td></td>
											</tr>
											<tr>
												<td>邮箱</td>
												<td></td>
											</tr>
											<tr>
												<td>电话号码</td>
												<td></td>
											</tr>
											<tr>
												<td>用户类型</td>
												<td></td>
											</tr>
											<tr>
												<td>描述</td>
												<td></td>
											</tr>
											<tr>
												<td>用户状态</td>
												<td></td>
											</tr>
											<tr>
												<td>注册时间</td>
												<td></td>
											</tr>
											<tr>
												<td>地址</td>
												<td></td>
											</tr>
										</table>
										<div class="text-center">
											<button class="btn btn-danger btn-lg">删除</button>
										</div>
									</div>
									<div class="notFindUser" hidden="hidden"></div>

								</div>
								<div class="tab-pane" id="moduser">
									<br />
									<input type="radio" name="moduser" value="ID" checked="checked" />ID&nbsp;&nbsp;
									<input type="radio" name="moduser" value="username" />用户名&nbsp;&nbsp;
									<input type="text" name="modiuserdate" /><span></span>
									<br /><br />
									<div hidden="hidden" class="notFindUsertomod">没有找到用户</div>
									<div class="modiuserdataDiv" hidden="hidden">
										<h3>用户资料</h3>
										<table class="table">
											<tr>
												<td>ID</td>
												<td><input type="text" name="id" value="" disabled="disabled" /></td>
											</tr>
											<tr>
												<td>用户名</td>
												<td><input type="text" name="username" value="" /></td>
											</tr>
											<tr>
												<td>姓名</td>
												<td><input type="text" name="name" /></td>
											</tr>
											<tr>
												<td>性别</td>
												<td><input type="radio" name="gender" value="m" />男&nbsp;<input type="radio" name="gender" value="m" />女&nbsp;</td>
											</tr>
											<tr>
												<td>邮箱</td>
												<td><input type="text" name="email" value="446" /></td>
											</tr>
											<tr>
												<td>电话号码</td>
												<td><input type="text" name="telephone" value="446" /></td>
											</tr>
											<tr>
												<td>描述</td>
												<td><input type="text" name="introduce" value="446" /></td>
											</tr>
											<tr>
												<td>用户状态</td>
												<td>
													<input type="radio" name="state1" value="1" />正常&nbsp;&nbsp;
													<input type="radio" name="state1" value="0" />冻结&nbsp;&nbsp;
												</td>
											</tr>
											<tr>
												<td>用户类型</td>
												<td>
													<input type="radio" name="role" value="admin" />管理员&nbsp;&nbsp;
													<input type="radio" name="role" value="vip" />会员&nbsp;&nbsp;
												</td>
											</tr>
											<tr>
												<td>注册时间</td>
												<td><input type="text" name="regtime" value="" disabled="disabled" /></td>
											</tr>
										</table>
										<div class="text-center">
											<button class="btn btn-danger">确认修改</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--订单管理-->
					<div class="tab-pane" id="page1">
						<div class="container ordersAdmin">
							<br />
							<h4>订单管理</h4>
							<div class="">
								<div>
									<input type="radio" name="state" value="all" checked="" />全部&nbsp;&nbsp;
									<input type="radio" name="state" value="-1" />待付款&nbsp;&nbsp;
									<input type="radio" name="state" value="-2" />待收货&nbsp;&nbsp;
									<input type="radio" name="state" value="-3" />待评价&nbsp;&nbsp;
									<input type="radio" name="state" value="-4" />退款中&nbsp;&nbsp;
									<input type="radio" name="state" value="0" />已完成&nbsp;&nbsp;
								</div>
								<div class="ordertop row">
									<div class="col-md-2">订单ID</div>
									<div class="col-md-2">商品ID</div>
									<div class="col-md-2">用户ID</div>
									<div class="col-md-2">购买数量</div>
									<div class="col-md-2">状态</div>
									<div class="col-md-2">操作</div>
								</div>
								<button class="btn btn-default prve">上一页</button>
								<span>第5页/共20页</span>
								<button class="btn btn-default next">下一页</button>
							</div>
						</div>

					</div>
					
					<!--商品管理-->
					<div class="tab-pane" id="page3">
						<div class="container porAdmin">
							<br />
							<ul class="nav nav-pills">
								<li class="active">
									<a href="#delepro" data-toggle="tab">删除</a>
								</li>
								<li class="">
									<a href="#modipro" data-toggle="tab">修改</a>
								</li>
								<li class="">
									<a href="#addpro" data-toggle="tab">添加</a>
								</li>
							</ul>
							<div>
								<div class="tab-content">
									<div class="tab-pane active" id="delepro">
										<br /> ID&nbsp;&nbsp;
										<input type="text" name="proID" />
										<button class="soso glyphicon glyphicon-search"></button>
										<span></span>
										<button class="btn btn-danger btn-sm dele" hidden="hidden">删除</button>
									</div>
									<div class="tab-pane" id="modipro">
										<br /> ID <input type="text" /><button class="soso">搜索</button>
										<table class="table"hidden="hidden" >
											<tr>
												<td>书籍名</td>
												<td>
													<input type="text" name="bookname" value="">
													<button class="btn btn-danger btn-sm">修改</button>
												</td>
											</tr>
											<tr>
												<td>价格</td>
												<td>
													<input type="text" name="price" value="">
													<button class="btn btn-danger btn-sm">修改</button>
												</td>
											</tr>
											<tr>
												<td>数量</td>
												<td>
													<input type="text" name="pnum" value="">
													<button class="btn btn-danger btn-sm">修改</button>
												</td>
											</tr>
										</table>
									</div>
									<div class="tab-pane" id="addpro">
										<br />
										<a href="add.jsp" class="btn btn-success "><span class="glyphicon glyphicon-hand-right"></span>&nbsp;前去添加</a>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
		<%@include file="jspt/bottombar.jsp" %>
	</body>

</html>