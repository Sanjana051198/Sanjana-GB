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
	<form action="deletedep" method="post">
	<table>
	<tr>
		<td>DepartmentName :</td>
		<td><select name="branch_name">
		
		<%@ page import="java.sql.*" %>
		<%@ page import="javax.sql.*" %>
		<% try
		{
			%><option >Department</option><%
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root@123");
			Statement statement = connection.createStatement() ;
			ResultSet rs=statement.executeQuery("select * from branches") ;
			String branch_name;
			while(rs.next())
			{
				branch_name=rs.getString(1);%>
				
            	<option value=<%=branch_name%> ><%= branch_name %></option>
        	<% } 
			statement.close();
			connection.close();
 		}
       	 catch(Exception e)
       	 {
             out.println("wrong entry"+e);
       	 } %>
		</select></td>
		</tr>
		</table>
		<input type="submit" value="Submit">	
	</form><br><br>
	
	<a href="http://localhost:8080/HospitalManagement/admin.jsp">BACK</a><br/>
	<a href="http://localhost:8080/HospitalManagement/adminlogin.jsp">Log Out</a><br/>

</body>
</html>