$(function() {
	
	// 初始化禁用按钮
	$("button[name='reg']").attr("disabled","disabled");
	
	// 各输入框失去焦点事件
	$("input[name='username1']").blur(function(){
		InputTest().username();
		regisbtn();
	});
	$("input[name='email']").blur(function(){
		InputTest().email();
		regisbtn();
	});
	$("input[name='name']").blur(function(){
		InputTest().name();
		regisbtn();
	});
	$("input[name='password1']").blur(function(){
		InputTest().pwd();
		regisbtn();
	});
	$("input[name='againpsw']").blur(function(){
		InputTest().againpwd();
		regisbtn();
	});
	$("input[name='telephone']").blur(function(){
		InputTest().telephone();
		regisbtn();
	});
	$("input[name='xiangxi']").blur(function(){
		InputTest().xiangxi();
		regisbtn();
	});
	$("input[name='test']").blur(function(){
		InputTest().test();
		regisbtn();
	}); 
	
	// 注册按钮
	$("button[name='reg']").click(function(){
		var username = $("input[name='username1']").val();
		var email = $("input[name='email']").val();
		var name = $("input[name='name']").val();
		var password1 = $("input[name='password1']").val();
		var telephone = $("input[name='telephone']").val();
		var province = $("select[name='province']").val();
		var city = $("select[name='city']").val();
		var area = $("select[name='area']").val();
		var gender = $("input[name='gender']:checked").val();
		var xiangxi = $("input[name='xiangxi']").val();
		var introduce = $("#introduce").text();
		var test = $("input[name='test']").val();
		$.post("Register",
			"type=register" 
			+ "&username=" + username
			+ "&email=" + email
			+ "&name=" + name
			+ "&password=" + password1
			+ "&telephone=" + telephone
			+ "&province=" + province
			+ "&city=" + city
			+ "&area=" + area
			+ "&gender=" + gender
			+ "&xiangxi=" + xiangxi
			+ "&testnum=" + test
			+ "&introduce=" + introduce,
			function(t){
				if(t=="true"){
					if(confirm("注册成功,是否现在登录？"))
						$("#maxDiv").slideDown();
					else
						window.location.href = "index.jsp";
				}else{
					alert("注册失败");
				}
			}
		);
	});
	
	// 发送验证码按钮
	$("#sendtestnumbtn").click(function(){
		var $btn = $(this);
		var email = $("input[name='email']").val();
		if(!InputTest().email()){
			alert("邮箱不正确")
		}else{
			$.post("Register" ,"type=sendNum&email=" + email,function(t){
				if(t == "true"){
					$btn.next().html("<br /><font style='color:blue;'>验证码已发送到" + $("input[name='email']").val() + "，请在您的邮箱查看</font>");
					$btn.attr("disabled","disabled");
					var i = 61;
					var intl = setInterval(ti,1000);
					function ti (){
						i = i -1;
						$btn.text(i + "秒后再发送");
						if(i == 0){
							clearInterval(intl);
							$btn.text("发送验证码到邮箱");
							$btn.next().text("");
							$btn.removeAttr("disabled");
						}
					}
				}else{
					alert("发送失败");
				}
			});
		}
	});
	
	// 注册按钮函数
	function regisbtn(){
		var t = InputTest();
		if(t.username() && t.email() && t.name() && t.pwd() && t.againpwd() && t.telephone() && t.xiangxi() && t.test()){
			$("button[name='reg']").removeAttr("disabled");
		}else{
			$("button[name='reg']").attr("disabled","disabled");
		}
	}
	
	// 验证函数
	function InputTest() {
		var obj = new Object();
		obj.username = function() {
			var val = $("input[name='username1']").val()+"";
			if(val.length > 20){
				$("input[name='username1']").next().html("<font style='color:red;'>用户名过长</font>");
				return false;
			}else if(val.length == null || val.length == ""){
				$("input[name='username1']").next().html("<font style='color:red;'>用户名不能为空</font>");
				return false;
			}else{
				$.ajax({
					url:"Register",
					type:"post",
					data:"type=testUsername&username=" + val,
					success:function(t){
						if(t == "true")
							$("input[name='username1']").next().html("<font style='color:greenyellow;'>用户名可用</font>");
						else
							$("input[name='username1']").next().html("<font style='color:red;'>用户名已存在</font>");
					}
				});
				if($("input[name='username1']").next().text() == "用户名已存在"){
					return false;
				}else{
					return true;
				}
			}
		}
		obj.email = function() {
			var val = $("input[name='email']").val();
			var reg = /^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/;
			if(val == null || val == ""){
				$("input[name='email']").next().html("<font style='color:red;'>邮箱不可为空</font>");
				return false;
			}if(reg.test(val)){
				$("input[name='email']").next().html("<font style='color:greenyellow;'>邮箱可用</font>");
				return true;
			}else{
				$("input[name='email']").next().html("<font style='color:red;'>邮箱格式错误</font>");
				return false;
			}
		}
		obj.telephone = function() {
			var val = $("input[name='telephone']").val();
			var reg = /^[0-9]{5,20}$/;
			if(val == null || val == ""){
				$("input[name='telephone']").next().html("<font style='color:red;'>电话号码不可为空</font>");
				return false;
			}else if(reg.test(val)){
				$("input[name='telephone']").next().html("<font style='color:greenyellow;'>电话号码可用</font>");
				return true;
			}else{
				$("input[name='telephone']").next().html("<font style='color:red;'>电话号码格式不正确</font>");
				return false;
			}
		}
		obj.pwd = function() {
			var val = $("input[name='password1']").val();
			var reg = /^[0-9]{6,20}$/;
			if(val == null || val ==""){
				$("input[name='password1']").next().html("<font style='color:red;'>密码不可为空</font>");
				return false;
			}else if(reg.test(val)){
				$("input[name='password1']").next().html("<font style='color:greenyellow;'>密码可用</font>");
				return true;
			}else{
				$("input[name='password1']").next().html("<font style='color:red;'>密码只为6-20位的数字</font>");
				return false;
			}
		}
		obj.againpwd = function() {
			var val1 = $("input[name='againpsw']").val();
			var val2 = $("input[name='password1']").val();
			if(val1 == null || val1 == ""){
				$("input[name='againpsw']").next().html("<font style='color:red;'>请再次确认密码</font>");
				return false;
			}if(val1 == val2){
				$("input[name='againpsw']").next().html("<font style='color:greenyellow;'>密码一致</font>");
				return true;
			}else{
				$("input[name='againpsw']").next().html("<font style='color:red;'>密码不一致</font>");
				return false;
			}
		}
		obj.name = function() {
			var val = $("input[name='name']").val();
			if(val.length>0){
				$("input[name='name']").next().html("<font style='color:greenyellow;'>名字可用</font>");
				return true;
			}else{
				$("input[name='name']").next().html("<font style='color:red;'>名字不可用</font>");
				return false;
			}
		}
		obj.xiangxi = function() {
			var val = $("input[name='xiangxi']").val();
			if(val.length > 0){
				$("input[name='xiangxi']").next().html("<font style='color:greenyellow;'>地址可用</font>");
				return true;
			}else{
				$("input[name='xiangxi']").next().html("<font style='color:red;'>地址不可为空</font>");
				return false;
			}
		}
		obj.test = function() {
			var val = $("input[name='test']").val();
			$.post("Register","type=emailTestnum&testnum=" + val,function(data){
				if(data == "true"){
					$("input[name='test']").parent().find("span").html("<font style='color:greenyellow;'>验证码正确</font>");
				}else{
					$("input[name='test']").parent().find("span").html("<font style='color:red;'>验证码不正确</font>");
				}
			});
			if($("input[name='test']").parent().find("span").text() == "验证码正确"){
				$("#sendtestnumbtn").attr("disabled","disabled")
				$("#sendtestnumbtn").text("已验证");
				return true;
			}else{
				return false;
			}
		}
		return obj;
	}
}); 
