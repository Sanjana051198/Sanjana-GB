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
	<form action="emtriage" method="post">
		<table>
		<tr>
		<td>Phone Number :</td>
		<td><input type="text" name="phone" /></td>
		</tr>
		<tr>
		<td>Chief Complain :</td>
		<td><input type="text" name="complain" size="100"/></td>
		</tr>
		<tr>
		<td><input type="submit" value="Submit" /></td>
		</tr>
		</table>
	</form><br><br>
	
	<a href="http://localhost:8080/HospitalManagement/emserlogin.jsp">BACK</a><br/>
</body>
</html>