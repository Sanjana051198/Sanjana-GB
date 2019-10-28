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
	<form action="deleteappointmentrecep" method="post">
	<table>
	<tr>
		<td>Patient Name : </td>
		<td><input type="text" name="name"></td>
		<%@ page import=" java.text.DateFormat" %> 
		<%@ page import ="java.text.SimpleDateFormat" %>
		<% long millis=System.currentTimeMillis();  
    java.sql.Date date=new java.sql.Date(millis);
     DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");  
     String strDate = dateFormat.format(date); %>
	
	<td><input type="text" name="date" value=<%=strDate %>></td>
	<td><select name="time">
    <option value="9:00:00">9:00:00 </option>
    <option value="9:15:00">9:15:00 </option>
    <option value="9:30:00">9:30:00</option>
    <option value="9:45:00">9:45:00 </option>
    <option value="10:00">10:00 </option>
    <option value="10:15">10:15 </option>
    <option value="10:30">10:30 </option>
    <option value="10:45">10:45 </option>
    <option value="11:00">11:00 </option>
    <option value="11:15">11:15 </option>
    <option value="11:30">11:30 </option>
    <option value="11:45">11:45 </option>
    <option value="12:00">12:00 </option>
    <option value="12:15">12:15 </option>
    <option value="12:30">12:30 </option>
    <option value="12:45">12:45 </option>
    </select></td>
				<td><input type="submit" value="Submit"></td>
				</tr>
				</table>
	</form>
	<a href="http://localhost:8080/HospitalManagement/recep.jsp">BACK</a><br/>
	<a href="http://localhost:8080/HospitalManagement/receplogin.jsp">Log Out</a><br/>
	

</body>
</html>