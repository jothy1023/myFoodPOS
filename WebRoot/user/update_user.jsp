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

	<div id="updateUser" class="tab-pane fade in active">
		<form role="form" name="updateForm"
			action="<%=basePath%>user/updateUser.action" method="post">
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
	<script>
		var select = $('select');
		var inputName = $('#updateUsername');
		select.change(function() {
			inputName.attr('value', $(this).find("option:selected").attr(
					'username'));
		});
		$('select').trigger('change');
	</script>
</body>
</html>
