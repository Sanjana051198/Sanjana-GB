<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body background="C:\Users\gvsan\Desktop\Hospital.jpg">
	<% String name=request.getParameter("name"); %>
	<%@ page import="java.sql.*" %>
		<%@ page import="javax.sql.*" %>
		<% 
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root@123");
			PreparedStatement statement0 = connection.prepareStatement("select * from patient WHERE patientnamepat=?") ;
			statement0.setString(1,name);
			ResultSet rs0=statement0.executeQuery() ;
			String patid=rs0.getString(2);
			PreparedStatement statement = connection.prepareStatement("SELECT * from prescription WHERE patid=?") ;
			statement.setString(1,patid);
			ResultSet rs=statement.executeQuery() ;	%>
			<table border=1>
			<tr>
			<td>Medicine Name</td>
			<td>Start Date</td>
			<td>End Date</td>
			<td>Ailment</td>
			<td>Prescription detail</td>
			<td>Response</td>
			</tr>
			
			<% while(rs.next())
			{
			String mediname=rs.getString(5);
			String stdate=rs.getString(2);
			String endate=rs.getString(3);
			String ail=rs.getString(4);
			String prescdetail=rs.getString(6);
			String resp=rs.getString(7);%>
			
			<tr>
			<td><%=mediname %></td>
			<td><%=stdate %></td>
			<td><%=stdate %></td>
			<td><%=ail %></td>
			<td><%=prescdetail %></td>
			<td><%=resp %></td>
			</tr>
			<%
			}
			%>
			</table>
			<%
			statement.close();
			connection.close();
			
 		}
       	 catch(Exception e)
       	 {
            
            out.println("wrong entry"+e);
       	 }  %>
       	 
       	 <a href="http://localhost:8080/HospitalManagement/nextPresc.jsp">New Prescription</a><br/>
		 <a href="http://localhost:8080/HospitalManagement/nextVisit.jsp">Next Visit</a><br/><br><br>
	<a href="http://localhost:8080/HospitalManagement/doctor.jsp">BACK</a><br/>
	<a href="http://localhost:8080/HospitalManagement/doctorlogin.jsp">Log Out</a><br/>
	
</body>
</html>