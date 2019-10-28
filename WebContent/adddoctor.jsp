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
<br>
<br>
	<form action="adddoc" method="post">
	<table>
		<tr>
		<td>Name   :</td>
		<td><input type="text" name="doctorname" /></td>
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
		<td><input type="text" name="address" /><td>
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
		<td>Qualification :</td>
		<td><input type="text" name="qualification" /></td>
		</tr>
		<tr>
		<td>Type :</td>
		<td><select name="type">
		<option value="e">Emergency</option>
		<option value="ne">Non Emergency</option>
		</select>  </td>
		</tr>
		<tr>
		<tr>
		<td>Years of practice :</td>
		<td><input type="text" name="yop" /> </td>
		</tr>
		<td>Department:</td>
		<td><select name="department" ></d>
		
		<%@ page import="java.sql.*" %>
		<%@ page import="javax.sql.*" %>
		<% try
		{
			%><option >Department</option>
			
			<% Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root@123");
			Statement statement = connection.createStatement() ;
			ResultSet rs=statement.executeQuery("select * from branches") ;
			String branch_name;
			while(rs.next())
			{
				branch_name=rs.getString(1); 			
				
            	%> <option value=<%=branch_name%> ><%= branch_name %></option>
        	<% } 
			statement.close();
			connection.close();
 		}
       	 catch(Exception e)
		{
             out.println("wrong entry"+e);
		}
      %>		
		</select>
		</tr>
		<tr>
		<td>Password:</td>
		<td><input type="password" name="password" /></td>
		<td><input type="submit" value="Submit" /></td>
		</tr>
		</table>
	</form>
	<br><br>
	<a href="http://localhost:8080/HospitalManagement/admin.jsp">BACK</a><br/>
	<a href="http://localhost:8080/HospitalManagement/adminlogin.jsp">Log Out</a><br/>
</body>
</html>