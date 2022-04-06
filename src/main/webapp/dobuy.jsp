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
		<script src="bootstrap/js/jquery-1.11.2.min.js"></script>
		<script src="bootstrap/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="css/navbar.css" />
		<script src="js/navbar.js"></script>
		<link rel="stylesheet" href="css/dobuy.css" />
		<script  src="js/dobuy.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#order").click(function(){
				var billids = new Array();
				billid =  $(".bill").attr("data");
				var addressType = $("input[type='radio']:checked").attr("data");
				var province = $("select[name='province']").val();
				var city = $("select[name='city']").val();
				var Area = $("select[name='area']").val();
				var telephone = $("#telephone").val();
				var detailed = $("#detailed").val();
				alert("test!");
				if(addressType == "newaddress"){
					if(addressTest().province() && addressTest().city() && addressTest().area() && addressTest().detailed() && addressTest().telephone() && confirm("是否去付款？")){
						window.location.href ="addOrder?addressType=" 
									+ addressType + "&province="
									+ province + "&city="
									+ city + "&area="
									+ Area + "&telephone="
									+ telephone + "&detailed="
									+ detailed;
					}
				}else{
					window.location.href = "addOrder?addressType=" 
									+ addressType;
				}
			});
			
		});
	</script>
	</head>

	<body>

		<%@include file="jspt/navbar.jsp" %>
		<!--网站导航-->
		<div class="container">
			<div class="row text-right">
				<a href="index.jsp">时装城首页</a>>
				<a href="user.jsp">用户</a>><span>购买</span>
			</div>
		</div>
		<!--end网站导航-->

		<!--购买页面-->
		<div class="container buyPage">
			<div class="row row1">
				<div class="col-md-12">
					<span>
						1、收货地址
					</span>
					<hr />
				</div>
			</div>
			<div class="row address">
				<div class="col-md-12 useraddress">
					<div class="col-md-3">
						<input type="radio" name="address" data="defaultaddress" value="user" checked="checked" />用户地址
					</div>
					<div class="col-md-9">
						<span>
							${sessionScope.user.shippingAddress }
						</span>
						<span>
							${sessionScope.user.name }
						</span>
						<span>
							${sessionScope.user.telephone }
						</span>
					</div>
				</div>
				<div class="col-md-12 useraddress">
					<div class="col-md-3">
						<input type="radio" name="address" data="newaddress" value="user" />新地址
					</div>
					<div class="col-md-9">
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
						详细地址&nbsp;<input type="text" id="detailed"/>&nbsp;
						电话号码&nbsp;<input type="text" id="telephone"/>
					</div>
				</div>
			</div>
			<div class="row row1">
				<div class="col-md-12">
					<span>
						2、确认订单
					</span>
					<hr />
				</div>&nbsp;
			</div>
			<div class="row headStr">
				<div class="col-md-3">
					订单详情
				</div>
				<div class="col-md-3">
					数量
				</div>
				<div class="col-md-3">
					单价
				</div>
				<div class="col-md-3">
					总价
				</div>
			</div>
			<c:forEach items="${cartlist }" var="cart">
				<div class="row bill" data="${requestScope.order.id }">
				<div class="col-md-3">
					<img src="${cart.dress.imgurl }" />
					<a href="showDress?id=${cart.dress.dressid }">${cart.dress.dressname }</a>
				</div>
				<div class="col-md-3 bookSum">
					X${cart.booknum}
				</div>
				<div class="col-md-3 bookSum">
					￥${cart.dress.price }
				</div>
				<div class="col-md-3 priceSum">
					￥${cart.dress.price*cart.booknum }
				</div>
			</div>
			</c:forEach>
			<div class="row text-right buyBtn">
				<span>￥${sum}
				</span>
				<button class="btn btn-danger btn-lg" id="order">提交订单</button>
			</div>
		</div>
		<!--end购买页面-->
		<%@include file="jspt/bottombar.jsp" %>
	</body>

</html>