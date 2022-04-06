$(function(){
	$("#page3").find("button").click(function(){
		var id = $(this).parents(".bill").attr("data");
		$(".hidePl").show(100);
		$(".hidePl").attr("data",id);
	});
	
	$(".hidePl").find("input[value='取消']").click(function(){
		$(".hidePl").hide(100);
	});
	
	$(".hidePl").find("input[value='提交']").click(function(){
		var s = $("input[type='radio']:checked").val();
		var t = $("textarea").val();
		var id = $(".hidePl").attr("data");
		$.post("OrderManagement","type=evaluation&id=" + id + "&comments=" + t + "&score=" + s,function(t){
			if(t == "true"){
				$(".hidePl").hide(100);
			}else{
				alert("评价失败");
			}
		});
	});
});