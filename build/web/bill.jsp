<%@page import="java.sql.*" %>
<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbuser", "root", "root");
        if (request.getParameter("btn_next") != null) {
            String item, quantity, rate, amount;
            item = request.getParameter("text_item");
            quantity = request.getParameter("text_quantity");
            rate = request.getParameter("text_rate");
            amount = request.getParameter("text_amount");
            PreparedStatement p = null;
            p = con.prepareStatement("insert into bill(item,quantity,rate,amount) values(?,?,?,?)");
            p.setString(1, item);
            p.setString(2, quantity);
            p.setString(3, rate);
            p.setString(4, amount);
            p.executeUpdate();
            con.close();

        }

    } catch (Exception e) {
        out.print(e);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <title>bill</title>
    </head>
    <body>
        <div class="container card">
            <table class="table">
                <thead>
                    <tr>
                        <th>Item</th>
                        <th>Quantity</th>
                        <th>Rate</th>
                        <th>Amount</th>
                    </tr>

                </thead>
                <tbody>
                    <tr>
                <form method="post" action="bill.jsp">
                    <td>
                        <input type="text" name="text_item" required>
                    </td>
                    <td>
                        <input type="number" name="text_quantity"  id="1"required>
                    </td>
                    <td>
                        <input type="number" name="text_rate" id="2" required>
                    </td>
                    <td>
                        <input type="number" name="text_amount" id="3" onclick="f1()" required>
                    </td>


                    </tr>
                    <tr class="card-footer">
                    <input type="submit" name="btn_next" value="Next Row">
                    </tr>

                </form>
                <%                      Class.forName("com.mysql.jdbc.Driver"); //load driver

                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbuser", "root", "root"); //create connection
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("select *  from bill");
                    while (rs.next()) {
                        String Item;
                        int Quantity, Rate, Amount;
                        Item = rs.getString("item");
                        Quantity = rs.getInt("quantity");
                        Rate = rs.getInt("rate");
                        Amount = rs.getInt("amount");
                %>
                <tr>
                    <td><%=Item%></td>
                    <td><%=Quantity%></td>
                    <td><%=Rate%></td>
                    <td><%=Amount%></td>

                </tr>
                <%
                    }
                    String strQuery = "SELECT SUM(amount) FROM bill";
                    ResultSet r = stmt.executeQuery(strQuery);
                    String sum = "";
                    while (r.next()) {
                        sum = r.getString(1);
                %>
                <p> Total:<%=sum%></p>
                <%
                    }
                    con.close();
                %>


                </tbody>
            </table>

        </div>
        <script>
            function f1()
            {
                var x, y, z;
                x = document.getElementById("1").value;
                y = document.getElementById("2").value;
                z = x * y;
                document.getElementById("3").value = z;
            }
        </script>

    </body>
</html>

