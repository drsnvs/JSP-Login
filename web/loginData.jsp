<%-- 
    Document   : loginData
    Created on : 9 Apr, 2024, 8:14:55 PM
    Author     : DARSHAN
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try{
                Connection con = null;
                Statement st = null;
                PreparedStatement ps = null;
//                ResultSet rs = null;
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/darshan_14","root","");

                String email = request.getParameter("email");
                String password = request.getParameter("password");

    //            out.print(username);
                ps = con.prepareStatement("select * from users where email_id = ? and password = ?");
                ps.setString(1, email);
                ps.setString(2, password);
                ResultSet rs = ps.executeQuery();
                if(rs.next()){
                    if(rs.getString("email_id").equals(email) && rs.getString("password").equals(password)){
                        out.println("Yes");
                    }else{
                        out.println("No");
                        out.println("<script>alert('Retry')</script>");
                    }
                }else{
                    out.print("user not available");
                    out.println("<script>window.alert(\"Success: Operation completed successfully!\");</script>");
                    RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                    rd.forward(request, response);
                }
        %>
        <%
            }catch(Exception e){
                e.printStackTrace();
            }
        %>
    </body>
</html>
