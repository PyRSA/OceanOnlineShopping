
//$(function(){
//	
//	var bookxl ;
//	var booksl ;
//	var bookfl ;
//	var pricemin ;
//	var pricemax ;
//	
//	// 搜索按钮提交事件
//	$("#sosoBtn").click(function(){
//		var t = $("#soso").val();
//		var arr = new Array();
//		arr = t.split("");
//		t = "";
//		for(var i = 0; i < arr.length; i ++){
//			t = t + "u" + arr[i].charCodeAt(0).toString(16);
//		}
//		if(t.length>0)
//			window.location.href="page?name="+t;
//	});
//	
//	// 价格区间按钮事件
//	$(".price1").click(function(){
//		$(".minprice").val("0");
//		$(".maxprice").val("50");
//	});
//	$(".price2").click(function(){
//		$(".minprice").val("51");
//		$(".maxprice").val("200");
//	});
//	$(".price3").click(function(){
//		$(".minprice").val("200");
//		$(".maxprice").val("");
//	});
//	
//	// 确定按钮
//	$(".confirm").click(function(){
//		var min = $(".minprice").val();
//		var max = $(".maxprice").val();
//		var pnumSorting = $("#pnumSorting").val();
//		var category = $("#category").val();;
//		var name = $("#soso").val();
//		var reg = /^[1-9][0-9]{0,20}$/;
//		var url = "page?flag=1";
//		if (min>0 && reg.test(min))
//			url = url + "&minprice=" + min 
//		if (max>0 && reg.test(max))
//			url = url + "&maxprice=" + max;
//		if (pnumSorting !=null || pnumSorting !="")
//			url = url + "&pnumSorting=" + pnumSorting;
//		if (category !=null || category !="")
//			url = url + "&category=" + category;
//		if (name !=null || name !="")
//			url = url + "&name=" +name;
//		 window.location.href = url;
//	});
//	
//	// 加入购物车按钮
//	$(".add").click(function(){
//		var username = $("#username").html();
//		if(username == null || username == ""){
//			alert("请先登录!");
//			return false;
//		}else{
//			var bookid = $(this).parent().parent().children("a").attr("href").split("id=")[1];
//			alert(bookid);
//			$.ajax({
//				type:"post",
//				url:"addCart",
//				data:"bookid=" + bookid +"&bookSum=1",
//				success:function(t){
//					if(t.msg=="true"){
//						alert("添加成功！");
//					}else{
//						alert("添加失败");
//					}
//					/*if(s == "true"){
//						alert("添加成功！");
//					}else if(s == "false"){
//						alert("添加失败");
//					}else if(s == "Not logged in"){
//						alert("请登录");
//						$("#maxDiv").slideDown();
//					}*/
//				},
//				error:function(){
//					alert("发生异常");
//				}
//			});
//		
//		}
//	});
//	
//	// ajax获取数据
//	
//});