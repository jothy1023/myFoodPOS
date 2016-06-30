<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">

<title>产品管理</title>

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

	<div class="container">
		<a href="chart/showChart.action">chart</a>
		<div class="header">
			<ul id="myTab" class="nav nav-pills pull-right">
				<li class="active"><a href="#manageType" data-toggle="tab">产品类别管理</a></li>
				<li><a href="#manageItem" data-toggle="tab">产品管理</a></li>
			</ul>
		</div>
		<div id="mainFrame" class="tab-content">
			<div id="manageType" class="tab-pane fade in active">
				<div class="col-lg-3">
					<ul class="operateTab nav nav-pills nav-stacked">
						<li class="active"><a href="type/create_type.jsp"
							data-toggle="tab">添加产品种类</a>
						<li><a href="type/delete_type.jsp" data-toggle="tab">删除产品种类</a>
						<li><a href="type/update_type.jsp" data-toggle="tab">修改产品种类</a>
<!-- 						<li><a href="type/type_detail.jsp" data-toggle="tab">查询产品种类</a>
 -->					</ul>
				</div>
				<div class="col-lg-9 tab-content">
					<div>
					<!-- 产品列表 -->
						<iframe class="typelist_iframe" src="type/getAllTypes.action"
							frameborder="0" style="width: 100%; height: 195px; background: #f3f3f3;border: 1px solid #f3f3f3;">
						</iframe>
					</div>
					<!-- 功能框 -->
					<div class="tab-content">
						<iframe class="type_iframe" src="type/create_type.jsp"
							frameborder="0" scrolling="no"
							style="width: 100%; height: 182px; background: #f3f3f3; margin-top:30px;"></iframe>
					</div>
				</div>
			</div>
			<div id="manageItem" class="tab-pane fade">
				<div class="col-lg-3">
					<ul class="operateTab nav nav-pills nav-stacked">
						<li class="active"><a href="product/create_product.jsp" data-toggle="tab">添加产品</a>
						<li><a href="product/delete_product.jsp" data-toggle="tab">删除产品</a>
						<li><a href="product/update_product.jsp" data-toggle="tab">修改产品</a>
<!-- 						<li><a href="product/product_detail.jsp" data-toggle="tab">查询产品</a>
 -->					</ul>
				</div>
				<div class="col-lg-9 tab-content">
					<div style="background-color: #F3F3F3">
						<iframe src="product/getAllProducts.action" style="width: 100%; height: 195px; background: #f3f3f3;border: 1px solid #f3f3f3;"></iframe>
					</div>
					<div class="tab-content" style="background-color: #F3F3F3">
					
					<!-- 功能框 -->
					<div class="tab-content">
						<iframe class="type_iframe product_iframe" src=""
							frameborder="0" scrolling="no"
							style="width: 100%; height: 345px; background: #f3f3f3; margin-top:30px;"></iframe>
					</div>
						<div id="searchItem" class="tab-pane fade">
							<form role="form">
								<form role="form">
									<div class="form-group">
										<label for="searchItemId">请输入产品编号</label> <input type="text"
											id="searchItemId" class="form-control" placeholder="请输入数字编号" />
									</div>
									<div class="form-group">
										<label for="searchItemName">请输入产品名称</label> <input type="text"
											id="searchItemName" class="form-control" placeholder="名称" />
									</div>
									<button type="submit" class="btn btn-default">查询</button>
								</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		$('#myTab a').click(function(e) {
			e.preventDefault();
			$(this).tab('show');
		});
		$('.operateTab li a').click(function(e) {
			$(this).parent().addClass('active').siblings().removeClass('active');
			var src = $(this).attr('href');
			$('.type_iframe').attr('src', src);
			return false;
		});
	</script>

</body>
</html>
