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
	<form action="appointment.jsp" >
	<table>
	<tr>
		<td>Name   :</td>
		<td><input type="text" name="name"></td>
		</tr>
		<tr>
		<td>Department:</td>
		<td><select name="department">
		<%@ page import=" java.text.DateFormat" %> 
		<%@ page import ="java.text.SimpleDateFormat" %>
		<%@ page import="java.sql.*" %>
		<%@ page import="javax.sql.*" %>
		<%long millis=System.currentTimeMillis();  
	    java.sql.Date date=new java.sql.Date(millis);
	     DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");  
	     String strDate = dateFormat.format(date); 
		try
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
			
			Statement statement1=connection.createStatement() ;
			ResultSet rs1=statement1.executeQuery("select * from appointment") ;
			String date1;			
			while(rs1.next())
			{
				date1=rs1.getString(3);
				if(strDate.compareTo(date1)>0)
				{
					PreparedStatement statement2=connection.prepareStatement("delete from appointment where dateappoint=?");
					statement2.setString(1,date1);
					statement2.executeUpdate();
					
				}
			}
			statement.close();
			statement1.close();
			connection.close();
 		}
       	 catch(Exception e)
		{
             out.println("wrong entry"+e);
		}
      %>		
		</select></td>
		</tr>
		<tr>
		<td><input type="submit" value="Submit"></td>
		</tr>
		</table>		
	</form><br><br>
	<a href="http://localhost:8080/HospitalManagement/patient.jsp">BACK</a><br/>
	<a href="http://localhost:8080/HospitalManagement/patientlogin.jsp">Log Out</a><br/>
	
</body>
</html>