
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>Creating a Table</title>
</head>
<body>
<h1>Creating a Table</h1>
<%
Connection connection = null;
try {
Class.forName("com.mysql.jdbc.Driver").newInstance();
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbuser", "root", "root");
Statement statement = connection.createStatement();

String query = "CREATE TABLE  <%=session.getAttribute("login")%> (Id INTEGER, Name CHAR(50));";
statement.executeUpdate(query);
out.println("Table student create sucessfully.");
}
catch (Exception e)
{
out.println("An error occurred.");
}
%>
</body>
</html>