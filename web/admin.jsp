<%-- 
    Document   : admin
    Created on : 9 Apr, 2024, 9:03:03 PM
    Author     : DARSHAN
--%>

<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
        /* CSS styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        h2 {
            text-align: center;
            margin-top: 50px;
            margin-bottom: 20px;
        }
        table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #4caf50;
            color: #fff;
        }
        tr:hover {
            background-color: #f2f2f2;
        }
    </style>
    </head>
    <body>
        <%!
           Connection con = null;
           Statement st = null;
           PreparedStatement ps = null; 
        %>
        <h2>Admin Page</h2>
        <table>
            <tr>
                <th>First name</th>
                <th>Last name</th>
                <th>Email id</th>
                <th>Mobile no</th>
                <th>Address</th>
            </tr>
            
        <%
            try{
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/darshan_14","root","");

                ps = con.prepareStatement("select * from users");
                
                ResultSet rs = ps.executeQuery();
                    while(rs.next()){
        %>
                        <tr>
                            <td><%=rs.getString("first_name")%></td>
                            <td><%=rs.getString("last_name")%></td>
                            <td><%=rs.getString("email_id")%></td>
                            <td><%=rs.getString("mobile_no")%></td>
                            <td><%=rs.getString("address")%></td>
                        </tr>
                    <%}%>
                    <tr>
                        <th colspan="5" align="center"><a href="logout.jsp" style="color:white;">LogOut</a></th>
                    </tr>
        <%  
                
            }catch(Exception e){
                e.printStackTrace();
            }
        %>
        </table>
    </body>
</html>
