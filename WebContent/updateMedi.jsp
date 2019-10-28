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
		String name=request.getParameter("medicinename");
	try
	{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root@123");
		PreparedStatement statement = connection.prepareStatement("select * from pharma where medicinenamepharma=?") ;
		statement.setString(1,name);
		ResultSet rs=statement.executeQuery();
		
		rs.next();
		name=rs.getString(1);
		String quantity=rs.getString(2);
		String price=rs.getString(3);
		String alternative=rs.getString(4);
		String purpose=rs.getString(5); %>
		<form action="updatemedi" method="post">
		<table>
			<tr>
			<td>MediName :<td><input type="text" name="medicinename" value=<%=name %>></td>
			</tr>
			<tr>
			<td>Quantity :</td><td><input type="text" name="quantity" value=<%=quantity %>></td>
			</tr>
			<tr>
			<td>Price perUnit :</td><td><input type="text" name="price" value=<%=price %>></td>
			</tr>
			<tr>
			<td>Alternative :</td><td><input type="text" name="alternative" value=<%=alternative %>></td>
			</tr>
			<tr>
			<td>Purpose :</td><td><input type="text" name="purpose" value=<%=purpose %>></td>
			</tr>
			<tr>		
			<td>Done :</td><td><input type="submit" value="Submit"></td>
			</tr>
			</table>
	</form><br><br>
	<a href="http://localhost:8080/HospitalManagement/updatemedicine.jsp">BACK</a><br/>
	<a href="http://localhost:8080/HospitalManagement/pharmalogin.jsp">Log Out</a><br/>
	<% }
	catch(Exception e)
	{
	    out.println("wrong entry"+e);
	}
		
	 
	%>	
</body>
</html>