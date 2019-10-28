<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body background="C:\Users\gvsan\Desktop\Hospital.jpg">
<br>
<br>
<br>
<br>
<br>
	<form action="edoccheck" method="post">
		<table>
		<tr>
		<td>UserName :</td>
		<td><input type="text" name="username" /></td>
		</tr>
		<tr>
		<td>Password :</td>
		<td><input type="password" name="password" /></td>
		</tr>
		<tr>
		<td><input type="submit" value="Submit" /></td>
		</tr>
		</table>
	</form><br><br>
	
	<a href="http://localhost:8080/HospitalManagement/emergency.jsp">BACK</a><br/>
</body>
</html>