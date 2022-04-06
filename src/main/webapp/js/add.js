$(function(){
	
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
	
	// 输入框触发事件
	$("input[name='pnum']").bind("input propertychange",function(){
		if(!Test().pnum())
			$(this).val($(this).val().substring(0,$(this).val().length-1));
		if(t()){
			$("input[type='submit']").removeAttr("disabled");
		}else{
			$("input[type='submit']").attr("disabled","disabled");
		}
	});
	$("input[name='price']").bind("input propertychange",function(){
		if(!Test().price())
			$(this).val($(this).val().substring(0,$(this).val().length-1));
		if(t()){
			$("input[type='submit']").removeAttr("disabled");
		}else{
			$("input[type='submit']").attr("disabled","disabled");
		}
	});
	$("input[name='name']").blur(function(){
		Test().name();
		if(t()){
			$("input[type='submit']").removeAttr("disabled");
		}else{
			$("input[type='submit']").attr("disabled","disabled");
		}
	});
	$("input[name='author']").blur(function(){
		Test().author();
		if(t()){
			$("input[type='submit']").removeAttr("disabled");
		}else{
			$("input[type='submit']").attr("disabled","disabled");
		}
	});
	$("input[name='mainimg']").on('change',function(){
		if(!Test().mainimg())
			alert("请选择图片");
		if(t()){
			$("input[type='submit']").removeAttr("disabled");
		}else{
			$("input[type='submit']").attr("disabled","disabled");
		}
	});
	
	function t(){
		var name = Test().name();
		var price = Test().price();
		var pnum = Test().pnum();
		var author = Test().author();
		if(name && price && pnum && author)
			return true;
		else
			return false;
	}
	
	//关闭预览
	$("#closeBookMsg").click(function(){
		$(this).parent().hide(100);
	});
	
	$("#yulan").click(function(){
		$(".bookMsg").show(100);
	});
	
	function Test(){
		var obj = new Object();
		obj.pnum = function(){
			var reg = /^[0-9]{1,9}$/;
			if(reg.test($("input[name='pnum']").val())){
				$("input[name='pnum']").next().text(" ");
				return true;
			}else{
				$("input[name='pnum']").next().text(" 请输入");
				return false;
			}
		}
		obj.name = function(){
			if($("input[name='name']").val().length > 0){
				$("input[name='name']").next().text("");
				return true;
			}else{
				$("input[name='name']").next().text(" 请输入");
				return false;
			}
		}
		obj.price = function(){
			var reg  = /^[0-9]{1,9}$/;
			if(reg.test($("input[name='price']").val())){
				$("input[name='price']").next().text("");
				return true;
			}else{
				$("input[name='price']").next().text(" 请输入");
				return false;
			}
		}
		obj.author = function(){
			if($("input[name='author']").val().length > 0){
				$("input[name='author']").next().text("");
				return true;
			}else{
				$("input[name='author']").next().text(" 请输入");
				return false;
			}
		}
		obj.description = function(){
			if($("input[name='description']").val().length > 0)
				return true;
			else
				return false;
		}
		obj.mainimg = function(){
			if($("input[name='mainimg']").val() != null ){
				$("input[name='mainimg']").next().text("");
				return true;
			}else{
				$("input[name='mainimg']").next().text(" 请选择");
				return false;
			}
		}
		return obj;
	}
});