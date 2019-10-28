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
	<form action="addpat" method="post">
	<table>
		<tr>
		<td>Name   :</td>
		<td><input type="text" name="patientname" /></td>
		</tr>
		<tr>
		<td>UserId :</td>
		<td><input type="text" name="userid" /></td>
		</tr>
		<tr>
		<td>Age    :</td>
		<td><input type="text" name="age" /></td>
		</tr>
		<tr>
		<td>Sex    :</td>
		<td><select name="sex">
		<option value="female">Female</option>
		<option value="male">Male</option>
		<option value="others">Others</option>
		</select> </td>
		</tr>
		<tr>
		<td>Address:</td>
		<td><input type="text" name="address" /></td>
		</tr>
		<tr>
		<td>Phone  :</td>
		<td><input type="text" name="phoneno" /></td>
		</tr>
		<tr>
		<td>Email  :</td>
		<td><input type="text" name="email" /></td>
		</tr>
		<tr>
		<td>Doctor :</td>
		<td><input type="text" name="doctor" /></td>
		</tr>
		<tr>
		<td>Purpose:</td>
		<td><select name="purpose">
		<option value="general">General Check</option>
		<option value="surgery">Surgery</option>
		<option value="test">Test</option>
		<option value="Posttreatment">Post Treatment</option>
		<option value="Emergency">Emergency</option>
		</select></td>
		</tr>
		<tr>
		<td>Password:</td>
		<td><input type="password" name="password" /></td>
		</tr>
		<tr>
		<td><input type="submit" value="Submit" /></td>
		</tr>
		</table>
	</form>

</body>
<br>
<br>
	<a href="http://localhost:8080/HospitalManagement/admin.jsp">BACK</a><br/>
	<a href="http://localhost:8080/HospitalManagement/adminlogin.jsp">Log Out</a><br/>
</html>