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
	<link rel="stylesheet" type="text/css" href="type/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="system/css/index.css">
	<script type="text/javascript" src="type/js/jquery-2.1.3.min.js"></script>
	<script type="text/javascript" src="type/js/bootstrap.min.js"></script>
	
	<script>
		$(function(){
			$(".food").bind("click",function(){
				var product = $(this).data('name');
				$(".table tbody").append("<tr><td>"+product+"</td></tr>");
			});
		})
	</script>
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
				<s:if test="#items.sizze!=0"/>
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
						<s:iterator value="#items" />
						<tr>
							<td><s:property value="value.product.pname"/></td>
							<td><s:property value="value.product.pid"/></td>
							<td><s:property value="value.product.size"/></td>
							<td><s:property value="value.product.price"/></td>
							<td><input type="text" value="<s:property value="value.quantity"/>" size="4"/></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="billButton">
				<a href="#">增加</a>
				<a href="#">减少</a>
				<a href="#">删除该项</a>
				<a href="shopping.action">确定</a>
			</div>
		</div>
		
		<div class="orderView col-lg-8">
			<div class="col-lg-2">
				<ul id="foodType" class="nav nav-pills nav-stacked">
					<li class="active">
					<a href="#" data-toggle="tab">主食</a>
					</li>
					<li>
					<a href="#" data-toggle="tab">副食</a>
					</li>
					<li>
					<a href="#" data-toggle="tab">饮品系列</a>
					</li>
					<li>
					<a href="#" data-toggle="tab">套餐</a>
					</li>
					<li>
					<a href="#" data-toggle="tab">雪糕</a>
					</li>
					<li>
					<a href="#" data-toggle="tab">西式中餐</a>
					</li>
				</ul>
			</div>
			<div class="col-lg-9">
				<s:iterator value="#request['products]" id="product">
				<div class="food col-lg-2">
					<span><s:property value="#product.pname"/></span>
					<span><s:property value="#product.price"/></span>
					<form action="addToCart.action" method="post"></form>
						<input type="text" name="quantity" value="0" size="4"/>
						<input type="hidden" name="productId" value="<s:property value="#product.productId"/>">
						<input type="submit" name="submit" value="添加"/>
					</form>
				</div>
				</s:iterator>
				<!-- <div class="food col-lg-2" data-name="鸡腿堡" data-id="2">鸡腿堡</div>-->
			</div>
		</div>
		
	</body>
  </body>
</html>
