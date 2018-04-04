<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.titleH {
	background-color: yellow;
	text-align: center
}

a {
	text-decoration: none
}

input {
	width: 25px
}

th, td {
	padding: 30px
}
</style>
</head>
<body>
	<form action="">
		<table border="">
			<tr>
				<td colspan="8" class="titleH"><h2>图书详细信息列表</h2></td>
			</tr>
			<tr>
				<th>书名</th>
				<th>作者</th>
				<th>出版社</th>
				<th>出版日期</th>
				<th>页数</th>
				<th>价格</th>
				<th>内容摘要</th>
				<th>操作</th>
			</tr>
			<c:forEach var="c" items="${books}">
				<tr>
					<td>${c.name}</td>
					<td>${c.author}</td>
					<td>${c.publish }</td>
					<td>${c.publishdate}</td>
					<td>${c.page}</td>
					<td>${c.price}</td>
					<td>${c.content}</td>
					<td><a href="fetchById?id=${c.id}">修改</a>&nbsp;&nbsp;<a
						href="delete?id=${c.id }">删除</a></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="8" style="text-align: center;">
					<a href="fetchById">新增图书</a>
					共${rows}条记录&nbsp; 每页<input name="pageSize" value="${pageSize}">条&nbsp;第${pageNum}页/共${totalPages}页&nbsp;
					<a href="?pageNum=1&pageSize=${param.pageSize}">第一页</a>
					<c:if test="${pageNum>1}">
						<a href="?pageNum=${pageNum-1}&pageSize=${param.pageSize}">上一页</a>
					</c:if>
					<c:if test="${pageNum==1}">
						<a>上一页</a>
					</c:if>
					<c:if test="${pageNum<totalPages}">
						<a href="?pageNum=${pageNum+1}&pageSize=${param.pageSize}">下一页</a>
					</c:if>
					<c:if test="${pageNum==totalPages}">
						<a>下一页</a>
					</c:if>
					<a href="?pageNum=${totalPages}&pageSize=${param.pageSize}">最后一页</a>&nbsp;
					转到第
					<c:if test="${pageNum<totalPages}">
						<input name="pageNum" value="${pageNum+1}">
					</c:if>
					<c:if test="${pageNum==totalPages}">
						<input name="pageNum" value="1">
					</c:if>
					&nbsp;<button>GO</button></td>
			</tr>
		</table>
	</form>
</body>
</html>