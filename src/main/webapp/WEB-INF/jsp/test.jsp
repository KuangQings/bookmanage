<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.H2ter {
	background-color: yellow;
	text-align: center
}

th, td {
	padding: 30px
}

.submitT {
	text-align: center;
}

span {
	color: red
}
</style>
</head>
<body>
	<form action="alter">
		<input type="hidden" name="book.id" value="${id}">
		<table border="">
			<tr>
				<c:if test="${book!=null }">
					<td colspan="2" class="H2ter"><h2>修改图书</h2></td>
				</c:if>
				<c:if test="${book==null }">
					<td colspan="2" class="H2ter"><h2>增加图书</h2></td>
				</c:if>
			</tr>
			<tr>
				<th>书名<span>(*)</span></th>
				<td><input type="text" name="book.name" value="${book.name}"></td>
			</tr>
			<tr>
				<th>作者<span>(*)</span></th>
				<td><input type="text" name="book.author" value="${book.author}"></td>
			</tr>
			<tr>
				<th>书出版社<span>(*)</span></th>
				<td><input type="text" name="book.publish" value="${book.publish}"></td>
			</tr>
			<tr>
				<th>出版日期<span>(*)</span></th>
				<td><input type="text" name="book.publishdate" value="${book.publishdate}">(yy-MM-dd)</td>
			</tr>
			<tr>
				<th>页数<span>(*)</span></th>
				<td><input type="text" name="book.page" value="${book.page}"></td>
			</tr>
			<tr>
				<th>价格<span>(*)</span></th>
				<td><input type="text" name="book.price" value="${book.price}"></td>
			</tr>
			<tr>
				<th>内容摘要<span>(*)</span></th>
				<td><textarea name="book.content">${book.content }</textarea ></td>
			</tr>
			<tr>
				<td colspan="2" class="submitT"><button>提交</button> <button><a href="index">返回</a></button></td>
			</tr>
		</table>
	</form>
</body>
</html>