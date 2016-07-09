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
	<table class="table" style="margin:0; padding:0; background-color: #f3f3f3;">
		<thead>
			<tr>
				<td class="col-lg-3">店员编号</td>
				<td class="col-lg-3">店员姓名</td>
				<td class="col-lg-2">性别</td>
				<td class="col-lg-2">职位</td>
				<td class="col-lg-2">年龄</td>
			</tr>
		</thead>
		<tbody>
			<s:iterator value="#session.users" var="user">
				<tr>
					<td><s:property value="#user.userid" /></td>
					<td><s:property value="#user.username" /></td>
					<td><s:property value="#user.sex" /></td>
					<td><s:property value="#user.catagory" /></td>
					<td><s:property value="#user.age" /></td>
				</tr>
			</s:iterator>
		</tbody>
	</table>
</body>
</html>