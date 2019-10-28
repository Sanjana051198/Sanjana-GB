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
	<form action="nextpresc" method="post"><br><br>
	<table>
	<tr>
	<td>Name:</td>
	<td><input type="text" name="name"></td>
	</tr>
	<tr>
	<td>Start Date:</td>
	<td><input type="text" name="stdate"></td>
	</tr>
	<tr>
	<td>End Date:</td>
	<td><input type="text" name="endate"></td>
	</tr>
	<tr>
	<td>Medicine:</td>
	<td><input type="text" name="mediname"></td>
	</tr>
	<tr>
	<td>Ailment:</td>
	<td><input type="text" name="ail"></td>
	</tr>
	<tr>
	<td>Details:</td>
	<td><input type="text" name="detail"></td>
	</tr>
	<tr>
	<td><input type="submit" value="Submit"></td>
	</tr>
	</table>
	</form><br><br>
	<a href="http://localhost:8080/HospitalManagement/patPresc.jsp">BACK</a><br/>
	<a href="http://localhost:8080/HospitalManagement/doctorlogin.jsp">Log Out</a><br/>

</body>
</html>