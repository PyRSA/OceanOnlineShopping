<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>购物车</title>
		<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
		<script src="bootstrap/js/jquery-3.1.0.min.js" ></script>
		<script src="bootstrap/js/jquery-1.11.2.min.js"></script>
		<script src="bootstrap/js/bootstrap.min.js" ></script>
		<link rel="stylesheet" href="css/navbar.css" />
		<script src="js/navbar.js" ></script>
		<link rel="stylesheet" href="css/cart.css" />
<!-- 		<script  src="js/cart.js" ></script> -->
		<script src="http://qzonestyle.gtimg.cn/qzone/app/qzlike/qzopensl.js#jsdate=20111201" charset="utf-8"></script>
		<script src="http://connect.qq.com/widget/loader/loader.js" widget="shareqq" charset="utf-8"></script>
		<script type="text/javascript">
		
		$(function(){
			// 减少书本数量事件
			$(".remove").click(function(){
				var reg = /^[0-9]{1,}$/;
				var price = parseFloat($(this).parent().parent().parent().prevAll(".price").find(".money").text());
				var num = $(this).parent().next().val();
				var max = parseInt($(this).parent().parent().prevAll(".booknumMax").find(".max").text());
				if(reg.test(num)){
					var id = $(this).parents(".bookMsg").attr("data");
					if(parseInt(num) < 2){
						$(this).parent().next().val(1);
						if(parseInt(num) == 1 ||parseInt(num) == 0){
							$(this).parent().parent().parent().next().find(".sum").text(price);
							priceSum();					
						}
					}else{
						$(this).parent().next().val(parseInt(num)-1);
						$(this).parent().parent().parent().next().find(".sum").text($(this).parent().next().val()*price);

						$.ajax({
							url:"updateCart",
							type:"post",
							data:{"cartid":id,"bookSum":parseInt(num)-1}
						});
						priceSum();
					}
					

				}else{
					$(this).parent().next().val(1);
					$(this).parent().parent().parent().next().find(".sum").text($(this).parent().next().val()*price);
					priceSum();
				}
				
			});

			// 添加书本数量事件
			$(".add").click(function(){
				var reg = /^[0-9]{1,}$/;
				var price = parseFloat($(this).parent().parent().parent().prevAll(".price").find(".money").text());
				var num = $(this).parent().prev().val();
				var max = parseInt($(this).parent().parent().prevAll(".booknumMax").find(".max").text());
				if(reg.test(num)){
					var id = $(this).parents(".bookMsg").attr("data");
					
					
					if(parseInt(num) >= max){
						
						$(this).parent().prev().val(max);
						$(this).parent().parent().parent().next().find(".sum").text(max*price);
						priceSum();
					}else{
						
						$(this).parent().prev().val(parseInt(num)+1);
						
						$(this).parent().parent().parent().next().find(".sum").text((parseInt(num)+1)*price);
						
						priceSum();

						
						$.ajax({
							url:"updateCart",
							type:"post",
							data:{"cartid":id,"bookSum":(parseInt(num)+1)}
						});
						
					}
					

				}else{
					$(this).parent().next().val(1);
					$(this).parent().parent().parent().next().find(".sum").text(price);
					priceSum();
				}
			});
			

			// 输入框值变化事件
			$(".bn").bind("input propertychange",function(){
				var id = $(".bookMsg").attr("data");
				var reg = /^[1-9]{1,}$/;
				var price = parseFloat($(this).parent().parent().prevAll(".price").find(".money").text());
				var num = $(this).val();
				var max = parseInt($(this).parent().prevAll(".booknumMax").find(".max").text());
				if(reg.test(num)){
					if(parseInt(num)>=max){
						$(this).parent().parent().next().find(".sum").text(price*max);
						$(this).val(max);
						priceSum();
					}else{
						$(this).parent().parent().next().find(".sum").text(num*max);
						priceSum();
						$.ajax({
							url:"updateCart",
							type:"post",
							data:{"cartid":id,"bookSum":parseInt(num)}
						});

					}
				}else{
					$(this).val();
				}
			});

			// 输入失去焦点事件
			$(".bn").blur(function(){
				var id = $(".bookMsg").attr("data");
				var price = parseFloat($(this).parent().parent().prevAll(".price").find(".money").text());
				var num = $(this).val();
				var reg = /^[1-9][0-9]{0,}$/;
				if(!reg.test(num)){
					$(this).val(1);
					$(this).parent().parent().next().find(".sum").text(price);
					priceSum();
				}else{
					priceSum();
					$.ajax({
						url:"updateCart",
						type:"post",
						data:{"cartid":id,"bookSum":parseInt(num)}
					});
				}
			});

			// 删除单个购物车
			$(".deleteBook").click(function(){
				var id = $(this).parents(".bookMsg").attr("data");

				var bookname = $(this).parent().prevAll(".msg").find("img").attr("title");
				var ms = $(this).parent().prevAll(".msg").find("a").text();
				var bookMsg = $(this).parent().parent();
				var state = confirm("是否删除？" + bookname + "\t" + ms);
				if(state){
					$.ajax({
						url:"removeCart",
						type:"post",
						data:{"cartid":id},
						dataType:"json",
						success:function(result){
							if(result.state == "true"){
								bookMsg.remove();
								priceSum();
								cartisnull();
								
							}
						}
					});
					priceSum();
					cartisnull();
					window.location.reload();
				}
				
			});

			// 单个选择商品
			$(".bookMsg").find("input[type='checkbox']").click(function(){
				document.getElementById("checkAll").checked = false;
				var ids = document.getElementsByName("ids");
				var state = new Array();;
				for (var i = 0; i < ids.length; i++) {
					state[i] = ids[i].checked+"";
				}
				var truenum = 0;
				for(var i = 0; i < state.length; i++){
					if(state[i] == "true"){
						truenum = truenum + 1;
					}
				}
				if(truenum == state.length)
					document.getElementById("checkAll").checked = true;
				getCheckdeNum();
				priceSum();
			});

			// 选择全部商品
			$(".checkAll").change(function(){
				var flag = document.getElementById("checkAll").checked;
				var ids = document.getElementsByName("ids");
				for (var i = 0; i < ids.length; i++) {
					ids[i].checked = flag;
				}
				getCheckdeNum();
				priceSum();
			});



			// 结算多个
			$("#settlementBooks").click(function(){
				var bookids_a = document.getElementsByName("ID");
				var data = "?";
				for(var i = 0; i<bookids_a.length; i++){
					var $input= $(bookids_a[i]).parent().parent().prevAll(".checkbox").find("input:checked");
					if($input.length == 1){
						var id = bookids_a[i].href.split("id=")[1];
						var booknum = $(bookids_a[i]).parent().parent().nextAll(".booknum").find(".bn").val();
						data = data + "book=[" + id + "][" + booknum + "]&";
					}
				}
				data = data.substring(0,data.length-1)
				if(data.length>1){
					window.location.href = "http://www.baidu.com" + data; 
					//资源路径
				}
			});

			// 删除多个购物车
			$("#deleteBooks").click(function(){
				var bookids_a = document.getElementsByName("ID");
				var booknames = new Array();
				var ajaxdata = "";
				var booknamesStr = "";
				for(var i = 0; i<bookids_a.length; i++){
					var $input= $(bookids_a[i]).parent().parent().prevAll(".checkbox").find("input:checked");
					if($input.length == 1){
						var id = bookids_a[i].href.split("id=")[1];
						booknames[i] = $(bookids_a[i]).parent().prev().attr("title");
						ajaxdata = ajaxdata + "id=" + id + "&";
					}else{
						booknames[i] = " ";
					}
				}
				for(var i = 0; i<booknames.length; i++){
					if(booknames[i] !=" "){
						booknamesStr = booknamesStr + booknames[i] + "  ";
					}
				}
				ajaxdata = ajaxdata.substring(0,ajaxdata.length-1);
				
				if(ajaxdata.length>1){
					if(confirm("是否确定要删除？\n")){
						$.ajax({
							url:"removeCartAll",
							type:"get",
							data:ajaxdata,
							
							success:function(t){
								if(t.state == "true"){
									$(".bookMsg").find("input:checked").parent().parent().remove();
									priceSum(); 
									window.location.reload();
								} else{
									alert("删除失败");
								} 
							},
							error:function(){
								alert("服务器异常或未连接");
							}
						});
						//资源路径
						
					}
				}else{
					alert("未选择商品");
				}
				cartisnull();
			});

			// 获取已选商品个数函数
			function getCheckdeNum(){
				var checkednum = $(".bookMsg").find("input:checked").length;
				$(".choose").find("span").text(checkednum);
			}


			// 计算总价函数
			priceSum(); 
			function priceSum(){
				var obj = $($(".cartlist").find("input:checked").parent().parent().find(".sum"));
				var sum = 0.0;
				for(var i = 0; i<obj.length; i++){
					sum = sum + parseFloat(obj[i].innerText);
				}
				$(".hj").find("span").text(sum);
			}

			// 判断购物车是否为空函数
			cartisnull();
			function cartisnull(){
				var bookMsgs = $(".cartlist").find(".bookMsg");
				if(bookMsgs.length == 0)
					$(".cartisnull").show(100);
			}
			
			function Operation(id,type) {
				$.post("CartNumOperation","type=" + type + "&cart_id=" + id,function(t){
					if(t == "false" && type == "add")
						alert("添加失败");
					if(t == "false" && type == "rem")
						alert("减少失败");
				});
			}
			
			
		});
		</script>
	
	</head>
	<body>

		<%@include file="jspt/navbar.jsp" %>
		<!--网站导航-->
		<div class="container">
			<div class="row text-right">
				<a href="index.jsp">书城首页</a>><a href="user.jsp">用户</a>><span>购物车</span>
			</div>
		</div>
		<!--end网站导航-->
		
		<!--购物车列表-->
		<div class="container cartlist">
			<div class="row total">
				<div class="col-xs-12">
					<input type="checkbox" class="checkAll" id="checkAll"/><span>全选</span>&nbsp;
					<span class="choose">已选
						<span>
							0
						</span>
						件商品
					</span>
					<button class="btn btn-default" id="deleteBooks">删除</button>
					<span class="hj">合计&nbsp;￥
						<span>${sum }</span>
					</span>
				</div>
			</div>
			<div class="row cartlisttop">
				<div class="col-md-1 col-sm-6 col-xs-12">
				</div>
				<div class="col-md-3 col-sm-6 col-xs-12">
					商品信息
				</div>
				<div class="col-md-2 col-sm-6 col-xs-12">
					单价
				</div>
				<div class="col-md-2 col-sm-6 col-xs-12">
					数量
				</div>
				<div class="col-md-2 col-sm-6 col-xs-12">
					金额
				</div>
				<div class="col-md-2 col-sm-6 col-xs-12">
					操作
				</div>
			</div>
			<!-- for -->
			<c:forEach items="${cartlist }" var="c">
				<div class="row bookMsg" data="${c.id }">
					<div class="col-md-1 col-sm-6 col-xs-12 checkbox">
						<input type="checkbox" name="ids" value=${c.id }/>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-12 msg">
						<img src="${c.dress.imgurl }" class="cartbookimg" title="霸王别姬"/>
						<span>
							<a href="showDress?id=${c.dress.dressid }" name="ID">${c.dress.dressname }</a>
						</span>
					</div>
					<div class="col-md-2 col-sm-6 col-xs-12 price">
						<span>￥<span class="money">${c.dress.price }</span></span>
					</div>
					<div class="col-md-2 col-sm-6 col-xs-12 booknum">
						<div class="booknumMax">
							<span>最多可购买<span class="max">${c.dress.quantity }</span>件</span>
						</div>
						<div class="input-group input-group-sm">
							<span class="input-group-btn" id="basic-addon1">
					  			<button class="btn btn-default remove">
					  				<span class="glyphicon glyphicon-minus"></span>
					  			</button>
					  		</span>
							<input type="text" class="form-control bn" placeholder="数量" aria-describedby="basic-addon1" value="${c.booknum }" disabled="disabled">
							<span class="input-group-btn" id="basic-addon3">
					  			<button class="btn btn-default add">
					  				<span class="glyphicon glyphicon-plus"></span>
					  			</button>
					  		</span>
						</div>
					</div>
					<div class="col-md-2 col-sm-6 col-xs-12 priceSum">
						<span>￥<span class="sum">${c.dress.price * c.booknum }</span></span>
					</div>
					<div class="col-md-2 col-sm-6 col-xs-12 operation">
						
						<button class="btn btn-danger deleteBook">
							<span class="glyphicon glyphicon-trash">
							</span>
						</button>
					</div>
				</div>
			</c:forEach>
			<!-- forend -->
			<div class="row text-center cartisnull" hidden="hidden">
				<span>
					您的购物车为空
					<span class="glyphicon glyphicon-hand-right"></span>
					<a href="index.jsp">快去选购吧</a>
				</span>
			</div>
			<div style="text-align:right"><button  class="btn btn-warning" onclick="checkSelect()">去结算</button></div>
			<div class="row cartlistbotton">
			</div>
			
		</div>
		
		<!--end购物车列表-->
		<%@include file="jspt/bottombar.jsp" %>
	</body>
	<script type="text/javascript">

	function checkSelect(){
		var sum=$(".hj").find("span").text();
		
		if(parseFloat(sum)==0){
			alert("请选择要结算的商品!");
			return false;
		}
		location.href="cartToOrder?"+getSelectCartId()+"&sum="+sum;
	}
	function getSelectCartId(){
		var objs = document.getElementsByName("ids");
		var str="ids=";
		var id="";
		for (var i = 0; i < objs.length; i++) {
			if($(objs[i]).is(":checked")){
				id=objs[i].value;
				id=id.substring(0,id.length-1);
				str+=id+"&ids=";
			}
		}
		//alert(ids);
		str=str.substring(0,str.length-5);
		//alert(ids);
		return str;
	}
	
	</script>
	
</html>
