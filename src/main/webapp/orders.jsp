<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="UTF-8">
		<title>用户结算页</title>
		<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
		<script src="bootstrap/js/jquery-3.1.0.min.js"></script>
		<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="css/navbar.css" />
		<script src="js/navbar.js"></script>
		<link rel="stylesheet" href="css/bill.css" />
		<script type="text/javascript" src="js/bill.js" ></script>
	</head>

	<body>
		<c:if test="${empty requestScope.orders && requestScope.state != false }">
			<jsp:forward page="Orders"></jsp:forward>
		</c:if>
		<%@include file="jspt/navbar.jsp" %>
			
		<!--网站导航-->
		<div class="container">
			<div class="row text-right">
				<a href="index.jsp">书城首页</a>><a href="user.jsp">用户</a>><span>订单管理</span>
			</div>
		</div>
		<!--end网站导航-->
		
		<!--隐藏评论-->
		<div class="text-center hidePl" hidden="hidden">
			<span>
				<div>
					<input type="radio" name="pj" value="3" checked="checked"/>好&nbsp;
					<input type="radio" name="pj" value="2" />中&nbsp;
					<input type="radio" name="pj" value="1" />差&nbsp;
					<br />
					<textarea style="color: black;" cols="40" rows="8"></textarea>
					<br />
					<input type="button" class="btn btn-info" value="提交"/>
					<input type="button" class="btn btn-danger" value="取消"/>
				</div>
			</span>
		</div>
		<!--end隐藏评论-->
		

		
		<!--订单页面-->
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<ul class="nav nav-tabs">
						<li class="active">
							<a href="#page1 " data-toggle="tab">待付款</a>
						</li>
						<li>
							<a href="#page2" data-toggle="tab">待收货</a>
						</li>
						<li>
							<a href="#page3" data-toggle="tab">待评价</a>
						</li>
						<li>
							<a href="#page4" data-toggle="tab">退款</a>
						</li>
						<li>
							<a href="#page5" data-toggle="tab">完成账单</a>
						</li>
					</ul>
					<div class="tab-content">
						<!--待付款-->
						<div class="tab-pane active" id="page1">
							<div class="top row text-center">
								<div class="col-xs-2">缩略图</div>
								<div class="col-xs-2">书名</div>
								<div class="col-xs-2">单价</div>
								<div class="col-xs-2">数量</div>
								<div class="col-xs-2">总价</div>
								<div class="col-xs-2">操作</div>
							</div>
							<!-- for -->
							<c:forEach items="${requestScope.orders }" var="olist">
								<c:if test="${olist.order.paystate == -1 }">
									<div class="bill text-center" data="${olist.book.id }">
										<div class="row">
											<div class="col-xs-2 bookimg">
												<a href="BookShow?id=${olist.book.id }">
													<img src="img/books/${olist.book.id }/1.jpg" />
												</a>
											</div>
											<div class="col-xs-2 bookname">
												<a href="BookShow?id=${olist.book.id }">${olist.book.name }</a>
											</div>
											<div class="col-xs-2 price">￥ ${olist.book.price }</div>
											<div class="col-xs-2 booksum">X ${olist.orderItem.buynum }</div>
											<div class="col-xs-2 priceSum">￥${olist.order.money }</div>
											<div class="col-xs-2 cancelBill">
												<a class="btn btn-danger btn-sm" href="OrderManagement?type=cancel&id=${olist.order.id }">取消订单</a>
												<a class="btn btn-info btn-sm" href="OrderManagement?type=pay&id=${olist.order.id }">付款</a>
											</div>
										</div>
									</div>
								</c:if>
							</c:forEach>
							
							
							<!-- forend -->
						</div>
						<!--待收货-->
						<div class="tab-pane" id="page2">
							<div class="top row text-center">
								<div class="col-xs-2">缩略图</div>
								<div class="col-xs-2">书名</div>
								<div class="col-xs-2">单价</div>
								<div class="col-xs-2">数量</div>
								<div class="col-xs-2">总价</div>
								<div class="col-xs-2">操作</div>
							</div>
							<c:forEach items="${requestScope.orders }" var="olist">
								<c:if test="${olist.order.paystate == -2 }">
									<div class="bill text-center" data="${olist.book.id }">
										<div class="row">
											<div class="col-xs-2 bookimg">
												<a href="BookShow?id=${olist.book.id }">
													<img src="img/books/${olist.book.id }/1.jpg" />
												</a>
											</div>
											<div class="col-xs-2 bookname">
												<a href="BookShow?id=${olist.book.id }">${olist.book.name }</a>
											</div>
											<div class="col-xs-2 price">￥${olist.book.price }</div>
											<div class="col-xs-2 booksum">X ${olist.orderItem.buynum }</div>
											<div class="col-xs-2 priceSum">￥${olist.order.money }</div>
											<div class="col-xs-2 cancelBill">
												<a class="btn btn-info btn-sm" href="OrderManagement?type=confirm&id=${olist.order.id }">确认收货</a>
												<a class="btn btn-danger btn-sm" href="OrderManagement?type=refund&id=${olist.order.id }">退款</a>
											</div>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</div>
						<!--待评价-->
						<div class="tab-pane" id="page3">
							<div class="top row text-center">
								<div class="col-xs-2">缩略图</div>
								<div class="col-xs-2">书名</div>
								<div class="col-xs-2">单价</div>
								<div class="col-xs-2">数量</div>
								<div class="col-xs-2">总价</div>
								<div class="col-xs-2">操作</div>
							</div>
							<c:forEach items="${requestScope.orders }" var="olist">
								<c:if test="${olist.order.paystate == -3 }">
									<div class="bill text-center" data="${olist.order.id }">
										<div class="row">
											<div class="col-xs-2 bookimg">
												<a href="BookShow?id=${olist.book.id }">
													<img src="img/books/${olist.book.id }/1.jpg" />
												</a>		
											</div>
											<div class="col-xs-2 bookname">
												<a href="BookShow?id=${olist.book.id }">${olist.book.name }</a>
											</div>
											<div class="col-xs-2 price">￥${olist.book.price }</div>
											<div class="col-xs-2 booksum">X${olist.orderItem.buynum }</div>
											<div class="col-xs-2 priceSum">￥${olist.order.money }</div>
											<div class="col-xs-2 cancelBill">
												<button class="btn btn-success btn-sm">去评价</button>
											</div>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</div>
						<!--退款-->
						<div class="tab-pane" id="page4">
							<div class="top row text-center">
								<div class="col-xs-2">缩略图</div>
								<div class="col-xs-2">书名</div>
								<div class="col-xs-2">单价</div>
								<div class="col-xs-2">数量</div>
								<div class="col-xs-2">总价</div>
								<div class="col-xs-2">状态</div>
							</div>
							<c:forEach items="${requestScope.orders }" var="olist">
								<c:if test="${olist.order.paystate == -4 }">
									<div class="bill text-center" data="8">
										<div class="row">
											<div class="col-xs-2 bookimg">
												<a href="BookShow?id=${olist.book.id }">
													<img src="img/books/${olist.book.id }/1.jpg" />
												</a>
											</div>
											<div class="col-xs-2 bookname">
												<a href="BookShow?id=${olist.book.id }">${olist.book.name }</a>
											</div>
											<div class="col-xs-2 price">￥${olist.book.price }</div>
											<div class="col-xs-2 booksum">X${olist.orderItem.buynum }</div>
											<div class="col-xs-2 priceSum">￥${olist.order.money }</div>
											<div class="col-xs-2 cancelBill">
												<a href="javascript:void(0)">退款中</a>
											</div>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</div>
						<!--完成订单-->
						<div class="tab-pane" id="page5">
							<div class="top row text-center">
								<div class="col-xs-2">缩略图</div>
								<div class="col-xs-1">书名</div>
								<div class="col-xs-2">账单号</div>
								<div class="col-xs-2">开始日期</div>
								<div class="col-xs-1">单价</div>
								<div class="col-xs-1">数量</div>
								<div class="col-xs-1">总价</div>
								<div class="col-xs-2">完成状态</div>
							</div>
							<c:forEach items="${requestScope.orders }" var="olist">
								<c:if test="${olist.order.paystate > 0 }">
									<div class="bill text-center">
										<div class="row">
											<div class="col-xs-2 bookimg">
												<a href="javascript:void(0)">
													<img src="img/books/${olist.book.id }/1.jpg" />
												</a>
											</div>
											<div class="col-xs-1 bookname text-center">
												${olist.book.name }
											</div>
											<div class="col-xs-2 billnum text-center">
												${olist.order.id }
											</div>
											<div class="col-xs-2 startdate text-center">
												${olist.order.ordertime }
											</div>
											<div class="col-xs-1 price">￥${olist.book.price }</div>
											<div class="col-xs-1 booksum">X${olist.orderItem.buynum }</div>
											<div class="col-xs-1 priceSum">￥${olist.order.money }</div>
											<div class="col-xs-2 price">
												<c:if test="${olist.order.paystate == 1 }">已完成</c:if>
												<c:if test="${olist.order.paystate == 2 }">已取消</c:if>
												<c:if test="${olist.order.paystate == 3 }">已退款</c:if>
											</div>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--end订单页面-->
		
		<%@include file="jspt/bottombar.jsp" %>
	</body>

</html>