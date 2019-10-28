<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body background="C:\Users\gvsan\Desktop\Hospital.jpg">
	Update Details
	<%@ page import="java.sql.*" %>
	<%@ page import="javax.sql.*" %>
	<%
		String name=request.getParameter("name");
	try
	{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root@123");
		PreparedStatement statement = connection.prepareStatement("select * from patient where patientnamepat=?") ;
		statement.setString(1,name);
		ResultSet rs=statement.executeQuery();
		
		rs.next();
		name=rs.getString(1);
		String userid=rs.getString(2);
		String age=rs.getString(9);
		String sex=rs.getString(6);
		String address=rs.getString(8);
		long phone=rs.getLong(10);
		String email=rs.getString(7);
		String doctor=rs.getString(4);
		String purpose=rs.getString(5);
		String password=rs.getString(3);
		String phone_no=Long.toString(phone);%>
	        	
		<form action="updatepat" method="post">
		<table>
		<tr>
		<td>Name   :</td><td><input type="text" name="patientname" value=<%= name%>></td>
		</tr>
		<tr>
		<td>UserId :</td><td><input type="text" name="userid" value=<%= userid%>></td>
		</tr>
		<tr>
		<td>Age    :</td><td><input type="text" name="age" value=<%= age%>></td>
		</tr>
		<tr>
		<td>Sex    :</td><td><input type="text" name="sex" value=<%= sex%>></td>
		</tr>
		<tr>
		<td>Address:</td><td><input type="text" name="address" value=<%= address%>></td>
		</tr>
		<tr>
		<td>Phone  :</td><td><input type="text" name="phoneno" value=<%= phone_no%>></td>
		</tr>
		<tr>
		<td>Email  :</td><td><input type="text" name="email" value=<%= email%>></td>
		</tr>
		<tr>
		<td>Doctor :</td><td><input type="text" name="doctor" value=<%= doctor%>></td>
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
		<td>Password:</td><td><input type="password" name="password" value="password"></td>
		</tr>
		<tr>
		<td><input type="submit" value="Submit"></td>
		</tr>
		</table>
		
		</form>	
		
		<% }
	catch(Exception e)
	{
	    out.println("wrong entry"+e);
	}
		
	 
	%>	<br><br>
	<a href="http://localhost:8080/HospitalManagement/updatepatient.jsp">BACK</a><br/>
	<a href="http://localhost:8080/HospitalManagement/adminlogin.jsp">Log Out</a><br/>
   	 

</body>
</html>