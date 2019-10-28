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
<br>
<br>


	<form action="addmedi" method="post">
	<table>
		<tr>
		<td>MedicicneName :</td>
		<td><input type="text" name="medicinename" /></td>
		</tr>
		<tr>
		<td>Quantity :</td>
		<td><input type="text" name="quantity" /></td>
		</tr>
		<tr>
		<td>Price PerUnit :</td>
		<td><input type="text" name="price" /></td>
		</tr>
		<tr>
		<td>Alternative :</td>
		<td><input type="text" name="alternative" /></td>
		<tr>
		<td>Purpose :</td>
		<td><input type="text" name="purpose" /></td>
		<tr>	
		<tr>
		<td><input type="submit" value="Submit" /></td>
		</tr>	
	</table>
	</form>
	<br>
	<br>
	<a href="http://localhost:8080/HospitalManagement/pharma.jsp">BACK</a><br/>
	<a href="http://localhost:8080/HospitalManagement/pharmalogin.jsp">Log Out</a><br/>
	
</body>
</html>