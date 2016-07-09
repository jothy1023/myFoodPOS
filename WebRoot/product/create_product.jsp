<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	Date date = new Date();
	String time = new SimpleDateFormat("yyyy-MM-dd").format(date);;
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

	<div id="createItem" class="fade in active">
		<form role="form" action="<%=path %>/product/createProduct.action" method="post">
			<div class="form-group">
				<label for="inputProductName">产品名称</label> <input type="text"
					id="inputProductName" name="pname" class="form-control"
					placeholder="名称" />
			</div>
			<div>
				<label>产品类别：</label> <select class="form-control" name="type.tid">
					<s:iterator value="#session.types" var="type">
						<option value="<s:property value="#type.tid" />"><s:property value="#type.tname" /></option>
					</s:iterator>
				</select>
			</div>
			<div class="form-group">
				<label for="inputProductPrice">产品价格</label> <input type="text"
					id="inputProductPrice" name="price" class="form-control"
					placeholder="价格" />
			</div>
			<div class="form-group">
				<label>产品规格：</label> <select class="form-control"
					name="psize">
					<option value="1">大</option>
					<option value="2">中</option>
					<option value="3">小</option>
				</select>
			</div>
			<input type="hidden" value="<%=time %>" name="time" />
			<button type="submit" name="submit" class="btn btn-default">添加</button>
		</form>
	</div>
	<script>
		/* $('button').click(
				function() {
					$('.type_iframe', parent.document).attr('src',
							'product/product_detail.jsp');
				}); */
	</script>
</body>
</html>
