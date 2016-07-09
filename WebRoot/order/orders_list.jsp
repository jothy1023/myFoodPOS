<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>订单列表</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/manageProduct.css">
<script type="text/javascript" src="js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

</head>

<body>
	<table class="table" style="margin:0; padding:0; background-color: #f3f3f3;">
		<thead>
			<tr>
				<td class="col-lg-2">订单编号</td>
				<td class="col-lg-4">经办员工</td>
				<td class="col-lo-4">成交日期</td>
			</tr>
		</thead>
		<tbody>
			<s:iterator value="#session.orders" var="order">
				<tr>
					<td><s:property value="#order.orderId" /></td>
					<td><s:property value="#order.user.username" /></td>
					<td><s:property value="#order.orderDate" /></td>
					<td><a href='/myFoodPOS/order/deleteOrder.action?orderId=<s:property value="#order.orderId" />'>删除</a></td>
				</tr>
			</s:iterator>
		</tbody>
	</table>
</body>
</html>
