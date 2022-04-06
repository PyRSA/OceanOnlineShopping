/**
 * 导航条js
 */

$(function(){
	
	// 联系客户
	$("#lxkh").click(function(){
		window.open("http://wpa.qq.com/msgrd?v=3&uin=01000000&site=qq&menu=yes");
	});
	
	// 刷新界面
	function re(){
		var path = window.location.href;
		var arr = path.split("/")
		var url = arr[arr.length-1];
		var url2 = url.split("?")[0];
		if(url2 != "index.jsp" || url2 != "bookShow"||url2!="logout")
			window.location.reload();
	}
	
	/** 登录事件 **/	
	// 获取路径
	
	var path="index.jsp";
	function getPath() {
		var url = window.location.href.split("/");
		path = url[url.length-1];
		return path;
	}

	// 点击进入登录	
	$(".loginbutton").click(function() {
		
		$("#maxDiv").slideDown();
	});

	
	// 点击关闭登录
	$("#closeLogin").click(function() {
		$("#maxDiv").slideUp();
	});	
	
	// 登录按钮事件
	
	$("#loginbtn").click(function(){
		var username = $("#login").find("input[name='username']").val();
		var passwd = $("#login").find("input[name='passwd']").val();
		var zidong = $("#login").find("input[name='zidong']").is(":checked") + "";
		if(username == null || username == "")
			alert("用户名不能为空");
		else if(passwd == null || passwd == "")
			alert("密码不能为空");
		else{			
			$.ajax({
				type:"post",
				url:"login",
				data:"username=" + username + "&password=" + passwd + "&autologin=" + zidong+"&path="+getPath(),
				success:function(logindata){
					if(logindata.state == "true"){
						alert("登录成功");
						$("#helloStr").html("您好，" + logindata.user.username + "<a href='javascript:void(0)' class='logoutbutton' style='color:red'>退出</a>");
						$("#maxDiv").slideUp();
						var $row5 = $(".row5");
						$row5.attr("href","user.jsp");
						$row5.find("img").attr("src",logindata.user.headimg);
						$row6 = $(".row6");
						$row6.find(".username").attr("href","user.jsp");
						$row6.find("h3").text(logindata.user.username);
						$row6.find("button").hide();
						$row6.find(".reBtn").hide();
						re();
					}else{
						alert("登录失败，请检查您的输入信息或账号已冻结！");
					}
				},
				error:function(){
					alert("发生异常");
				}
			});
		}
	});

	
	
		
	
	
	
});

	

