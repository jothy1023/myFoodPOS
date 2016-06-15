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
	
	
  </head>
  
  <body>
   <div class="header">
			<ul id="myTab" class="nav nav-pills pull-right">
				<li class="active">
					<a href="#" data-toggle="tab">退出系统</a>
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
						<s:if test="#items.sizze!=0">
							<s:iterator value="#items" >
								<tr>
									<td><s:property value="value.product.pname"/></td>
									<td><s:property value="value.product.id"/></td>
									<td><s:property value="value.product.psize"/></td>
									<td><s:property value="value.product.price"/></td>
									<td><input type="text" size="4" value='<s:property value="value.quantity"/>' /></td>
								</tr>
							</s:iterator>	
						</s:if>
					    </tbody>
					</table>
			</div>
			<div id="billButton">
				<a href="#">增加</a>
				<a href="#">减少</a>
				<a href="#">删除该项</a>
				<a href="<%=path %>/system/checkout.action">确定</a>
			</div>
		</div>
		
		<div class="orderView col-lg-8">
			<div class="col-lg-2">
				<ul id="foodType" class="operateTab nav nav-pills nav-stacked">
					<li class="active">
					<a href="<%=path %>/system/getProductsByType.action?tid=1">主食</a>
					</li>
					<li>
					<a href="<%=path %>/system/getProductsByType.action?tid=2">配餐</a>
					</li>
					<li>
					<a href="<%=path %>/system/getProductsByType.action?tid=3">早餐</a>
					</li>
					<li>
					<a href="<%=path %>/system/getProductsByType.action?tid=4">饮料</a>
					</li>
					<li>
					<a href="<%=path %>/system/getProductsByType.action?tid=5">甜品</a>
					</li>
					<li>
					<a href="<%=path %>/system/getProductsByType.action?tid=6">西式中餐</a>
					</li>
				</ul>
			</div>
			<div class="col-lg-10">
				<s:action name="getProductsByType" namespace="/system" executeResult="true" />
			</div>	 
		</div>
		<script>
		$(function(){
			$(".food").bind("click",function(){
				var product = $(this).data('name');
				$(".table tbody").append("<tr><td>"+product+"</td></tr>");
			});
		});
		$(".operateTab li a").click(function(e) {
			$(this).parent().addClass('active').siblings().removeClass('active');
		});
	</script>
	</body>
</html>
