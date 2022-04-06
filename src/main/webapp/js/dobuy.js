
$(function(){
	//$(".buyBtn").find("button").click(function(){
	/*$("#order").click(function(){
		var billids = new Array();
		billid =  $(".bill").attr("data");
		var addressType = $("input[type='radio']:checked").attr("data");
		var province = $("select[name='province']").val();
		var city = $("select[name='city']").val();
		var Area = $("select[name='area']").val();
		var telephone = $("#telephone").val();
		var detailed = $("#detailed").val();
		alert("test!");
		if(addressType == "newaddress"){
			if(addressTest().province() && addressTest().city() && addressTest().area() && addressTest().detailed() && addressTest().telephone() && confirm("是否去付款？")){
				window.location.href ="addOrder?addressType=" 
							+ addressType + "&province="
							+ province + "&city="
							+ city + "&area="
							+ Area + "&telephone="
							+ telephone + "&detailed="
							+ detailed;
			}
		}else{
			window.location.href = "addOrder?addressType=" 
							+ addressType;
		}
	});*/
	
	disinput();
	function disinput(){
		$("#newaddress").parent().find("input").attr("disabled","disabled");
		$("#newaddress").find("select").attr("disabled","disabled");
	}
	$("input[type='radio']").click(function(){
		var addrType = $(this).attr("data");
		if(addrType == "defaultaddress"){
			$("#newaddress").parent().find("input").attr("disabled","disabled");
			$("#newaddress").find("select").attr("disabled","disabled");
		}else{
			$("#newaddress").parent().find("input").removeAttr("disabled");
			$("#newaddress").find("select").removeAttr("disabled");
		}
	});
	
	
	// 地址验证
	function addressTest(){
		var obj = new Object();
		var provinceval = $("select[name='province']").val();
		var cityval = $("select[name='city']").val();
		var areaval = $("select[name='area']").val();
		var detailedval = $("#detailed").val();
		var telephoneval = $("#telephone").val();
		obj.province = function(){
			if(provinceval != null || provinceval != ""){
				return true;
			}else{
				alert("请在地址栏设置省份");
				return false;
			}
		}
		obj.city = function(){
			if(cityval != null && cityval != ""){
				return true;
			}else{
				alert("请在地址栏设置城市");
				return false;
			}
		}
		obj.area = function(){
			if(areaval != null && areaval != ""){
				return true;
			}else{
				alert("请在地址栏设置区、县");
				return false;
			}
		}
		obj.detailed = function(){
			if(detailedval != null && detailedval != ""){
				return true;
			}else{
				alert("请在地址栏填写详细地址");
				return false;
			}
		}
		obj.telephone = function(){
			if(telephoneval != null && telephoneval != ""){
				return true;
			}else{
				alert("请在地址栏填写电话号码");
				return false;
			}
		}
		return obj;
	}
	
	$("#telephone").bind("input propertychange",function(){
		var v = $(this).val();
		var reg = /^[0-9]{1,}$/;
		if(!reg.test(v)){
			$(this).val(v.substring(0,v.length-1))
		}
	});
});