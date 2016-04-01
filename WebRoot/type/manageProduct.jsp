<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
    
    <link rel="stylesheet" type="text/css" href="type/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="type/css/manageProduct.css">
    <script type="text/javascript" src="type/js/jquery-2.1.3.min.js"></script>
	<script type="text/javascript" src="type/js/bootstrap.min.js"></script>
	

  </head>
  
  <body>
  	
    <div class="container">
    	<div class="header">
    		<ul id="myTab" class="nav nav-pills pull-right">
    			<li class="active"><a href="#manageType" data-toggle="tab">产品类别管理</a></li>
    			<li><a href="#manageItem" data-toggle="tab">产品管理</a></li>
    		</ul>
    	</div>
    	<div id="mainFrame" class="tab-content">	
    		<div id="manageType" class="tab-pane fade in active">
    			<div class="col-lg-3">
    				<ul id="operateTab" class="nav nav-pills nav-stacked">
    					<li class="active"><a href="type/create_type.jsp" data-toggle="tab">添加产品种类</a>
    					<li><a href="#deleteType" data-toggle="tab">删除产品种类</a>
    					<li><a href="type/update_type.jsp" data-toggle="tab">修改产品种类</a>
    					<li><a href="type/type_detail.jsp" data-toggle="tab">查询产品种类</a>
    				</ul>
    			</div>
    			<div class="col-lg-9 tab-content">
    				<div  style="background-color:#F3F3F3">
    					<table class="table">
	    					<thead>
	    						<tr>
	    							<td class="col-lg-2">类别编号</td>
	    							<td class="col-lg-4">类别名称</td>
	    						</tr>
	    					</thead>
	    					<tbody>
	    						<tr>
	    							<td>1</td>
	    							<td>主食</td>
	    						</tr>
	    						<tr>
	    							<td>2</td>
	    							<td>副食</td>
	    						</tr>
	    						<tr>
    								<td>3</td>
    								<td>饮品</td>
    							</tr>
    							<tr>
    								<td>4</td>
    								<td>冰淇淋</td>
    							</tr>
    						</tbody>
    					</table>
    				</div>
    				<div class="tab-content" style="background-color:#F3F3F3">
    					<iframe id="type_iframe" src="type/create_type.jsp" frameborder="0"scrolling="no" style="width:100%; height:182px; background: #f3f3f3;"></iframe> 
    				</div>
    			</div>
    		</div>
    		<div id="manageItem" class="tab-pane fade">
    			<div class="col-lg-3">
    				<ul id="operateItemTab" class="nav nav-pills nav-stacked">
    					<li class="active"><a href="#createItem" data-toggle="tab">添加产品</a>
    					<li><a href="#deleteItem" data-toggle="tab">删除产品</a>
    					<li><a href="#updateItem" data-toggle="tab">修改产品</a>
    					<li><a href="#searchItem" data-toggle="tab">查询产品</a>
    				</ul>
    			</div>
    			<div class="col-lg-9 tab-content">
    				<div  style="background-color:#F3F3F3">
    					<table class="table">
	    					<thead>
	    						<tr>
	    							<td class="col-lg-2">产品编号</td>
	    							<td class="col-lg-4">产品名称</td>
	    							<td class="col-lg-2">类别</td>
	    							<td class="col-lg-2">价格</td>
	    							<td class="col-lg-2">规格</td>
	    						</tr>
	    					</thead>
	    					<tbody>
	    						<tr>
	    							<td>1</td>
	    							<td>巨无霸</td>
	    							<td>1</td>
	    							<td>10.00</td>
	    							<td>大</td>
	    						</tr>
	    						<tr>
	    							<td>2</td>
	    							<td>巨无霸</td>
	    							<td>1</td>
	    							<td>8.00</td>
	    							<td>中</td>
	    						</tr>
	    						<tr>
	    							<td>3</td>
	    							<td>鸡肉卷</td>
	    							<td>1</td>
	    							<td>8.00</td>
	    							<td>大</td>
	    						</tr>
    							<tr>
	    							<td>3</td>
	    							<td>奥尔良烤翅</td>
	    							<td>2</td>
	    							<td>10.00</td>
	    							<td></td>
	    						</tr>
    						</tbody>
    					</table>
    				</div>
    				<div class="tab-content" style="background-color:#F3F3F3">
    					<div id="createItem" class="tab-pane fade in active">
	    					<form role="form">
	    						<div class="form-group">
	    							<label for="inputItemId">产品编号</label>
	    							<input type="text" id="inputItemId" name="inputItemId" class="form-control" placeholder="请输入数字编号"/>
	    						</div>
	    						<div class="form-group">
	    							<label for="inputItemName">产品名称</label>
	    							<input type="text" id="inputItemName" name="inputItemName" class="form-control" placeholder="名称"/>
	    						</div>
	    						<div>
	    							<label>产品类别：</label>
		    						<select class="form-control" name="productType">
		    							<option>1</option>
		    							<option>2</option>
		    							<option>3</option>
		    							<option>4</option>
		    						</select>
	    						</div>
	    						<div class="form-group">
	    							<label for="inputItemPrice">产品价格</label>
	    							<input type="text" id="inputItemPrice" name="inputItemPrice" class="form-control" placeholder="名称"/>
	    						</div>
	    						<div>
	    							<label>产品规格：</label>
		    						<select class="form-control" name="inputProductSize">
		    							<option></option>
		    							<option>大</option>
		    							<option>中</option>
		    							<option>小</option>
		    						</select>
	    						</div>
	    						<button type="submit" class="btn btn-default">添加</button>
	    					</form>
    					</div>
	    				<div id="deleteItem" class="tab-pane fade">
	    					<form role="form">
	    						<div class="form-group">
	    							<label for="deleteItemId">产品类别编号</label>
	    							<input type="text" id="deleteItemId" name="deleteItemId"class="form-control" placeholder="请输入数字编号"/>
	    						</div>
	    						<div class="form-group">
	    							<label for="deleteItemName">产品类别名称</label>
	    							<input type="text" id="deleteItemName" name="deleteItemName" class="form-control" placeholder="名称"/>
	    						</div>
	    						<div>
	    							<label>产品类别：</label>
		    						<select class="form-control" name="deleteProductType">
		    							<option>1</option>
		    							<option>2</option>
		    							<option>3</option>
		    							<option>4</option>
		    						</select>
	    						</div>
	    						<button type="submit" class="btn btn-default">删除</button>
	    					</form>
	    				</div>
	    				<div id="updateItem" class="tab-pane fade">
	    					<form role="form">
	    						<div class="form-group">
	    							<label for="updateItemId">产品编号</label>
	    							<input type="text" id="updateItemId" class="form-control" placeholder="请输入数字编号"/>
	    						</div>
	    						<div class="form-group">
	    							<label for="updateItemName">产品名称</label>
	    							<input type="text" id="updateItemName" class="form-control" placeholder="名称"/>
	    						</div>
	    						<div>
	    							<label>产品类别：</label>
		    						<select class="form-control">
		    							<option>1</option>
		    							<option>2</option>
		    							<option>3</option>
		    							<option>4</option>
		    						</select>
	    						</div>
	    						<div class="form-group">
	    							<label for="updateItemPrice">产品价格</label>
	    							<input type="text" id="updateItemPrice" class="form-control" placeholder="名称"/>
	    						</div>
	    						<div>
	    							<label>产品规格：</label>
		    						<select class="form-control">
		    							<option></option>
		    							<option>大</option>
		    							<option>中</option>
		    							<option>小</option>
		    						</select>
	    						</div>
	    						<button type="submit" class="btn btn-default">修改</button>
	    					</form>
	    				</div>
	    				<div id="searchItem" class="tab-pane fade">
	    					<form role="form">
	    						<form role="form">
	    						<div class="form-group">
	    							<label for="searchItemId">请输入产品编号</label>
	    							<input type="text" id="searchItemId" class="form-control" placeholder="请输入数字编号"/>
	    						</div>
	    						<div class="form-group">
	    							<label for="searchItemName">请输入产品名称</label>
	    							<input type="text" id="searchItemName" class="form-control" placeholder="名称"/>
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
		$('#myTab a').click(function(e){
			e.preventDefault();
			$(this).tab('show');
		});
		$('#operateTab li a').click(function(e){
			var src = $(this).attr('href');
			if(src=="type/update_type.jsp"){
				$('#type_iframe').attr('src', 'type/getAllTypes.action');
				return false;
			}
			$('#type_iframe').attr('src', src);
			return false;
		});
	</script>
	
  </body>
</html>
