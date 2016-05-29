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
	
	<script>
		$(function(){
			$(".food").bind("click",function(){
				var product = $(this).data('name');
				$(".table tbody").append("<tr><td>"+product+"</td></tr>");
			});
		});
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
				
				<iframe class="typelist_iframe" src="system/showCart.jsp"
						frameborder="0" style="width: 100%; height: 300px; background: #f3f3f3;border: 1px solid #f3f3f3;">
				</iframe>
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
			<div class="col-lg-10">
				<iframe class="typelist_iframe" src="system/getProductsByType.action"
							frameborder="0" style="width: 100%; height: 500px; background: #f3f3f3;border: 1px solid #f3f3f3;">
					<!--<s:action name="getProductsByType" executeResult="true" />-->
				</iframe>
			</div>
			
			
			 
		</div>
		
	</body>
  </body>
</html>
