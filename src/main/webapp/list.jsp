<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>搜索结果</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
<script src="bootstrap/js/jquery-3.1.0.min.js"></script>
<script src="bootstrap/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/navbar.js"></script>
<script type="text/javascript" src="js/list.js"></script>
<link rel="stylesheet" href="css/navbar.css" />
<link rel="stylesheet" href="css/list.css" />
		<script type="text/javascript">
$(function(){
	
	var bookxl ;
	var booksl ;
	var bookfl ;
	var pricemin ;
	var pricemax ;
	
	// 搜索按钮提交事件
	$("#sosoBtn").click(function(){
		var t = $("#soso").val();
			window.location.href="page?currentPage=1&minprice=0.0&maxprice=0.0&dressname="+t+"&category=";
	});
	
	// 价格区间按钮事件
	$(".price1").click(function(){
		$(".minprice").val("0");
		$(".maxprice").val("50");
	});
	$(".price2").click(function(){
		$(".minprice").val("51");
		$(".maxprice").val("200");
	});
	$(".price3").click(function(){
		$(".minprice").val("200");
		$(".maxprice").val("");
	});
	
	// 确定按钮
	$(".confirm").click(function(){
		var min = $(".minprice").val();
		var max = $(".maxprice").val();
/* 		var pnumSorting = $("#pnumSorting").val(); */
		var category = $("#category").val();;
		var name = $("#soso").val();
		var reg = /^[1-9][0-9]{0,20}$/;
		var url = "page?currentPage=1";
		if (min>0 && reg.test(min)){
			url = url + "&minprice=" + min; 
		}else{
			url = url + "&minprice=0.0";
		}
			
		if (max>0 && reg.test(max)){
			url = url + "&maxprice=" + max;
		}else{
			url = url + "&maxprice=0.0";
		}
/* 		if (pnumSorting !=null || pnumSorting !="")
			url = url + "&pnumSorting=" + pnumSorting; */
		if (category !=null || category !="")
			url = url + "&category=" + category;
		if (name !=null || name !="")
			url = url + "&dressname=" +name;
		 window.location.href = url;
	});
	
	// 加入购物车按钮
	$(".add").click(function(){
		var username = $("#username").html();
		if(username == null || username == ""){
			alert("请先登录!");
			return false;
		}else{
			var dressid = $(this).parent().parent().children("a").attr("href").split("id=")[1];
			$.ajax({
				type:"post",
				url:"addCart",
				data:"dressid=" + dressid +"&bookSum=1",
				success:function(t){
					if(t.msg=="true"){
						alert("添加购物车成功！");
					}else{
						alert("添加购物车失败");
					}
					
				},
				error:function(){
					alert("发生异常");
				}
			});
		
		}
	});	
	// ajax获取数据	
});
</script>
</head>
<body>

	<%@include file="jspt/navbar.jsp"%>
	<!--网站导航-->
	<div class="container">
		<div class="row text-right">
			<a href="index.jsp">时装城首页</a>><a href="user.jsp">用户</a>><span>搜索结果</span>
		</div>
	</div>
	<!--end网站导航-->

	<!--搜索框-->
	<div class="container" id="sosoDiv">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6 col-xs-12">
				<div class="col-xs-12 input-group">
					<input type="search" name="soso" id="soso" class="form-control"
						placeholder="搜索服装" aria-describedby="basic-addon1"
						value="${requestScope.pb.dressCondition.dressname }" /> <span
						class="input-group-btn" aria-describedby="basic-addon2">
						<button type="button" class="btn btn-info" id="sosoBtn">
							<span class="glyphicon glyphicon-search"></span>
						</button>
					</span>
				</div>
			</div>
			<div class="col-md-3"></div>
		</div>
	</div>
	<!--end搜索框-->


	<!--筛选条件-->
	<div class="container sxtjDiv">
		<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<span class="bookfl n"> &nbsp;&nbsp;&nbsp;数量 <select
					id="pnumSorting">
						<option class="btn btn-default" value="">默认</option>
						
				</select> <span class="bookfl c"> &nbsp;&nbsp;&nbsp;分类 <select
						id="category">
							<option class="btn btn-default" value="">无</option>
							<option class="btn btn-default" value="女装">女装</option>
							<option class="btn btn-default" value="男装">男装</option>
							<option class="btn btn-default" value="童装">童装</option>
							<option class="btn btn-default" value="婚纱">婚纱</option>
					</select>
						<div hidden="hidden" id="c">${requestScope.pb.dressCondition.category}</div>
						<script>
							var find = "option[value='" + $("#c").text() + "']"
							$(".bookfl").find(find)
									.attr("selected", "selected")
						</script>
				</span> <a href="javascript:void(0)"
					class="navbar-btn btn btn-link pnumBtn" data="di"
					disabled="disabled">价格从低到高&nbsp;</a> <btn
						class="text-center navbar-btn priceInput">
					<div class="btn-group">
						<input type="number" class="dropdown btn-group minprice"
							placeholder="￥" maxlength="4"
							value="${requestScope.pb.dressCondition.minprice }" /> <input
							type="number" class="dropdown btn-group maxprice" placeholder="￥"
							maxlength="4" value="${requestScope.pb.dressCondition.maxprice }" />
						<div class="dropdown btn-group ">
							<button type="button" class="priceInterval"
								data-toggle="dropdown">
								区间<span class="caret"></span>
							</button>
							<ul class="dropdown-menu">
								<li class="dropdown-header">便宜</li>
								<li class="price1"><a href="javascript:void(0)"> < 50</a></li>
								<li role="separator" class="divider"></li>
								<li class="dropdown-header">一般</li>
								<li class="price2"><a href="javascript:void(0)">51-200</a></li>
								<li role="separator" class="divider"></li>
								<li class="dropdown-header">昂贵</li>
								<li class="price3"><a href="javascript:void(0)"> > 200</a></li>
							</ul>
						</div>
						<button class="dropdown btn-group confirm">确定</button>
					</div>
			</div>
		</div>
	</div>
	</nav>
	</div>
	<!--end筛选条件-->

	<!--列表块-->
	<div id="dow" hidden="hidden">
		<span> 添加成功 </span>
	</div>
	<div class="container booklist">
		<div class="row">
			<!-- for -->
 			<c:if test="${requestScope.pb.dresses[0] == null }">
				<div class="col-md-12 col-sm-12 col-xs-12 text-center">
					没有搜索到东西哦~
				</div>
			</c:if> 
			<c:forEach items="${requestScope.pb.dresses }" var="b">
				<div class="col-md-3 col-sm-6 col-xs-12">
					<div>
						<a href="showDress?id=${b.dressid }">
							<div style="background-image: url(${b.imgurl });"
								class="bookimg"></div>
						</a>
						<div class="bookStr">
							<span class="money">￥${b.price }</span>&nbsp; <span class="by">包邮</span>
							<br /> <a href="showDress?id=${b.dressid }">
								<div class="text-center">
									<b>${b.dressname }</b>
								</div> <span>销量</span>${b.sales } <span> 数量</span>${b.quantity }
							</a><br /> <span class="btn-group btn-group-sm add_con">
								<button
									class="addbook glyphicon glyphicon-shopping-cart btn btn-default add"></button>
								<button
									class="contact glyphicon glyphicon-comment btn btn-default"></button>
							</span>
						</div>
					</div>
				</div>
			</c:forEach>
			
			<!-- for end -->
			<h1 class="row text-center pageBtnDiv">
				<div class="col-xs-12">
					<div class="btn-group btn-group-lg">
						<a class="btn btn-default"
							href="
							page?currentPage=${requestScope.pb.currentPage == 1 ? 1:requestScope.pb.currentPage-1 }
							&category=${requestScope.pb.dressCondition.category}
							&dressname=${requestScope.pb.dressCondition.dressname}
							&minprice=${requestScope.pb.dressCondition.minprice}
							&maxprice=${requestScope.pb.dressCondition.maxprice}
							">上一页</a>
						<a class="btn btn-default" disabled="disabled">${requestScope.pb.currentPage }</a>
						<a class="btn btn-default"
							href="page?currentPage=${requestScope.pb.currentPage == requestScope.pb.totalPage ? requestScope.pb.totalPage:requestScope.pb.currentPage+1 }
							&category=${requestScope.pb.dressCondition.category}
							&dressname=${requestScope.pb.dressCondition.dressname}
							&minprice=${requestScope.pb.dressCondition.minprice}
							&maxprice=${requestScope.pb.dressCondition.maxprice}
							">下一页</a>
						<a class="btn btn-default" disabled="disabled">共${requestScope.pb.totalPage}页</a>
					</div>
				</div>

			</h1>
		</div>
	</div>
	<!--end列表块-->

	<%@include file="jspt/bottombar.jsp"%>
</body>
</html>
