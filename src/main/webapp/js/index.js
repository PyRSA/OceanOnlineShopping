/**
 * 主页js
 */

$(function() {

	
	// 轮播素材
	/** 主题分类事件 **/

	// a标签事件
	$(".row4").find("a[href='javascript:void(0)']").click(function(){
		var t = $(this).text();
		var arr = new Array();
		arr = t.split("");
		t = "";
		for(var i = 0; i < arr.length; i ++){
			t = t + "u" + arr[i].charCodeAt(0).toString(16);
		}
		if(t.length > 0)
			window.location.href="List?name=" + t;
		alert(val);
	});
	
	// 显示
	$(".it").mouseenter(function() {
		$("div[data='h']").hide();
		$(".ztfl1").slideDown(100);
	});

	$(".wx").mouseenter(function() {
		$("div[data='h']").hide();
		$(".ztfl2").slideDown(100);
	});

	$(".sh").mouseenter(function() {
		$("div[data='h']").hide();
		$(".ztfl3").slideDown(100);
	});

	$(".rw").mouseenter(function() {
		$("div[data='h']").hide();
		$(".ztfl4").slideDown(100);
	});

	$(".ty").mouseenter(function() {
		$("div[data='h']").hide();
		$(".ztfl5").slideDown(100);
	});

	$(".zc").mouseenter(function() {
		$("div[data='h']").hide();
		$(".ztfl6").slideDown(100);
	});

	$(".qt").mouseenter(function() {
		$("div[data='h']").hide();
		$(".ztfl7").slideDown(100);
	});

	// 隐藏
	$(".row4").not().mouseleave(function() {
		$("div[data='h']").hide();
	});

	$(".mainPage").not().mouseleave(function() {
		$("div[data='h']").hide();
	});

	$(".row3,.row1,.row5,.row6,.row7").mouseenter(function() {
		$("div[data='h']").hide();
	});

	/** 秒杀块 **/
	/*var ms = 1000 * 60 * 0.1; 
	setMSstr(ms);*/// 用于测试2分钟
	// 秒杀块事件
	setMSstr(10000 * 60 * 0.1 * 100);
//	$.ajax({
//		url: "", //秒杀时间servlet地址
//		type: "post",
//		data: "true",
//		dataType: "text",
//		success: function(i) {
//			setMSstr(i);
//		},
//		error: function() {
//			setMSstr(600000);
//			//alert("连接异常!");
//		}
//	});
	
	/** 链接按钮事件 **/
	
	
	/*// 搜索按钮提交事件
	$("#sosoBtn").click(function(){
		var t = $("#soso").val();
		var arr = new Array();
		arr = t.split("");
		t = "";
		for(var i = 0; i < arr.length; i ++){
			t = t + "u" + arr[i].charCodeAt(0).toString(16);
		}
		if(t.length > 0)
			window.location.href="page?name=" + t+"&category=";
	});*/
	
	// bookdiv点击事件
	$(".book").click(function(){
		var url = $(this).find("a").attr("href");
		window.location.href=url;
	});
	
	// "更多" 按钮点击事件
	$(".list1").find(".morebooks").click(function(){
		window.location.href = "http://www.baidu.com";
	});
	
	$(".list2").find(".morebooks").click(function(){
		window.location.href = "http://www.baidu.com";
	});
	
})

/** 函数 **/

// 秒杀块控制
function setMSstr(ms) {
	var interval = setInterval(function() {
		if(ms <= 0) {
			$(".msjs").text("本场秒杀已结束");
			$(".row7").css("background-color", "#5E5E5E");
			$(".row7").find("h1").text("本场结束");
			$(".hh").text("00");
			$(".mm").text("00");
			$(".ss").text("00");
			clearInterval(interval);
		} else {
			if(ms > 0 && ms < 1000) {
				$(".hh").text("00");
				$(".mm").text("00");
				$(".ss").text("00");
			} else {
				ms = ms - 1000;
				var h = getMsTime(ms).getHour().toString();
				var m = getMsTime(ms).getMinute().toString();
				var s = getMsTime(ms).getSecond().toString();
				if(h.length == 1)
					h = "0" + h;
				if(m.length == 1)
					m = "0" + m;
				if(s.length == 1)
					s = "0" + s;
				$(".hh").text(h);
				$(".mm").text(m);
				$(".ss").text(s);
			}
		}
		if($(".hh").text() == "00" && $(".mm").text() == "00" && $(".ss").text() == "00") {
			$(".msjs").text("本场秒杀已结束");
			$(".row7").find("h1").text("本场结束");
			$(".row7").css("background-color", "#5E5E5E");
			clearInterval(interval);
		}
	}, 1000);
}

// 毫秒转换
function getMsTime(ms) {
	var obj = new Object();
	obj.day = parseInt(ms / (1000 * 60 * 60 * 24));
	obj.hour = parseInt((ms % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
	obj.minute = parseInt((ms % (1000 * 60 * 60)) / (1000 * 60));
	obj.second = (ms % (1000 * 60)) / 1000;
	obj.getDay = function() {
		return this.day;
	}
	obj.getHour = function() {
		return this.hour;
	}
	obj.getMinute = function() {
		return this.minute;
	}
	obj.getSecond = function() {
		return this.second;
	}
	return obj;
}