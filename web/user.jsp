<%-- 
    Document   : user
    Created on : 9 Apr, 2024, 9:48:46 PM
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
                HttpSession ssn = request.getSession();
                if(!ssn.getId().equals(ssn.getAttribute("key"))){
                    response.sendRedirect("index.jsp");
                }
            }catch(Exception e){
                e.printStackTrace();
            }
        %>
        <%!
           Connection con = null;
           Statement st = null;
           PreparedStatement ps = null; 
        %>
        <%
            try{
                
                
//                ResultSet rs = null;
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/darshan_14","root","");

                String email = request.getParameter("email");
                String password = request.getParameter("password");

    //            out.print(username);
                ps = con.prepareStatement("insert into users email_id,password,role values(?,?,2);");
                ps.setString(1, email);
                ps.setString(2, password);
                int rs = ps.executeUpdate();
                if(rs==1){
//                    if(rs.getString("email_id").equals(email) && rs.getString("password").equals(password)){
//                        if(rs.getInt("role") == 1){
//                            RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
//                            rd.forward(request, response);
//                        }else{
//                            RequestDispatcher rd = request.getRequestDispatcher("user.jsp");
//                            rd.forward(request, response);
//                        }
////                        out.println("Yes");
//                    }else{
////                        out.println("No");
//                        out.println("<script>alert('Retry')</script>");
//                    }
                    out.print("Welcome: "+request.getParameter("email"));
                }else{
                    out.print("user not inserted");
                    RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                    rd.forward(request, response);
                }
        %>
        <%
            }catch(Exception e){
                e.printStackTrace();
            }
        %>
        <h1>Welcome</h1>
    </body>
</html>
