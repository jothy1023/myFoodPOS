<%@page import="entity.Product"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<title>chart</title>
	<script type="text/javascript" src="../js/jquery-2.1.3.min.js"></script>
	<script type="text/javascript" src="../js/highcharts.js"></script>
	
	<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../css/manageProduct.css">
	<script type="text/javascript" src="../js/bootstrap.min.js"></script>
	<style type="text/css">
		.container {
			width: 800px;
			height: 400px;
		}
	</style>
</head>

<body>
	<div class="container">
		<div class="header">
			<ul id="myTab" class="nav nav-pills pull-right">
				<li><a href="<%=basePath %>type/type_index.jsp" data-toggle="tab">产品类别管理</a></li>
				<li><a href="<%=basePath %>product/product_index.jsp" data-toggle="tab">产品管理</a></li>
				<li><a href="<%=basePath %>user/user_index.jsp" data-toggle="tab">用户管理</a></li>
				<li class="active"><a href="<%=basePath %>chart/showChart.action" data-toggle="tab">查看报表</a></li>
				<li><a href="<%=basePath %>order/order_index.jsp" data-toggle="tab">订单管理</a>
				<li><a href="<%=basePath %>/system/logout.action" data-toggle="tab">退出系统</a></li>
			</ul>
		</div>
		<div class="data" style="display: none;">
			<span class="dataA" value='<s:property value="#session.proNum" />'></span>
			<span class="dataB" value='<s:property value="#session.ordersNum" />'></span>
		</div>
		<div class="chart"></div>
	</div>

	<script type="text/javascript">
		// 显示每日销量的折线图
			var testInt = [];
			// 字符串类型转换为数字
			testInt.push($('.dataA').attr('value') - 0);
			testInt.push($('.dataB').attr('value') - 0);
			testInt.push($('.dataA').attr('value') - 0);
			console.log(testInt);
			$('.chart').highcharts({ //图表展示容器，与div的id保持一致
				chart : {
					type : 'column' //指定图表的类型，默认是折线图（line）
				},
				title : {
					text : 'Sales statistic' //指定图表标题
				},
				xAxis : {
					categories : [ '订单数', '销售总量', '产品总数' ]
				//指定x轴分组
				},
				yAxis : {
					title : {
						text : 'n' //指定y轴的标题
					}
				},
				series : [ { //指定数据列
					name : 'count', //数据列名
					data : testInt
				//数据
				} ]
			});
			$('#myTab a').click(function(e) {
				$(this).parent().addClass('active').siblings().removeClass('active');
				var src = $(this).attr('href');
				window.location.href = src;
				return false;
			});
	</script>
</body>

</html>
