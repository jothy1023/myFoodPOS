<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>myFoodPOS系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="system/css/index.css">
	<script type="text/javascript" src="js/jquery-2.1.3.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<style type="text/css">
		.hidden{
			display:none;
		}
		.shadow{
			width:100%;
			height: 800px;
			position: absolute;
			top: 0;
			left: 0;
			z-index: 100;
			background-color: rgba(0, 0, 0, .5);
			float: left;
			padding: 200px 40%;
		}
		.payForm{
			width: 200px;
		    padding: 20px 56px;
		    background: #fff;
		    border-radius: 10px;
		}
		.cashRec{
			width: 110px;
		}
	</style>
	
  </head>
  
  <body>
  <s:if test="#request.payFlag">
  	<div class="shadow">
	  	<form class="payForm" action="" method="post">
	  		<input type="hidden" class="amount" value="<s:property value='#request.amount' />" />
	  		<input type="radio" value="alipay" class="alipay" name="pay" /><label>支付宝支付</label><br>
	  		<input type="radio" value="cashpay" class="cashpay" name="pay" /><label>现金支付</label>
	  		<input placeholder="请输入实收金额" class="hidden cashRec" name="cashReceived" /><br>
	  		<input type="submit" value="确认" class="" />
	  		<input type="reset" class="cancel" value="取消"/>
	  	</form>
  	</div>
  </s:if>
   <div class="header">
			<ul id="myTab" class="nav nav-pills pull-right">
				<li class="active">
					<a href="/myFoodPOS/system/logout.action">退出系统</a>
				</li>
			</ul>
		</div>
		<div id="billFrame" class="col-lg-3">
			<div id="bill">
				<s:set name="items" value="#session.cart.items"/>
				
					<table class="table table-bordered">
						<thead>
							<tr>
								<td>商品名称</td>
								<td>商品编号</td>
								<td>规格</td>
								<td>价格</td>
								<td>数量</td>
							</tr>
						</thead>
						<tbody>
						<s:if test="#items.size!=0">
							<s:iterator value="#items" >
								<tr>
									<td><s:property value="value.product.pname"/></td>
									<td><s:property value="value.product.id"/></td>
									<td><s:property value="value.product.psize"/></td>
									<td><s:property value="value.product.price"/></td>
									<td><s:property value="value.quantity"/></td>
								</tr>
							</s:iterator>	
						</s:if>
					    </tbody>
					</table>
					<div id="total">消费金额：<s:property value="#session.cart.total"/></div>
			</div>
			<div id="billButton">
				<a href="javascript:;" class="reduce">减少
					<form action="/myFoodPOS/system/deleteQuantity.action" method="post">
						<input type="hidden" value="" name="id" />
					</form>
				</a>
				<a href="javascript:;" class="delete">删除该项
					<form action="/myFoodPOS/system/deleteItem.action" method="post">
						<input type="hidden" value="" name="id" />
					</form>
				</a>
				<a href="<%=path %>/system/checkout.action">确定</a>
			</div>
		</div>
				

		<div class="orderView col-lg-8">
			<div class="col-lg-2">
				<ul id="foodType" class="operateTab nav nav-pills nav-stacked">
					<s:iterator value="#session.types" var="type">
						<li>
							<a href="<%=path %>/system/getProductsByType.action?tid=<s:property value="#type.tid" />"><s:property value="#type.tname" /></a>
						</li>
					</s:iterator>
				</ul>
		</div>
			<iframe class="productList" src="<%=path %>/system/getProductsByType.action" frameborder="0" style="width: 70%;">
			</iframe>
			</div>
		<script>
			$('#foodType li:first-child').addClass('active');
			$(".food").bind("click",function(){
				var product = $(this).data('name');
				$(".table tbody").append("<tr><td>"+product+"</td></tr>");
			});
			$(".operateTab li a").click(function(e) {
				$(this).parent().addClass('active').siblings().removeClass('active');
			});
			$("#bill table tbody tr").bind("click",function(){
				$(this).addClass("selected").siblings().removeClass("selected");
			});
			
			$("#billButton .reduce").bind("click",function(){
				var optid = $("#bill .selected td:eq(1)").html();
				$("#billButton .reduce input").attr("value",optid);
				$("#billButton .reduce form").submit();
			});
			
			$("#billButton .delete").bind("click",function(){
				var optid = $("#bill .selected td:eq(1)").html();
				$("#billButton .delete input").attr("value",optid);
				$("#billButton .delete form").submit();
			});
			
			$('#foodType li a').bind('click', function(){
				$('.productList').attr('src', $(this).attr('href'));
				return false;
			});
			var amount = $('.amount').attr('value') - 0;
			$('.alipay').bind('click', function() {
				$('.payForm').attr('action', "<%=path %>/system/makeAliPay.action?amount="+amount);
			});
			$('.cashpay').bind('click', function() {
				$('.cashRec').removeClass('hidden');
				$('.payForm').attr('action', "<%=path %>/system/makeCashPay.action?amount="+amount+"&cashReceived=0");
			});
			$('.cashRec').bind('change', function(){
				var oldAction = $('.payForm').attr('action');
				var cashReceived = $(this).val();
				console.log(cashReceived+"cashReceived");
				var newAction = oldAction.replace(/cashReceived=(\d+)/, cashReceived);
				$('.payForm').attr('action', newAction);
			});
			$('.cancel').click(function(){
				$('.shadow').addClass("hidden");
			});
	</script>
	</body>
</html>
