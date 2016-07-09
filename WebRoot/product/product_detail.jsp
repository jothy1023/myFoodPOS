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
	<div id="searchType" class="fade in active">
		<form role="form">
			<div class="form-group">
				<%-- 
						<s:set name="product" value="#session.product" /> --%>
				<p>
					修改/删除产品如下：<br />
				</p>
				<label>产品类别编号: <s:property value="id" /></label><br /> <label>产品类别名称:
					<s:property value="pname" />
				</label>
			</div>
			<!-- 
					<button type="submit" class="btn btn-default">查询</button> -->
		</form>
	</div>
</body>
<script>
	(function() {
		alert("操作成功!");
		// 重新加载product列表
		$('.productlist_iframe', parent.document).attr('src', 'product/getAllProducts.action');
	})();
</script>
</html>
