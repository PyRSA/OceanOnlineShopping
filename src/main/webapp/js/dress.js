$(function(){
	
	var bookid = 1;//获取书本id
	
	/* 图片放大 */
	$.fn.magnifying = function(){
		var that = $(this),
		 $imgCon = that.find('.con-fangDaIMg'),//正常图片容器
		 	$Img = $imgCon.find('img'),//正常图片，还有放大图片集合
		   $Drag = that.find('.magnifyingBegin'),//拖动滑动容器
		   $show = that.find('.magnifyingShow'),//放大镜显示区域
		$showIMg = $show.find('img'),//放大镜图片
		$ImgList = that.find('.con-FangDa-ImgList > li >img'),
		multiple = $show.width()/$Drag.width();

		$imgCon.mousemove(function(e){
			$Drag.css('display','block');
			$show.css('display','block');
		   	var iX = e.pageX - $(this).offset().left - $Drag.width()/2,
		   		iY = e.pageY - $(this).offset().top - $Drag.height()/2,	
		   		MaxX = $imgCon.width()-$Drag.width(),
		   		MaxY = $imgCon.height()-$Drag.height();
		   	iX = iX > 0 ? iX : 0;
		   	iX = iX < MaxX ? iX : MaxX;
		   	iY = iY > 0 ? iY : 0;
		   	iY = iY < MaxY ? iY : MaxY;	
		   	$Drag.css({left:iX+'px',top:iY+'px'});	   		
		   	$showIMg.css({marginLeft:-multiple*iX+'px',marginTop:-multiple*iY+'px'});
		});
		$imgCon.mouseout(function(){
		   	$Drag.css('display','none');
			$show.css('display','none');
		});

		$ImgList.click(function(){
			var NowSrc = $(this).data('bigimg');
			$Img.attr('src',NowSrc);
			$(this).parent().addClass('active').siblings().removeClass('active');
		});	
	}
	$("#fangdajing").magnifying();
	
	/* 按钮事件 */
	
	// 添加书本事件
	var max = $(".buyMax").find("a").text();
	var price = $(".price").find("span").text();
	$("#addbooknum").click(function(){
		var num = $("#booknum").val();
		var reg = /^[0-9]{1,9999}/;
		if(reg.test(num)){
			if(max>num){
				if(num>=0){
					$("#booknum").val(parseInt(num)+1+"");
					$(".priceSum").find("span").text("￥"+ (parseInt(num)+1) * parseInt(price));
				}
			}else{
				$("#booknum").val(max+"");
			}
		}else{
			$("#booknum").val("1");
			$(".priceSum").find("span").text(price);
		}
	});
	
	$("#removebooknum").click(function(){
		var num = $("#booknum").val();
		var reg = /^[0-9]{1,9999}/;
		if(reg.test(num)){
			if(num>0){
				$("#booknum").val(parseInt(num)-1+"");
				$(".priceSum").find("span").text("￥"+ (parseInt(num)-1) * parseInt(price));
			}
		}else{
			$("#booknum").val("1");
			$(".priceSum").find("span").text(price);
		}
	});
	
	$("#booknum").bind("input propertychange",function(){
	    var num = $("#booknum").val();
		var reg = /^[0-9]{1,9999}/;
		if(reg.test(num)){
			if(max>num&&num>0){
				$(".priceSum").find("span").text("￥"+ (parseInt(num)) * parseInt(price));
			}
			if(parseInt(num)>parseInt(max)){
				$(".priceSum").find("span").text("￥"+ max * parseInt(price));
				$("#booknum").val(max);
			}
		}else{
			$("#booknum").val("1");
			$(".priceSum").find("span").text(price);
		}
	});
	
	// 购买和加入购物车
	$("#isadd").click(function(){
		var username = $("#username").html();
		if(username == null || username == ""){
			alert("请先登录!");
			return false;
		}else{			
			var dressid = $(this).attr("data");
			var booksum = $("#booknum").val();
			if(booksum>0){
				$.ajax({
					url:"addCart",
					type:"post",
					data:"bookSum="+booksum+"&dressid="+dressid,
					success:function(t){
						if(t.msg=="true"){
							$(".msgDiv").find("span").text("添加成功");
							$(".msgDiv").slideToggle(500);
							$(".msgDiv").slideToggle(500);
						}else{
							/*$(".msgDiv").find("span").text("添加失败");*/
							$(".msgDiv").slideToggle(500);
							$(".msgDiv").slideToggle(500);
						}
					},
					error:function(){
						$(".msgDiv").find("span").text("服务器链接异常");
						$(".msgDiv").slideToggle(500);
						$(".msgDiv").slideToggle(500);
					}
				});
			}else{
				alert("请输入数量");
			}
		};
	});
	
//	// 购买和加入购物车
//	$("#isadd").click(function(){
//		var bookid = $(this).attr("data");
//		//alert(bookid);
//		var booksum = $("#booknum").val();
//		if(booksum>0){
//			$.ajax({
//				url:"addCart",
//				type:"post",
//				data:"bookSum="+booksum+"&bookid="+bookid,
//				dataType:"text",
//				success:function(t){
//					if(t.msg=="true"){
//						$(".msgDiv").find("span").text("添加成功");
//						$(".msgDiv").slideToggle(500);
//						$(".msgDiv").slideToggle(500);
//					}else{
//						$(".msgDiv").find("span").text("添加失败");
//						$(".msgDiv").slideToggle(500);
//						$(".msgDiv").slideToggle(500);
//					}
//				},
//				error:function(){
//					$(".msgDiv").find("span").text("服务器链接异常");
//					$(".msgDiv").slideToggle(500);
//					$(".msgDiv").slideToggle(500);
//				}
//			});
//		}else{
//			alert("请输入数量");
//		}
//	});
	
	$("#isbuy").click(function(){
		var priceSum = parseInt($(".priceSum").find("span").text());
		var booksum = $("#booknum").val();
		if(booksum>0){ 
			window.location.href="OrderNew?" + "booksum="+booksum+"&bookid="+bookid;
		}else{
			alert("请输入数量");
		}
	});
	
	// 放大及关闭评论图片,
	function fdplimg(){
		$(".plimg").click(function(){
			$(this).parent().find(".maximg").hide();
			var imgurl = $(this).attr("src");
			$(this).parent().find(".plmaximg").attr("src",imgurl);
			$(this).parent().find(".maximg").show(1000);
			$(this).css("border","solid 2px #31B0D5");
			$(this).next("img").css("border","solid 2px rgba(0,0,0,0.5)");
			$(this).prev("img").css("border","solid 2px rgba(0,0,0,0.5)");
		});
		$(".closeimg").click(function(){
			$(this).parent().hide(1000);
		});
	
	}
	
	$("input[name='pl']").click(function(){
		$("#pageNum").text("第1页");
		ajaxGetData(1);
	});
	
	// 评论显示全部（初始化）
	ajaxGetData(1);
	
	// ajax获取页面数据  
	function ajaxGetData(currentPage){
		var evaluationType = $("input[name='pl']:checked").val();
		var id = window.location.href.split("id=")[1];
		$.ajax({ 
			url:"getBookEvaluation",
			type:"post",
			data:"evaluationType=" + evaluationType +"&currentPage=" + currentPage + "&id=" + id,
			dataType:"json",
			success:function(json){
				$("#pageSum").text("共" + json.totalPage +"页");
				$(".plStr").children().remove();//清空评论块
				var allevaluation = json.evaluation; 
				var buyers = allevaluation.length;
				for(var i = 0; i<allevaluation.length; i++){
					var type = allevaluation[i].type;
					if(type == "vip")
						type = "会员";
					else if(type == "admin")
						type = "管理员";
					else
						type = "外星人";
					var html = "<div class='row'>"
							+ "<div class='col-xs-9'>"
							+ "<p class='plStr_str'>"
							+ allevaluation[i].str
							+ "</p>"
							+ "<br />"
							+ "<br />"
							+ "<div class='maximg' hidden='hidden'>"
							+ "<img height='300px' class='plmaximg'/>"
							+ "<span class='glyphicon glyphicon-remove closeimg'></span>"
							+ "</div>"
							+ "<span class='buydate'>"
							+ allevaluation[i].date
							+ "</span>"
							+ "</div>"
							+ "<div class='col-xs-3 mj'><span class='name'>"
							+ allevaluation[i].name
							+ "</span><br /><span class='type'>"
							+ type
							+ "</span>"
							+ "</div>"
							+ "</div>"
							+ "<hr />";
					$(".plStr").append(html);
					fdplimg();
				}
				if(buyers == 0){
					$(".plStr").append("<div align='center'>当前还没有人评论哦</div>");
				} 
			}/*,  
			error:function(){
				alert("发生异常");
			}*/
		});
	} 
	
	// 上一页按钮事件
	$("#prevButton").click(function(){
		var pageNum = parseInt($("#pageNum").text().substring(1));
		if(pageNum > 1){
			var prevPageNum = pageNum - 1;
			var evaluationType = $(".plnavbar").find("input:checked").val();
			$("#pageNum").text("第" + prevPageNum + "页");
			ajaxGetData(prevPageNum,evaluationType);
		}else{
			alert("前面没有了");
		}
	});
	
	// 下一页按钮事件
	$("#nextButton").click(function(){
		var pageNum = parseInt($("#pageNum").text().substring(1));
		var pageSum = parseInt($("#pageSum").text().substring(1));
		if(pageNum < pageSum){
			var nextPageNum = pageNum + 1;
			var evaluationType = $(".plnavbar").find("input:checked").val();
			$("#pageNum").text("第" + nextPageNum + "页");
			ajaxGetData(nextPageNum,evaluationType);
		}else{
			alert("后面没有了");
		}
	});
	
	
});