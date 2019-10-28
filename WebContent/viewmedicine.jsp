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
	<form action="viewMedi.jsp">
	<table>
	<tr>
	<td>		MedicineName :</td>
	<td><select name="medicinename">
		
		<%@ page import="java.sql.*" %>
		<%@ page import="javax.sql.*" %>
		<% try
		{
			%><option >Medicine</option><%
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root@123");
			Statement statement = connection.createStatement() ;
			ResultSet rs=statement.executeQuery("select * from pharma") ;
			String medi_name;
			while(rs.next())
			{
				medi_name=rs.getString(1);%>
				
            	<option value=<%=medi_name%> ><%= medi_name %></option>
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
		<tr>
		<td><input type="submit" value="Submit"></td>
		</tr>
		</table>	
	</form><br><br>
	<a href="http://localhost:8080/HospitalManagement/pharma.jsp">BACK</a><br/>
	<a href="http://localhost:8080/HospitalManagement/pharmalogin.jsp">Log Out</a><br/>

</body>
</html>