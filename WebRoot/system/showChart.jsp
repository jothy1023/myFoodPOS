<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>chart</title>
    <script type="text/javascript" src="../js/jquery-2.1.3.min.js"></script>
    <script type="text/javascript" src="../js/highcharts.js"></script>
    <style type="text/css">
    	.container{
    		width: 800px;
    		height: 400px;
    	}
    </style>
</head>

<body>
    <div class="container">
    </div>

    <script type="text/javascript">
    // 显示每日销量的折线图
    $(function() {
        $('.container').highcharts({ //图表展示容器，与div的id保持一致
            chart: {
                type: 'column' //指定图表的类型，默认是折线图（line）
            },
            title: {
                text: 'My first Highcharts chart' //指定图表标题
            },
            xAxis: {
                categories: ['my', 'first', 'chart'] //指定x轴分组
            },
            yAxis: {
                title: {
                    text: 'something' //指定y轴的标题
                }
            },
            series: [{ //指定数据列
                name: 'Jane', //数据列名
                data: [1, 0, 4] //数据
            }, {
                name: 'John',
                data: [5, 7, 3]
            }]
        });
    });
    </script>
</body>

</html>
