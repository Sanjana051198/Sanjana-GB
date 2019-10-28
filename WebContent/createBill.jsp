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
		<%@ page import="java.text.SimpleDateFormat" %>
		<%@ page import="java.sql.Date" %>
		<% String name=request.getParameter("medicinename");
			String quantity=request.getParameter("quantity");
			long millis=System.currentTimeMillis();  
	        java.sql.Date date=new java.sql.Date(millis);  
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root@123");
			PreparedStatement statement = connection.prepareStatement("SELECT * from pharma WHERE medicinenamepharma=?") ;
			statement.setString(1,name);
			ResultSet rs=statement.executeQuery() ;	
			
			rs.next();
			String medname=rs.getString(1);
			int quant=Integer.parseInt(rs.getString(2));
			double price=rs.getDouble(3);
			String alternative=rs.getString(4);
			String purpose=rs.getString(5);
			
			quant=quant-Integer.parseInt(quantity);
			double custprice=price*Integer.parseInt(quantity);
			
			
			if(!(quant<0))
			{
			PreparedStatement statement1 = connection.prepareStatement("UPDATE pharma SET medicinenamepharma=?,availibilitypharma=?,priceperunitpharma=?,alternativepharma=?,medpurposepharma=?"
					) ;
			PreparedStatement statement2 = connection.prepareStatement("INSERT INTO bill(datebill,medid,amount) VALUES(?,?,?)") ;
			statement1.setString(1,medname);
			statement1.setString(2,Integer.toString(quant));
			statement1.setDouble(3,price);
			statement1.setString(4,alternative);
			statement1.setString(5,purpose);
			statement1.executeUpdate() ;
			
			statement2.setDate(1,date);
			statement2.setString(2,medname);
			statement2.setDouble(3,price);
			statement2.executeUpdate();
			
			statement.close();
			connection.close();
								
			%>
			<form action="bill.jsp">
			<table>
			<tr>
			<td>MedicicneName :</td><td><input type="text" name="medicinename" value=<%=name %>></td>
			</tr>
			<tr>
			<td>Quantity      :</td><td><input type="text" name="quantity" value=<%=quantity %>></td>
			</tr>
			<tr>
			<td>Price PerUnit :</td><td><input type="text" name="price" value=<%=custprice %>></td>
			</tr>
			<tr>
			<td>Alternative   :</td><td><input type="text" name="alternative" value=<%=alternative %>></td>
			</tr>
			<tr>
			<td>Purpose       :</td><td><input type="text" name="purpose" value=<%=purpose %>></td>
			</tr>
			<tr>		
			<td>Done          :</td><td><input type="submit" value="Submit"></td>	
			</tr>
			</table>
		    </form><br><br>
			
			<% }			
 		}
       	 catch(Exception e)
       	 {
            
            out.println("wrong entry"+e);
       	 } %>
       	 
       	 <a href="http://localhost:8080/HospitalManagement/bill.jsp">BACK</a><br/>
       	 <a href="http://localhost:8080/HospitalManagement/pharmalogin.jsp">Log Out</a><br/>
</body>
</html>