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
	<div id="updateProduct" class="tab-pane fade in active">
		<form role="form" name="updateForm"
			action="<%=path%>/product/updateProduct.action" method="post">
			<div class="form-group">
				<div>
					<label>请选择要修改的类型编号：</label> <select class="form-control proSelect" name="tid">
						<s:iterator value="#session.products" var="product">
							<option name="id" pname='<s:property value="#product.pname" />' price='<s:property value="#product.price" />' >
								<s:property value="#product.id" />
							</option>
						</s:iterator>
					</select>
				</div>
				<div>
					<label for="updateProductName">请输入名称:</label> <input name="pname"
						type="text" id="updateProductName" class="form-control" />
				</div>

				<div>
					<label>产品类别：</label> <select class="form-control" name="type.tid">
						<s:iterator value="#session.types" var="type">
							<option value="<s:property value='#type.tid' />"><s:property value="#type.tname" /></option>
						</s:iterator>
					</select>
				</div>
				<div>
					<label for="updateProductPrice">产品价格</label> <input type="text"
						id="updateProductPrice" class="form-control" placeholder="名称" />
				</div>
				<div>
					<label>产品规格：</label> <select class="form-control">
						<option value="1">大</option>
						<option value="2">中</option>
						<option value="3">小</option>
					</select>
				</div>
			</div>
			<button type="submit" name="submit" class="btn btn-default">修改</button>
		</form>
	</div>
	<script>
		var select = $('.proSelect');
		var inputName = $('#updateProductName');
		var inputPrice = $('#updateProductPrice');
		select.change(function() {
			var selOpt = $(this).find("option:selected");
			inputName.attr('value', selOpt.attr('pname'));
			inputPrice.attr('value', selOpt.attr('price'));
		});
		$('.proSelect').trigger('change');
	</script>
</body>
</html>
