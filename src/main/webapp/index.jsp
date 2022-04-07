<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
	<meta charset="UTF-8">
	<title>海洋购物商城</title>
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
	<script src="bootstrap/js/jquery-3.1.0.min.js"></script>
	<script src="bootstrap/js/jquery-1.11.2.min.js"></script>
	<script src="js/jquery.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>

    
	<link rel="stylesheet" href="css/index.css" />
	<link rel="stylesheet" href="css/navbar.css" />
	<script src="js/index.js"></script>
	<script src="js/navbar.js" ></script>		
</head>


	<body>
		<%@include file="jspt/navbar.jsp"%>		
		<!--搜索框-->
		<div class="container" id="sosoDiv">
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6 col-xs-12">
					<div class="col-xs-12 input-group">
						<input type="text" name="soso" id="soso" class="form-control"  placeholder="搜索服装"  aria-describedby="basic-addon1"/>
						<span class="input-group-btn" aria-describedby="basic-addon2">
							<button type="button" class="btn btn-info" id="sosoBtn">
								<span class="glyphicon glyphicon-search"></span>
							</button>
						</span>
					</div>
				</div>
				<div class="col-md-3"></div>
			</div>
		</div>
		<!--end 搜索框-->
		
		<!--主页面-->
		<div class="container text-center mainPage">
			<div class="row">
				<div class="col-md-2 col-sm-4 col-xs-4 con1">
					<div class="col-xs-12 row1">
						主题
					</div>
					<div class="col-xs-12 row2">
						<div class="it"><a href="page?category=女装&currentPage=1&minprice=0.0&maxprice=0.0"><font>女装/男装/童装</font></a><div class="glyphicon">></div></div>
						<div class="wx"><a href="page?category=男装&currentPage=1&minprice=0.0&maxprice=0.0"><font>T恤/秋裤/毛衣</font></a><div class="glyphicon">></div></div>
						<div class="sh"><a href="page?category=童装&currentPage=1&minprice=0.0&maxprice=0.0"><font>上衣/牛仔/套装</font></a><div class="glyphicon">></div></div>
						<div class="sh"><a href="page?category=婚纱&currentPage=1&minprice=0.0&maxprice=0.0"><font>头饰/婚纱/浪漫 </font></a><div class="glyphicon">></div></div>						
						<div class="qt"><font>其他</font><div class="glyphicon">></div></div>
					</div>
				</div>
				<div class="col-md-8 col-sm-4 col-xs-4 con2">
					<div class="col-xs-12 row3">
						&nbsp;
					</div>
					
					<div class="col-xs-12 row4">
						<div class="ztfl1" hidden="hidden" data="h">
							<h1>女装</h1>
							<div>
								<a href="javascript:void(0)">裙子</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">西装</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">衬衣</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">上装</a>&nbsp;&nbsp;&nbsp;
							</div>

							<h1>男装</h1>
							<div>
								<a href="javascript:void(0)">男西装</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">男衫衣</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">运动装</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">休闲服</a>&nbsp;&nbsp;&nbsp;
							</div>
							<h1>童装</h1>
							<div>
								<a href="javascript:void(0)">小清新</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">上衣</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">内衣</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">口水肩</a>&nbsp;&nbsp;&nbsp;
							</div>
						</div>
						<div class="ztfl2" hidden="hidden" data="h">
							<h1>文学</h1>
							<div>
								<a href="javascript:void(0)">战争与和平</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">巴黎圣母院</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">罪与罚</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">阿Q正传</a>&nbsp;&nbsp;&nbsp;
							</div>
							<h1>历史</h1>
							<div>
								<a href="javascript:void(0)">万历十五年</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">全球通史</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">资治通鉴</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">失落的一代</a>&nbsp;&nbsp;&nbsp;
							</div>
							<h1>思想</h1>
							<div>
								<a href="javascript:void(0)">论语</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">马克思主义</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">道德经</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">毛泽东思想</a>&nbsp;&nbsp;&nbsp;
							</div>
						</div>
						<div class="ztfl3" hidden="hidden" data="h">
							<h1>生活</h1>
							<div>
								<a href="javascript:void(0)">我的世界</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">时光之味</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">数独游戏技巧</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">玩转魔方</a>&nbsp;&nbsp;&nbsp;
							</div>
							<h1>语言</h1>
							<div>
								<a href="javascript:void(0)">英语</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">中文</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">日语</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">俄语</a>&nbsp;&nbsp;&nbsp;
							</div>
							<h1>人际</h1>
							<div>
								<a href="javascript:void(0)">非暴力沟通</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">关键对话</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">沟通的艺术</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">卡耐基人际交往心理学</a>&nbsp;&nbsp;&nbsp;
							</div>
						</div>
						<div class="ztfl4" hidden="hidden" data="h">
							<h1>人文</h1>
							<div>
								<a href="javascript:void(0)">地理与世界霸权</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">邓小平时代</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">舌尖上的中国</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">走遍中国</a>&nbsp;&nbsp;&nbsp;
							</div>
							<h1>艺术</h1>
							<div>
								<a href="javascript:void(0)">瞬间永恒</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">摄影入门：拍出美照</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">从黎明到黄昏</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">传奇布列松</a>&nbsp;&nbsp;&nbsp;
							</div>
							<h1>行为</h1>
							<div>
								<a href="javascript:void(0)">组织行为学</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">人的行为</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">微反应 微表情</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">消费者行为学</a>&nbsp;&nbsp;&nbsp;
							</div>
						</div>
						<div class="ztfl5" hidden="hidden" data="h">
							<h1>体育</h1>
							<div>
								<a href="javascript:void(0)">足球</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">篮球</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">跳水</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">乒乓球</a>&nbsp;&nbsp;&nbsp;
							</div>
							<h1>运动</h1>
							<div>
								<a href="javascript:void(0)">跳水教学</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">跑步教学</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">运动的规律</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">健康运动</a>&nbsp;&nbsp;&nbsp;
							</div>
							<h1>生理</h1>
							<div>
								<a href="javascript:void(0)">生理学</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">病理生理学</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">医学生理学</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">口腔解剖生理学</a>&nbsp;&nbsp;&nbsp;
							</div>
						</div>
						<div class="ztfl6" hidden="hidden" data="h">
							<h1>政治</h1>
							<div>
								<a href="javascript:void(0)">为什么是毛泽东</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">大外交</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">政治的逻辑</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">穿越历史时空看长</a>&nbsp;&nbsp;&nbsp;
							</div>
							<h1>军事</h1>
							<div>
								<a href="javascript:void(0)">二战那些事</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">决战朝鲜</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">孙子兵法</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">战争回忆录</a>&nbsp;&nbsp;&nbsp;
							</div>
							<h1>经济</h1>
							<div>
								<a href="javascript:void(0)">零工经济</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">经济学的尺度</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">外贸高手客户成交技</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">涛动周期论</a>&nbsp;&nbsp;&nbsp;
							</div>
						</div>
						<div class="ztfl7" hidden="hidden" data="h">
							<h1>其他</h1>
						</div>
						<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
							<div class="carousel-inner">
								<div class="item active">
									<div id="img1" class="imglunbo">
										<a href="showBook?id=1"><img src="img/female/t25.jpg" class="img-responsive"/></a>
									</div>
								</div>
								<div class="item" >
									<div id="img2"  class="imglunbo">
										<a href="showBook?id=825328203"><img src="img/female/t26.jpg" class="img-responsive"/></a>
									</div>
								</div>
								<div class="item">
									<div id="img3"  class="imglunbo">
										<a href="showBook?id=127917942"><img src="img/female/t29.jpg" class="img-responsive"/></a>
									</div>
								</div>
								<div class="item">
									<div id="img4"  class="imglunbo">
										<a href="showBook?id=2"><img src="img/female/t40.jpg" class="img-responsive"/></a>
									</div>
								</div>
							</div>
							<a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
								<span class="glyphicon glyphicon-chevron-left"></span>
							</a>
							<a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
								<span class="glyphicon glyphicon-chevron-right"></span>
							</a>
							<ol class="carousel-indicators">
								<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
								<li data-target="#carousel-example-generic" data-slide-to="1" ></li>
								<li data-target="#carousel-example-generic" data-slide-to="2" ></li>
								<li data-target="#carousel-example-generic" data-slide-to="3" ></li>
							</ol>
						</div>
					</div>
				</div>
				<div class="col-md-2 col-sm-4 col-xs-4 con3 text-center">
					<c:if test="${empty sessionScope.user }">
						<a href="javascript:void(0)" class="col-xs-12 row5">
							<img src="img/defaultUserHeadImg.jpg" height="100px" width="100px"/>
						</a>
						<div class="col-xs-12 row6">
							<p class="welcomeStr">Hi~欢迎来到网上时装城！</p>
							<a class="username" href="javascript:void(0)"><h3 id="index_username">游客</h3></a>
							<button type="button" class="btn btn-info loginBtn loginbutton">登录</button>
							<a href="registered.jsp" class="btn btn-primary reBtn">注册</a>
						</div>
					</c:if>
					<c:if test="${not empty sessionScope.user }">
						<a href="user.jsp" class="col-xs-12 row5">
							<img src="${user.headimg }" height="100px" width="100px"/>
						</a>
						<div class="col-xs-12 row6">
							<p class="welcomeStr">Hi~欢迎来到海风网上时装城！</p>
							<a class="username" href="user.jsp"><h3 id="index_username">${user.name }</h3></a>
							<button type="button" class="btn btn-info loginBtn loginbutton">登录</button>
							<a href="registered.jsp" class="btn btn-primary reBtn">注册</a>
							<script type="text/javascript">
								$(".loginbutton").hide();
								$(".reBtn").hide();
							</script>
						</div>
					</c:if>
					<a href="http://ww.baidu.com">
						<div class="col-xs-12 row7" id="msDiv">
							<h1>进入秒杀</h1>
							<h3 style="color: #C0C0C0;">SECKILL</h3>
							<img src="img/miaosha.png" class="miaoshaimg"/><br />
							<span class="msjs">距本场秒杀结束剩余</span><br />
							<span class="mstime hh">02</span>
							<span class="mstime mm">59</span>
							<span class="mstime ss">59</span>
						</div>
					</a>
					
				</div>
			</div>
		</div>
		<!--end 主页面-->
		
		<!--排行榜-->
		<div class="container phpDiv">
			<div class="row">
				<div class="col-md-6 col-xs-12 list1">
					<h4><a target="_blank"
						   href="https://xiapi.xiapibuy.com/Large-Size-Dress-cat.11040766.11040791.11040795?page=0&sortBy=sales">热销排行</a></h4>
					<div class="col-md-4 col-xs-12 book" style="background-image: url(img/female/t10.jpg);
					 height: auto; background-repeat: no-repeat">
						&nbsp;
						<div class="bookMsg">
							<a class="bookname" target="_blank"
							   href="https://xiapi.xiapibuy.com/%E2%9D%A4%E3%80%90%E5%A4%A7%E5%B0%BA%E7%A2%BC%E7%A6%AE%E6%9C%8D%E3%80%91%E5%90%88%E5%94%B1%E5%9C%98%E7%A6%AE%E6%9C%8D%E5%A5%B3%E9%95%B7%E8%A3%99-%E8%A1%A8%E6%BC%94%E6%9C%8D-%E7%B7%8A%E8%BA%AB%E5%A5%B3%E4%B8%BB%E6%8C%81%E4%BA%BA%E7%A6%AE%E6%9C%8D-%E6%99%9A%E6%9C%83%E6%B0%A3%E8%B3%AA%E9%95%B7%E6%AC%BE%E6%B4%8B%E8%A3%9D-%E5%B0%BE%E7%89%99%E9%85%92%E6%9C%83%E7%B7%8A%E8%BA%AB%E9%A1%AF%E7%98%A6%E5%B0%8F%E7%A6%AE%E6%9C%8D-%E7%AB%AF%E8%8E%8A%E5%A4%A7%E6%B0%A3%E6%99%9A%E5%AE%B4%E6%9C%8D-i.58373826.17303162051">
							<a class="bookname" target="_blank"
							   href="https://xiapi.xiapibuy.com/%E6%B0%91%E4%BF%97%E9%A2%A8%E6%9C%8D%E9%A3%BE%E5%96%9C%E5%AE%B4%E6%B4%8B%E8%A3%9D%E5%A4%A7%E5%B0%BA%E7%A2%BC%E4%BC%B4%E5%A8%98%E6%9C%8D%E4%B8%BB%E5%A9%9A%E4%BA%BA%E7%A6%AE%E6%9C%8D%E7%A6%AE%E6%9C%8D%E5%A9%9A%E7%A6%AE%E6%99%9A%E5%AE%B4%E4%BC%B4%E5%A8%98-i.686101410.15364538051">
						</div>
					</div>
					<div class="col-md-4 col-xs-12 book" style="background-image: url(img/female/t39.jpg);height: auto; background-repeat: no-repeat">
						&nbsp;
						<div class="bookMsg">
							<a class="bookname" target="_blank"
							   href="https://xiapi.xiapibuy.com/%E3%80%90%E7%8F%BE%E8%B2%A8%E5%85%8D%E9%81%8B%E3%80%91%E5%A9%9A%E7%B4%97-%E6%96%B0%E5%A8%98%E6%8A%B9%E8%83%B8%E9%BD%8A%E5%9C%B0%E9%9F%93%E7%B3%BB%E7%B0%A1%E7%B4%84%E5%BD%B1%E6%A8%93%E5%A4%A7%E5%B0%BA%E7%A2%BC%E9%A1%AF%E7%98%A6-%E9%95%B7%E6%AC%BE%E7%A6%AE%E6%9C%8D-%E5%A5%B3%E7%94%9F%E8%BC%95%E5%A9%9A%E7%B4%97%E7%A6%AE%E6%9C%8D-%E6%B4%8B%E8%A3%9D-%E5%A9%9A%E7%B4%97%E7%A6%AE%E6%9C%8D-%E7%99%BD%E8%89%B2%E6%B4%8B%E8%A3%9D-i.145028917.8598794973">
						</div>
					</div>
					<div class="col-md-4 col-xs-12 book" style="background-image: url(img/female/t38.jpg);height: auto; background-repeat: no-repeat">
						&nbsp;
						<div class="bookMsg">
							<a class="bookname" target="_blank"
							   href="https://xiapi.xiapibuy.com/%E2%9D%A4%E3%80%90%E5%A4%A7%E5%B0%BA%E7%A2%BC%E7%A6%AE%E6%9C%8D%E3%80%91%E5%90%88%E5%94%B1%E5%9C%98%E7%A6%AE%E6%9C%8D%E5%A5%B3%E9%95%B7%E8%A3%99-%E8%A1%A8%E6%BC%94%E6%9C%8D-%E7%B7%8A%E8%BA%AB%E5%A5%B3%E4%B8%BB%E6%8C%81%E4%BA%BA%E7%A6%AE%E6%9C%8D-%E6%99%9A%E6%9C%83%E6%B0%A3%E8%B3%AA%E9%95%B7%E6%AC%BE%E6%B4%8B%E8%A3%9D-%E5%B0%BE%E7%89%99%E9%85%92%E6%9C%83%E7%B7%8A%E8%BA%AB%E9%A1%AF%E7%98%A6%E5%B0%8F%E7%A6%AE%E6%9C%8D-%E7%AB%AF%E8%8E%8A%E5%A4%A7%E6%B0%A3%E6%99%9A%E5%AE%B4%E6%9C%8D-i.58373826.17303162051">
						</div>
					</div>
					</div>
				<div class="col-md-6 col-xs-12 list2">
					<h4><a target="_blank"
						   href="https://xiapi.xiapibuy.com/Large-Size-Dress-cat.11040766.11040791.11040795?page=0&sortBy=relevancy">好评排行</a></h4>
					<div class="col-md-4 col-xs-12 book" style="background-image: url(img/female/t34.jpg);height: auto; background-repeat: no-repeat">
						&nbsp;
						<div class="bookMsg">
							<a class="bookname" href="javascript:void(0)">
						</div>
					</div>
					<div class="col-md-4 col-xs-12 book" style="background-image: url(img/female/t32.jpg);height: auto;
					background-repeat: no-repeat">
						&nbsp;
						<div class="bookMsg">
							<a class="bookname" href="javascript:void(0)">
						</div>
					</div>
					<div class="col-md-4 col-xs-12 book" style="background-image: url(img/female/t35.jpg);height: auto; background-repeat: no-repeat">
						&nbsp;
						<div class="bookMsg">
							<a class="bookname" href="javascript:void(0)">
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--end 排行榜-->
		<%@include file="jspt/bottombar.jsp" %>
	</body>
	<script type="text/javascript">
	 /* 搜索按钮提交事件 */
	$("#sosoBtn").click(function(){
		var t = $("#soso").val();
			window.location.href="page?currentPage=1&minprice=0.0&maxprice=0.0&dressname="+t+"&category=";
	});
	</script>
</html>