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
    
    <title>按类型查看产品</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=basePath %>css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath %>system/css/index.css">
	<script type="text/javascript" src="<%=basePath %>js/jquery-2.1.3.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>js/bootstrap.min.js"></script>
  </head>
  
  <body>
    <s:iterator value="#request['products']" id="product">
		<div class="food col-lg-2" id="menuItem">
			<div class="food-desp">
				<span><s:property value="#product.pname"/></span><br>
				<span><s:property value="#product.price"/></span>
			</div>
			<div class="food-form">
				<%-- <form id="menuForm" name="menuForm" action="/myFoodPOS/system/addToCart.action" method="post">
					<input type="hidden" name="id" value="<s:property value="#product.id"/>">
					<input class="submit" type="submit" name="submit" value="添加"/>
				</form> --%>
				<button name="submit" class="submit btn btn-default" value="/myFoodPOS/system/addToCart.action?id=<s:property value='#product.id'/>">添加</button>
			</div>
		</div>
		
	</s:iterator>
  </body>
  
  <script type="text/javascript">
  	$('.submit').click(function(){
  		window.parent.location.href = $(this).attr('value');
  	})
  </script>
</html>
