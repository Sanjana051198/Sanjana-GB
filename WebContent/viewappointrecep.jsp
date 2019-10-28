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
	<form action="viewappointmentrecep.jsp">
	<table>
	<tr>
		<td>Patient Name : </td>
		<td><input type="text" name="name"></td>
		</tr>
		<%@ page import=" java.text.DateFormat" %> 
		<%@ page import ="java.text.SimpleDateFormat" %>
		<% long millis=System.currentTimeMillis();  
    java.sql.Date date=new java.sql.Date(millis);
     DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");  
     String strDate = dateFormat.format(date); %>
	<tr>
	<td><input type="text" name="date" value=<%=strDate %>></td>
	</tr>
	<tr>
		<td>		<input type="submit" value="Submit"></td>
		</tr>
		</table>
	</form>
	<a href="http://localhost:8080/HospitalManagement/recep.jsp">BACK</a><br/>
	<a href="http://localhost:8080/HospitalManagement/receplogin.jsp">Log Out</a><br/>

</body>
</html>