<%-- 
    Document   : basic
    Created on : Dec 18, 2020, 1:44:14 PM
    Author     : kapil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbuser", "root", "root");
        if (request.getParameter("btn_basic") != null) {
            String businessname,address,city;
            businessname=request.getParameter("txt_businessname");
            address=request.getParameter("txt_address");
            city=request.getParameter("txt_city");
                       PreparedStatement pstmt = null; //create statement

            pstmt = con.prepareStatement("insert into basic(businessname,address,city) values(?,?,?,?)"); //sql insert query
            pstmt.setString(1, businessname);
            pstmt.setString(2, address);
            pstmt.setString(3, city);

            
            pstmt.executeUpdate(); //execute query
            
            request.setAttribute("successMsg", "Register Successfully...! Please login"); //register success messeage

            con.close(); //close connection
        }
    }
        catch(Exception e)
    {
        out.println(e);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    </head>
    <body>
        <div class=" card text-center">
            <form  action="/action_page.php">
                <div class="form-group">
                    <label>
                        <span>Business Name</span>
                        <input type="text" class="form-control" name="txt_businessname"  placeholder="Enter Business Name">
                    </label>
                </div>

                <div class="from-group">
                    <label>
                        <span>Address</span>
                        <input type="text" class="form-control" name="txt_address"  placeholder="Enter Address">
                    </label>
                </div>

                <div class="form-group">
                    <label>
                        <span>City</span>
                        <input type="text" class="form-control" name="txt_city"  placeholder="Enter City">
                    </label>
                </div>
                <button type="submit" class="btn btn-primary" name="btn_basic" value="basic">Submit</button>
            </form>
        </div>
    </body>
</html>
