<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body background="C:\Users\gvsan\Desktop\Hospital.jpg">
	<%@ page import="java.sql.*" %>
		<%@ page import="javax.sql.*" %>
		<% 
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root@123");
			PreparedStatement statement = connection.prepareStatement("SELECT * from bookedmedi") ;
			ResultSet rs=statement.executeQuery() ;	
			
			while(rs.next())
			{
			String patname=rs.getString(1);
			String mediname=rs.getString(2);
			String quantity=rs.getString(3);
			String delivered=rs.getString(4); %>
			
			<form>
			<table>
			<tr>
			<td>PatName :<td><input type="text" name="docotorname" value=<%=patname %>></td>
			
			
			<td>MediName :</td><td><input type="text" name="date" value=<%=mediname %>></td>
			
			
			<td>Quantity :</td><td><input type="text" name="time" value=<%=quantity %>></td>
			
			
			<td>Delivered :</td><td><input type="text" name="purpose" value=<%=delivered %>></td>
			
			</tr>
			</table>
		    </form>
			
			<% }statement.close();
			connection.close();
 		}
       	 catch(Exception e)
       	 {
            
            out.println("wrong entry"+e);
       	 } %><br><br>
	<a href="http://localhost:8080/HospitalManagement/pharma.jsp">BACK</a><br/>

</body>
</html>