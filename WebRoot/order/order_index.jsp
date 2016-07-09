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

<title>订单管理</title>

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
		<div class="header">
			<ul id="myTab" class="nav nav-pills pull-right">
				<li><a href="<%=basePath %>type/type_index.jsp" data-toggle="tab">产品类别管理</a></li>
				<li><a href="<%=basePath %>product/product_index.jsp" data-toggle="tab">产品管理</a></li>
				<li><a href="<%=basePath %>user/user_index.jsp" data-toggle="tab">用户管理</a></li>
				<li><a href="<%=basePath %>chart/showChart.action" data-toggle="tab">查看报表</a></li>
				<li class="active"><a href="<%=basePath %>order/order_index.jsp" data-toggle="tab">订单管理</a>
				<li><a href="<%=basePath %>/myFoodPOS/system/logout.action" data-toggle="tab">退出系统</a></li>
			</ul>
		</div>
		<div id="mainFrame" class="tab-content">
			<div id="manageType" class="tab-panel fade in active">
				<div class="col-lg-3">
					<div class="menulist">
						<ul class="operateTab nav nav-pills nav-stacked">
							<li class="active"><a href="type/create_type.jsp"
								data-toggle="tab">退货处理</a>
   				     	</ul>
					</div>
				</div>
				<div class="col-lg-9 tab-content detail_list">
					<div style="background-color: #F3F3F3">
						<s:action name="getAllOrders" executeResult="true"></s:action>
					</div>
				</div>
			</div>
			
		</div>
	</div>

	<script>
		$('#myTab a').click(function(e) {
			$(this).parent().addClass('active').siblings().removeClass('active');
			var src = $(this).attr('href');
			window.location.href = src;
			return false;
		});
		$('.operateTab li').click(function(e) {
			var index = $(this).index();
			$(this).addClass('active').siblings().removeClass('active');
			$(".operation_panel>div").eq(index).addClass("show").siblings().removeClass("show");
			return false;
		});
	</script>

</body>
</html>
