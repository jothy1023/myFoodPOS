<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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

  </head>
  
  <body>
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
		
		<s:iterator name="items" value="#session.cart.items" >
			<tr>
				<td><s:property value="#items.product.pname"/></td>
				<td><s:property value="#items.product.id"/></td>
				<td><s:property value="#items.product.psize"/></td>
				<td><s:property value="#items.product.price"/></td>
				<td><input type="text" value='<s:property value="#items.quantity"/>' size="4"/></td>
			</tr>
		</s:iterator>	
		</tbody>
	</table>
  </body>
</html>
