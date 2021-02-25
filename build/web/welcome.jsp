<%@ page import="java.sql.*" %>  
<%
    if (session.getAttribute("welcome") != null) //check login session user not access or back to register.jsp page
    {
        response.sendRedirect("bill.jsp");
    }
%>

<%
    try {
        Class.forName("com.mysql.jdbc.Driver"); //load driver
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbuser", "root", "root"); //create connection

        Statement statement = con.createStatement();
        String query = "CREATE TABLE bill(item VARCHAR(50)NOT NULL, quantity INT NOT NULL, rate INT NOT NULL,amount INT NOT NULL );";
        
        String drop = "DROP TABLE bill;";

        statement.executeUpdate(drop);
        statement.executeUpdate(query);

        if (request.getParameter("btn_basic") != null) {
            String businessname, address, city;

            businessname = request.getParameter("txt_businessname"); //txt_businessname
            address = request.getParameter("txt_address"); //txt_address
            city = request.getParameter("txt_city"); //txt_city

            PreparedStatement pstmt = null; //create statement

            pstmt = con.prepareStatement("insert into basic(businessname,address,city) values(?,?,?)"); //sql insert query
            pstmt.setString(1, businessname);
            pstmt.setString(2, address);
            pstmt.setString(3, city);

            pstmt.executeUpdate(); //execute query

            request.setAttribute("successMsg", "Register Successfully...! Please login"); //register success messeage

            con.close(); //close connection
        }
    } catch (Exception e) {
        out.println(e);
    }
%>

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


        <title>Welcome : <%=session.getAttribute("login")%></title>



    </head>

    <body>



        <div class="main-content">

            <center>

                <%
                    if (session.getAttribute("login") == null || session.getAttribute("login") == " ") //check condition unauthorize user not direct access welcome.jsp page
                    {
                        response.sendRedirect("login.jsp");
                    }
                %>

                <h1>Welcome, <%=session.getAttribute("login")%></h1>

                <h2><a href="logout.jsp">Logout</a></h2>
                <form   method="post" action="bill.jsp">
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
                            <input type="text" class="form-control" name="txt_city"  placeholder="Enter City" required>
                        </label>
                    </div>
                    <button type="submit" class="btn btn-primary" name="btn_basic" value="basic">Submit</button>
                </form>
            </center>

        </div>

    </body>

</html>

