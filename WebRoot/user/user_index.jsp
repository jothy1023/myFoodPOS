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

<title>用户管理</title>

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
				<li><a href="index.jsp" data-toggle="tab">产品类别管理</a></li>
				<li><a href="product/product_index.jsp" data-toggle="tab">产品管理</a></li>
				<li class="active"><a href="user/user_index.jsp" data-toggle="tab">用户管理</a></li>
				<li><a href="<%=basePath %>chart/showChart.action" data-toggle="tab">查看报表</a></li>
				<li><a href="<%=basePath %>order/order_index.jsp" data-toggle="tab">订单管理</a></li>
				<li><a href="/myFoodPOS/system/logout.action" data-toggle="tab">退出系统</a></li>
			</ul>
		</div>
		<div id="mainFrame" class="tab-content">		
			<div id="manageUser">
				<div class="col-lg-3">
					<div class="menulist">
						<ul class="operateTab nav nav-pills nav-stacked">
							<li class="active"><a href="#createUser"
								data-toggle="tab">添加店员</a>
							<li><a href="#deleteUser" data-toggle="tab">删除店员</a>
							<li><a href="#updateUser" data-toggle="tab">修改店员资料</a>
						</ul>
					</div>
					<div class="operation_panel ">
						<div id="createUser" class="tab-pane fade in active show">
							<form role="form" name="createForm" id="addUser"
								action="<%=path%>/user/addUser.action" method="post">
								<div class="form-group">
									<label for="inputUsername">用户姓名</label> <input type="text"
										id="inputUsername" name="username" class="form-control"
										placeholder="姓名" />
								</div>
								<div class="form-group">
									<label for="inputPassword">登录密码</label> <input type="text"
										id="inputPassword" name="password" class="form-control"
										placeholder="密码" />
								</div>
								<div class="form-group">
									<label for="inputSex">性别</label> <input type="text"
										id="inputSex" name="sex" class="form-control"
										placeholder="性别" />
								</div>
								<div class="form-group">
									<label for="inputCatagory">职位</label> <input type="text"
										id="inputCatagory" name="catagory" class="form-control"
										placeholder="职位" />
								</div>
								<div class="form-group">
									<label for="inputAge">年龄</label> <input type="text"
										id="inputAge" name="age" class="form-control"
										placeholder="年龄" />
								</div>
								
								<button type="submit" name="submit" class="btn btn-primary">添加</button>
							</form>
						</div>
						<div id="deleteUser" class="tab-pane fade in active">
							<form role="form" name="deleteForm" 
								action="<%=path%>/user/deleteUser.action" method="post"
								onsubmit="return confirm('你确定要删除吗？')">
								<div class="form-group">
									<div>
										<label>请选择要删除的店员编号：</label> <select class="form-control" name="userid">
											<s:iterator value="#session.users" var="user">
												<option name="tid" username='<s:property value="#user.username"/>'><s:property
														value="#user.userid" /></option>
											</s:iterator>
										</select>
									</div>
									<div>
										<label for="deleteUsername">店员姓名:</label> <input name="username"
											type="text" id="deleteUsername" class="form-control"
											readonly="true" />
									</div>
								</div>
								<button type="submit" name="submit" class="btn btn-default">删除</button>
							</form>
						</div>
						<div id="updateUser" class="tab-pane fade in active">
						<form role="form" name="updateForm"
							action="<%=path%>/user/updateUser.action" method="post">
							<div class="form-group">
								<div>
									<label>请选择要修改的店员编号：</label> <select class="form-control" name="userid">
										<s:iterator value="#session.users" var="user">
											<option name="userid" username='<s:property value="#user.username"/>'><s:property
													value="#user.userid" /></option>
										</s:iterator>
									</select>
								</div>
								<div>
									<label for="updateUsername">请输入名称:</label> <input name="username"
										type="text" id="updateUsername" class="form-control" />
								</div>
								<div>
									<label for="inputSex">性别</label> <input type="text" 
										id="inputSex" name="sex" class="form-control"/>
								</div>
								<div>
									<label for="inputCatagory">职位</label> <input type="text" 
										id="inputCatagory" name="catagory" class="form-control" />
								</div>
								<div>
									<label for="inputAge">年龄</label> <input type="text"
										id="inputAge" name="age" class="form-control" />
								</div>
							</div>
							<button type="submit" name="submit" class="btn btn-default">修改</button>
						</form>
					</div>
					</div>	
				</div>
				<div class="col-lg-9 tab-content detail_list">
					<!-- 功能框 -->
					<div class="tab-content">
						<s:action name="getAllUsers" executeResult="true"></s:action>
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
		$('.operateTab li').click(function() {
			var index = $(this).index();
			$(this).addClass('active').siblings().removeClass('active');
			$(".operation_panel>div").eq(index).addClass("show").siblings().removeClass("show");
			return false;
		});
		function update(){
			var select = $('#updateUser select');
			var inputName = $('#updateUsername');
			select.change(function() {
				inputName.attr('value', $(this).find("option:selected").attr(
						'username'));
			});
			$('#updateUser select').trigger('change');
		}
		
		function deleteUser(){
			var select = $('#deleteUser select');
			var inputName = $('#deleteUsername');
			select.change(function() {
				inputName.attr('value', $(this).find('option:selected').attr(
						'username'));
			});
			$('#deleteUser select').trigger('change');
		}
		
		update();
		deleteUser();
		
	</script>

</body>
</html>
