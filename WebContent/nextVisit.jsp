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
	<form action="nextvisit" method="post">
	<table>
	<tr>
	<td>Patient Name:</td>
	<td><input type="text" name="patname"></td>
	</tr>
	<tr>
	<td>Doctor:</td>
		<td><select name="docname">
		<%@ page import="java.sql.*" %>
		<%@ page import="javax.sql.*" %>
		<% try
		{
			%><option >Doctor</option>
			
			<% Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root@123");
			PreparedStatement statement = connection.prepareStatement("select * from doctor") ;
			ResultSet rs=statement.executeQuery() ;
			String doctor_name;
			while(rs.next())
			{
				doctor_name=rs.getString(1); 			
				
            	%> <option value=<%=doctor_name%> ><%= doctor_name %></option>
        	<% } 
			statement.close();
			connection.close();
 		}
       	 catch(Exception e)
		{
             out.println("wrong entry"+e);
		}
      %>		
		</select></td>
		</tr>
		<%@ page import=" java.text.DateFormat" %> 
		<%@ page import ="java.text.SimpleDateFormat" %>
	<% long millis=System.currentTimeMillis();  
    java.sql.Date date=new java.sql.Date(millis);
     DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");  
     String strDate = dateFormat.format(date); %>
	<tr>
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
    </tr>
    <tr>
    <td><select name="purpose" >
    	<option value="general">General Check</option>
		<option value="surgery">Surgery</option>
		<option value="test">Test</option>
		<option value="Posttreatment">Post Treatment</option>
    </select></td>
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