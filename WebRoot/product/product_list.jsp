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

<title>查询产品</title>
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
	<table class="table"
		style="margin: 0; padding: 0; background-color: #f3f3f3;">
		<thead>
			<tr>
				<td class="col-lg-2">产品编号</td>
				<td class="col-lg-4">产品名称</td>
				<td class="col-lg-2">类别</td>
				<td class="col-lg-2">价格</td>
				<td class="col-lg-2">规格</td>
			</tr>
		</thead>
		<tbody>
			<s:iterator value="#session.products" var="product">
				<tr>
					<td><s:property value="#product.id" /></td>
					<td><s:property value="#product.pname" /></td>
					<td><s:property value="#product.type.tid" /></td>
					<td><s:property value="#product.price" /></td>
					<td><s:property value="#product.psize" /></td>
				</tr>
			</s:iterator>
		</tbody>
	</table>
</body>
</html>
