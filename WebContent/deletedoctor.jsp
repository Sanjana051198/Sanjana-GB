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
<form action="deletedoc" method="post">
<table>
<tr>
	<td>	DoctorName :</td>
	<td><input type="text" name="doctorname"></td>
	</tr>
	<tr>
		<td>UserId :</td>
		<td><input type="text" name="userid"></td>
		</tr>
		<tr>
		<td>Password :</td>
		<td><input type="text" name="password"></td>
		</tr>
		<tr>	
		<td><input type="submit" value="Submit"></td>
		</tr>
		</table>	
	</form><br><br>
	<a href="http://localhost:8080/HospitalManagement/admin.jsp">BACK</a><br/>
	<a href="http://localhost:8080/HospitalManagement/adminlogin.jsp">Log Out</a><br/>

</body>
</html>