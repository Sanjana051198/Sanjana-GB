<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body background="C:\Users\gvsan\Desktop\Hospital.jpg">
<br><br><br><br><br>
	<form action="changePass" method="post">
	<table>
	<tr>
		<td>UserName : </td>
		<td><input type="text" name="name"></td>
		</tr>
		<tr>
		<td>New Password : </td>
		<td><input type="password" name="password"></td>
		</tr>
		<tr>
		<td><input type="submit" value="Submit"></td>
		</tr>
		</table>
	</form><br><br>
	<a href="http://localhost:8080/HospitalManagement/patientlogin.jsp">Back</a><br/>
</body>
</html>