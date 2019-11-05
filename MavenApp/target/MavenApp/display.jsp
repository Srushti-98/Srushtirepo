<%@page import="java.sql.DriverManager"%>
		<%@page import="java.sql.ResultSet"%>
		<%@page import="java.sql.Statement"%>
		<%@page import="java.sql.Connection"%>
		<%
					
		%>
		<!DOCTYPE html>
		<html>
		<body>

		<h1>Retrieve data from database in jsp</h1>
		<table border="1">
		<tr>
		<td>Id</td>
		<td>first name</td>
		<td>last name</td>

		</tr>
		<%
		try{
			Connection connection = null;
			 Class.forName("oracle.jdbc.driver.OracleDriver");
	            connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr");
			Statement statement = connection.createStatement();
			String sql ="SELECT * FROM students";
			ResultSet resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
		%>
		<tr>
		<td><%=resultSet.getString("id") %></td>
		<td><%=resultSet.getString("first_name") %></td>
		<td><%=resultSet.getString("last_name") %></td>
		</tr>
		<%
		}
		connection.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
		</table>
		</body>
		</html>