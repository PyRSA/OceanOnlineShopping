<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">	
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="bootstrap/js/jquery-3.1.0.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css" />
		<script type="text/javascript">
		$(function(){
			alert("aaa");
			
		});
		</script>
</head>
<body>
		<!--主页面-->
		<div class="container text-center mainPage">
			<div class="row">
				<div class="col-md-2 col-sm-4 col-xs-4 con1">
					<div class="col-xs-12 row1">
						主题
					</div>
					<div class="col-xs-12 row2">
						<div class="it"><a href="page?category=计算机"><font>软件/硬件/网络</font></a><div class="glyphicon">></div></div>
						<div class="wx"><a href="page?category=文学"><font>文学/历史/思想</font></a><div class="glyphicon">></div></div>
						<div class="sh"><a href="page?category=生活"><font>生活/语言/人际</font></a><div class="glyphicon">></div></div>
						<div class="rw"><font>人文/艺术/行为</font><div class="glyphicon">></div></div>
						<div class="ty"><font>体育/运动/生理</font><div class="glyphicon">></div></div>
						<div class="zc"><font>政治/军事/经济</font><div class="glyphicon">></div></div>
						<div class="qt"><font>其他</font><div class="glyphicon">></div></div>
					</div>
				</div>
				<div class="col-md-8 col-sm-4 col-xs-4 con2">
					<div class="col-xs-12 row3">
						&nbsp;
					</div>
					
					<div class="col-xs-12 row4">
						<div class="ztfl1" hidden="hidden" data="h">
							<h1>软件</h1>
							<div>
								<a href="javascript:void(0)">java</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">桌面应用开发</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">webap开发</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">软件工程</a>&nbsp;&nbsp;&nbsp;
							</div>
							<h1>硬件</h1>
							<div>
								<a href="javascript:void(0)">单片机开发</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">嵌入式系统</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">低功耗蓝牙开发</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">互联网</a>&nbsp;&nbsp;&nbsp;
							</div>
							<h1>网络</h1>
							<div>
								<a href="javascript:void(0)">计算机网络</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">思科技术网络开发</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">TVP/IP网络编程</a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)">网络爬虫全解析</a>&nbsp;&nbsp;&nbsp;
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
										<a href="showBook?id=1"><img src="img/books/1/1.jpg" class="img-responsive"/></a>
									</div>
								</div>
								<div class="item" >
									<div id="img2"  class="imglunbo">
										<a href="showBook?id=825328203"><img src="img/books/825328203/1.jpg" class="img-responsive"/></a>
									</div>
								</div>
								<div class="item">
									<div id="img3"  class="imglunbo">
										<a href="showBook?id=127917942"><img src="img/books/127917942/1.jpg" class="img-responsive"/></a>
									</div>
								</div>
								<div class="item">
									<div id="img4"  class="imglunbo">
										<a href="showBook?id=2"><img src="img/books/2/1.jpg" class="img-responsive"/></a>
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
							<p class="welcomeStr">Hi~欢迎来到网上书城！</p>
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
							<p class="welcomeStr">Hi~欢迎来到网上书城！</p>
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
							<span class="mstime hh">59</span>
							<span class="mstime mm">59</span>
							<span class="mstime ss">59</span>
						</div>
					</a>
					
				</div>
			</div>
		</div>
		<!--end 主页面-->
</body>
</html>