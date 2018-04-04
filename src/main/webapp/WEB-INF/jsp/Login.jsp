<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  	<style type="text/css">
        h2,.centerL{text-align: center}
        th{background-color: mediumorchid}
        th,td{padding:20px}
    </style>
</head>
<body>
	<form action="checkLogin">
		<table border="">
	    <tr><td colspan="2"><h2>登录图书管理系统</h2></td></tr>
	    <tr><th>用户名：</th><td><input type="text" name="user.name"></td></td></tr>
	    <tr><th>密码：</th><td><input type="password" name="user.password"></td></td></tr>
	    <tr><td colspan="2" class="centerL"><button>登录</button></td></tr>
	    <tr><td colspan="2" style="color: red;text-align: center">${message}</td></tr>
    </form>
</table>
</body>
</html>