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

  </head>
  
  <body>
    <s:iterator value="#request['products']" id="product">
		<div class="food col-lg-2">
			<span><s:property value="#product.pname"/></span>
			<span><s:property value="#product.price"/></span>
			<form action="/myFoodPOS/system/addToCart.action" method="post">
				<!--  <input type="text" name="quantity" value="0" size="4"/> -->
				<input type="hidden" name="id" value="<s:property value="#product.id"/>">
				<input type="submit" name="submit" value="添加"/>
			</form>
		</div>
		
	</s:iterator>
  </body>
</html>
