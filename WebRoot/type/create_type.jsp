<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	<div id="createType" class="tab-pane fade in active">
		<form role="form" name="createForm"
			action="<%=path%>/type/createType.action" method="post">
			<!-- <div class="form-group">
				<label for="inputTypeId">产品类别编号</label> <input type="text"
					id="inputTypeId" name="inputTypeId" class="form-control"
					placeholder="请输入数字编号" />
			</div> -->
			<div class="form-group">
				<label for="inputTypeName">产品类别名称</label> <input type="text"
					id="inputTypeName" name="tname" class="form-control"
					placeholder="名称" />
			</div>
			<button type="submit" name="submit" class="btn btn-default">添加</button>
		</form>
	</div>
	<script>
		$('button').click(function(){
			$('.type_iframe', parent.document).attr('src', 'type/type_detail.jsp');
		});
	</script>
</body>
</html>
