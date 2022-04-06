
/*$(function(){

	// 减少书本数量事件
	$(".remove").click(function(){
		var reg = /^[0-9]{1,}$/;
		var price = parseFloat($(this).parent().parent().parent().prevAll(".price").find(".money").text());
		var num = $(this).parent().next().val();
		var max = parseInt($(this).parent().parent().prevAll(".booknumMax").find(".max").text());
		if(reg.test(num)){
			var id = $(this).parents(".bookMsg").attr("data");
			Operation(id, "rem");
			if(parseInt(num) < 2){
				$(this).parent().next().val(1);
				if(parseInt(num) == 1 ||parseInt(num) == 0){
					$(this).parent().parent().parent().next().find(".sum").text(price);
					priceSum();					
				}
			}else{
				$(this).parent().next().val(parseInt(num)-1);
				$(this).parent().parent().parent().next().find(".sum").text($(this).parent().next().val()*price);
				alert(id,parseInt(num)-1);
				$.ajax({
					url:"updateCart",
					type:"post",
					data:{"cartid":id,"bookSum":parseInt(num)}
				});
				//updateCart(id,parseInt(num)-1);
				priceSum();
			}
			

		}else{
			$(this).parent().next().val(1);
			$(this).parent().parent().parent().next().find(".sum").text($(this).parent().next().val()*price);
			priceSum();
		}
		
	});
	
	function updateCart(cartid,bookSum){
		$.ajax({
			url:"updateCart",
			type:"post",
			data:{"cartid":cartid,"bookSum":bookSum}
		});
	}

	// 添加书本数量事件
	$(".add").click(function(){
		
		var reg = /^[0-9]{1,}$/;
		var price = parseFloat($(this).parent().parent().parent().prevAll(".price").find(".money").text());
		var num = $(this).parent().prev().val();
		var max = parseInt($(this).parent().parent().prevAll(".booknumMax").find(".max").text());
		if(reg.test(num)){
			var id = $(this).parents(".bookMsg").attr("data");
			alert(id);
			Operation(id, "add");
			if(parseInt(num) >= max){
				
				$(this).parent().prev().val(max);
				$(this).parent().parent().parent().next().find(".sum").text(max*price);
				priceSum();
			}else{
				$(this).parent().prev().val(parseInt(num)+1);
				$(this).parent().parent().parent().next().find(".sum").text((parseInt(num)+1)*price);
				priceSum();
				alert(id+","+(parseInt(num)+1));
				updateCart(id,parseInt(num)+1);
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
				//updateCart(id,num);
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

	// 删除单个商品
	$(".deleteBook").click(function(){
		var id = $(this).parents(".bookMsg").attr("data");
		var bookname = $(this).parent().prevAll(".msg").find("img").attr("title");
		var ms = $(this).parent().prevAll(".msg").find("a").text();
		var bookMsg = $(this).parent().parent();
		var state = confirm("是否删除？\n" + bookname + "\n" + ms);
		if(state){
			$.ajax({
				url:"removeCart",
				type:"post",
				data:{"id=":id},
				dataType:"json",
				success:function(result){
					if(result.state == "true"){
						bookMsg.remove();
						priceSum();
						cartisnull();
					}else{
						alert("删除失败");
					}
				},
				error:function(){
					alert("连接失败，删除失败");
				}
			});

		}
		priceSum();
		cartisnull();
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

	// 删除多个
	$("#deleteBooks").click(function(){
		var bookids_a = document.getElementsByName("ID");
		var booknames = new Array();
		var ajaxdata = "?";
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
			if(confirm("是否删除？\n" + booknamesStr)){
				$.ajax({
					url:"test.txt",
					type:"get",
					data:ajaxdata,
					dataType:"text",
					success:function(t){
						if(t == "true"){
							$(".bookMsg").find("input:checked").parent().parent().remove();
							priceSum(); 
						}else{
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
});*/