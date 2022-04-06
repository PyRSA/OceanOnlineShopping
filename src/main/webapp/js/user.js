$(function(){
	$("#page2").find(".ModifyBtn").click(function(){
		$(".ModifyAddressMsg").toggle(1000);
	});

	$(".ModifyAddressMsgClose").click(function(){
		$(".ModifyAddressMsg").hide(1000);
	});

	//保存修改用户购物资料按钮
	$(".ModifyAddressMsgBtn").click(function(){
		var province = $("select[name='province']").val();
		var city = $("select[name='city']").val();
		var area = $("select[name='area']").val();
		var telephone = $(".ModifyAddressMsg").find("input[name='telephone']").val();
		var name = $(".ModifyAddressMsg").find("input[name='name']").val();
		var addr = $("input[name='address']").val();
		var reg = /^[0-9]{6,20}$/;
		if(address == null || address == "" || telephone == null || telephone == "" || name == null || name == ""){
			alert("请填写完整信息");
		}else if(!reg.test(telephone)){
			alert("电话号码格式不正确");
		}else{
			$.ajax({
				type:"post",
				url:"ModifyData",
				data:"type=shopp&province=" + province + "&city=" + city +"&area=" + area + "&addr=" + addr +"&telephone=" + telephone + "&name=" + name,
				dataType:"json",
				success:function(t){
					alert(t);
					if(t.state == "true"){
						alert("修改成功");
						$(".ModifyAddressMsg").hide(1000);
						$(".addressMsg").find("span").eq(0).text(t.addr);
						$(".addressMsg").find("span").eq(1).text(t.name);
						$(".addressMsg").find("span").eq(2).text(t.telephone);
					}else{
						alert("修改失败");
					}
				},
				error:function(){
					alert("发生错误");
				}
			});
		}

	});

	//保存修改用户资料按钮
	$("#save").click(function(){
		var $page1 = $("#page1");
		var gender = $page1.find("input[name='gender']:checked").val();
		var email = $page1.find("input[name='email']").val();
		var telephone = $page1.find("input[name='telephone']").val();
		var introduce = $page1.find("textarea").val();
		if(Test().email() && Test().telephone()){
			if(confirm("是否修改？")){
				$.ajax({
					type:"post",
					url:"ModifyData",
					data:"type=basic&gender=" + gender + "&email=" + email + "&telephone=" + telephone + "&introduce=" + introduce,
					dataType:"text",
					success:function(t){
						if(t == "true"){
							alert("修改成功");
						}else{
							alert("修改失败");
						}
					},
					error:function(){
						alert("发生异常");
					}
				});
			}
		}else{
			alert("请填写正确信息");
		}

	});



	// 表单验证

	$("#page1").find("input[name='email']").blur(function(){
		Test().email();
	});

	$("#page1").find("input[name='telephone']").blur(function(){
		Test().telephone();
	});

	// 更换头像
	$("#ghtx").click(function(){
		if(confirm("是否更换头像？")){
			var file = new FormData(document.getElementById("upload"));
			$.ajax({
				url:"UploadHeadimg",
				type:"post",
				data:file,
				async:false,
				processData:false,
				contentType:false,
				dataType:"json",
				success:function(data){
					if(data.state == "false"){
						alert("上传失败");
					}else{
						$("#userheadimg").attr("src",data.imgurl);
					}
				},
				error:function(){
					alert("发生错误");
				}
			});
		}
	});


	// 验证函数
	function Test(){
		var obj = new Object();
		obj.email = function(){
			var $page1 = $("#page1");
			var email = $page1.find("input[name='email']").val();
			var reg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
			if(email == null || email == ""){
				$page1.find("input[name='email']").next().html("<span style='color:red'>邮箱不可为空</span>");
				return false;
			}else if(!reg.test(email)){
				$page1.find("input[name='email']").next().html("<span style='color:red'>邮箱格式不正确</span>");
				return false;
			}else{
				$page1.find("input[name='email']").next().html("<span style='color:blue'>邮箱格可用</span>");
				return true;
			}
		}
		obj.telephone = function(){
			var $telephone = $("#page1").find("input[name='telephone']");
			var telephone = $telephone.val();
			var reg = /^[0-9]{6,20}$/;
			if(telephone == null || telephone == ""){
				$telephone.next().html("<span style='color:red'>电话号码不可为空</span>");
				return false;
			}else if(!reg.test(telephone)){
				$telephone.next().html("<span style='color:red'>电话号码格式不正确</span>");
				return false;
			}else{
				$telephone.next().html("<span style='color:blue'>电话号码可用</span>");
				return true;
			}
		}
		return obj;
	}
});