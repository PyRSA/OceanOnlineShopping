<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>详情</title>
		<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
		<script src="bootstrap/js/jquery-3.1.0.min.js" ></script>
		<script src="bootstrap/js/jquery-1.11.2.min.js"></script>
		<script src="bootstrap/js/bootstrap.min.js" ></script>
		<link rel="stylesheet" href="css/navbar.css" />
		<link rel="stylesheet" href="css/book.css" />
		<script src="js/navbar.js" ></script>
		<script  src="js/dress.js" ></script>
	</head>
	<body>

		<!--隐藏提醒块-->
		<div class="msgDiv" hidden="hidden">
			<span></span>
		</div>
		<!--end 隐藏提醒块-->
		
		<%@include file="jspt/navbar.jsp" %>
		
		<!--网站导航-->
		<div class="container">
			<div class="row text-right">
				<a href="index.jsp">时装城首页</a>><a href="user.jsp">用户</a>><span>商品详情</span>
			</div>
		</div>
		<!--end网站导航-->
		
		<!--详情块-->
		<div class="container bookMsg">
			<div class="row">
				<div class="col-md-6 col-xs-12">
					<!--图片放大-->
					<div class="con-FangDa" id="fangdajing">
						<div class="con-fangDaIMg">
							<img src="${dress.imgurl}"/>

							<div class="magnifyingBegin"></div>
							<div class="magnifyingShow"><img src="${dress.imgurl}"/></div>
						</div>
						<ul class="con-FangDa-ImgList">
							<!-- 图片显示列表 -->
							<c:forEach items="${requestScope.bookimgurls }" var="i">
								<li class="active"><img src="${i }" data-bigimg="${i }"></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="col-md-6 col-xs-12"class="details">
					<div class="bookname">${dress.dressname}
						<span id="ckepop">
							<span class="jiathis_txt">分享到</span>
							<a href="http://www.jiathis.com/share"  class="jiathis jiathis_txt jiathis_separator jtico jtico_jiathis" target="_blank">更多</a>
							<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js?uid=1" charset="utf-8"></script>
						</span>
						<script>
							$("#ckepop").css("position","absolute");
							$("#ckepop").css("margin-left","120px");
							$("#ckepop").css("margin-top","10px");
						</script>
						<p>&nbsp;</p>
					</div>
					<span id="share">
						
					<div class="priceStr">
						<span class="str">单价</span>
						<span class="price">￥<span>${dress.price}</span></span>
					</div>
					<div class="sales">
						<span class="glyphicon glyphicon-map-marker"></span>
						广州<br />
						月销量
						<span>${dress.sales }</span>
						&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;
						累计评论
						<span>${evlist.size() }</span>
						<div>
							<hr />
						</div>
					</div>
					<div class="buy">
						<span class="input-group">
							<span class="input-group-btn" id="basic-addon1">
				  				<button class="btn btn-default" id="removebooknum">
				  					<span class="glyphicon glyphicon-minus"></span>
				  				</button>
				  			</span>
							<input type="text" class="form-control" placeholder="数量" aria-describedby="basic-addon1" id="booknum" value="1">
							<span class="input-group-btn" id="basic-addon3">
				  				<button class="btn btn-default" id="addbooknum">
				  					<span class="glyphicon glyphicon-plus"></span>
				  				</button>
				  			</span>
						</span>
						<span class="buyMax">最多可购买<a>${dress.quantity}</a>件</span>
						<div class="priceSum">
							总价
							<span>￥${dress.price}</span>
						</div>
						<div class="button">
							<button type="button" id="isadd" data="${dress.dressid}"><span class="glyphicon glyphicon-shopping-cart"></span>加入购物车</button>
							<button type="button" id="isbuy">立即购买</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--end详情块-->
		
		<!--商品信息列表-->
		<div class="container bookMsglist">
			<div class="row">
				<div class="col-xs-12">
					<ul class="nav nav-tabs">
						<li>
							<a href="#page1 " data-toggle="tab">
								<span class="glyphicon glyphicon-align-justify"></span>&nbsp;
								商品详情
							</a>
						</li>
						<li  class="active">
							<a href="#page2" data-toggle="tab">
								<span class="glyphicon glyphicon-comment"></span>
								买家评论
							</a>
						</li>
					</ul>
					<div class="tab-content">
						<!--信息页-->
						<div class="tab-pane" id="page1">
							<div class="msg">
								<span>产品参数：</span>
								<div class="table">
									<table class="table table-responsive">
									    <tr>
									        <td>商品名称：&nbsp;&nbsp;${dress.dressname}</td>
									    </tr>
									   <%--  <tr>
									        <td>作者：&nbsp;&nbsp;${dress.author}</td>
									    </tr> --%>
									    <tr>
									        <td>类型：&nbsp;&nbsp;${dress.category}</td>
									    </tr>
									</table>
								</div>
							</div>
							<div class="miaoshu">
								<span>描述</span>
								<p>
									${dress.description}
								</p>
							</div>
							<hr class="endhr"/>
							<div class="text-center">我是有底线的</div>
						</div>
						
						<!--评论页-->
						<div class="tab-pane active" id="page2">
							<div class="plnavbar">&nbsp;&nbsp;&nbsp;
								<input type="radio" name="pl" value="all" checked="checked"/>全部&nbsp;
								<input type="radio" name="pl" value="bad"/>好评&nbsp;
								<input type="radio" name="pl" value="general"/>中评&nbsp;
								<input type="radio" name="pl" value="good"/>差评&nbsp;
							</div>
							<div class="plStr container">
							<table>
									<tr><td>评论内容</td><td>评论人</td><td>时间</td></tr>
									<c:forEach items="${evlist }" var="ev">
										<tr>
											<td>${ev.comments }</td>
											<td>${ev.user.username }</td>
											<td>${ev.time.toLocaleString() }</td>
										</tr>											
									</c:forEach>
								</table>
								
							</div>
							<div class="pagebutton container">
									<div class="row">
										<nav>
											<ul class="pagination pagination-sm">
												<li>
													<a href="javascript:void(0)" id="prevButton"><span>&laquo;</span></a>
												</li>
												<li class="active">
													<a href="javascript:void(0)" id="pageNum">第1页</a>
												</li>
												<li>
													<a href="javascript:void(0)" id="nextButton"><span>&raquo;</span></a>
												</li>
												<li>
													<span id="pageSum">共6页</span>
												</li>
											</ul>
										</nav>
									</div>
								</div>
							<hr class="endhr"/>
							<div class="text-center">我是有底线的</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
		<!--end商品信息列表-->
		
		<%@include file="jspt/bottombar.jsp" %>
			
	</body>

	
</html>
