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
	<div id="deleteProduct" class="fade in active">
		<form role="form" name="deleteForm"
			action="<%=path%>/product/deleteProductById.action" method="post"
			onsubmit="return confirm('你确定要删除吗？')">
			<div class="form-group">
				<div>
					<label>请选择要删除的产品编号：</label> <select class="form-control" name="id">
						<s:iterator value="#session.products" var="product">
							<option name="id" pname='<s:property value="#product.pname"/>'><s:property
									value="#product.id" /></option>
						</s:iterator>
					</select>
				</div>
				<div>
					<label for="deleteProductName">产品名称:</label> <input name="pname"
						type="text" id="deleteProductName" class="form-control"
						readonly="true" />
				</div>
			</div>
			<button type="submit" name="submit" class="btn btn-default">删除</button>
		</form>
	</div>
	<script>
		var select = $('select');
		var inputName = $('#deleteProductName');
		select.change(function() {
			inputName.attr('value', $(this).find('option:selected').attr(
					'pname'));
		});
		$('select').trigger('change');
	</script>
</body>
</html>
