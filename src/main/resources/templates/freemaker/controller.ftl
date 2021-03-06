<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>  
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>  
<link href="https://cdn.bootcss.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="#">图书销售系统</a>
				</div>
				
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li>
							 <a href="/getAllStore?userId=${userId }">仓库情况</a>
						</li>	
						<li>
							 <a href="/toAddBook?userId=${userId }">增加图书</a>
						</li>	
						<li>
							 <a href="/toAddStore?userId=${userId }">增加仓库</a>
						</li>				
						<li class="dropdown">
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">图书类别<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li name="bookType">
									<a href="/getBooksByType?bookType=散文&userId=${userId }">散文</a>
								</li>
								<li>
									 <a href="/getBooksByType?bookType=小说&userId=${userId }">小说</a>
								</li>
							</ul>
						</li>
					</ul>
					<form class="navbar-form navbar-left" role="search" action="getBooksByName">
						<div class="form-group">
							<input type="text" class="form-control" name="bookName"/>
							<input type="hidden" name="userId" value="${userId }">
						</div> <button type="submit" class="btn btn-default">查询</button>
					</form>
					
					<ul class="nav navbar-nav navbar-right">
					<li class="active">
							 <a>账号余额:${userMoney }</a>
						</li>	
						<li class="dropdown">
							 <a class="dropdown-toggle" data-toggle="dropdown">个人中心<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								
								<li>
									 <a href="/getOrdersByUserId?userId=${userId }">个人订单</a>
								</li>
								<li>
									 <a href="/addMoney?userId=${userId }">账户充值</a>
								</li>
								<li>
									 <a href="/login">重新登录</a>
								</li>
								<li>
									 <a href="/login">退出</a>
								</li>
								<li class="divider">
								</li>
							</ul>
						</li>
					</ul>
				</div>
				
			</nav>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>
							编号
						</th>
						<th>
							书名
						</th>
						<th>
							价格
						</th>
						<th>
							类型
						</th>
						<th>
							预定
						</th>
						<th>
							操作
						</th>
					</tr>
				</thead>
				<tbody>
					<#list pageInfo.list as p>
						<tr class="success">
							<td>
								${p.bookId}
							</td>
							<td>
								${p.bookName}
							</td>
							<td>
								${p.bookPrice}
							</td>
							<td>
								${p.bookType}
							</td>
							<td>
								<a href="/book?userId=${userId }&bookId=${p.bookId}">加入购物车</a>
							</td>
							<td>
								<a href="/buy?userId=${userId }&bookId=${p.bookId}">购买</a>
							</td>
							
						</tr>			
					</#list>					
				</tbody>
			</table>
			<ul class="pagination pull-right">
				<li>
					 <a href="/getBooks?userId=${userId }&pageNum=${pageInfo.getPrePage() }">上一页</a>
				</li>
				<#list pageInfo.getNavigatepageNums() as index>
					<li>
					<#if index==pageInfo.getPageNum()>
					<li class="disabled"><a href="">${index }</a></li> 
					<#else>
					<li><a href="/getBooks?userId=${userId }&pageNum=${index}">${index }</a></li>
					</#if>
					</li>
				</#list>
				
				<li>
					 <a href="/getBooks?userId=${userId }&pageNum=${pageInfo.getNextPage() }">下一页</a>
				</li>
			</ul>
		</div>
	</div>
</div>




</body>
</html>