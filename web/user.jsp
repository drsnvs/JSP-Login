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
    <title>User Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #333;
            text-align: center;
        }

        .message {
            font-size: 18px;
            color: #555;
            text-align: center;
        }

        .message span {
            font-weight: bold;
            color: #007bff; /* You can change the color to your preference */
        }

        .btn-container {
            text-align: center;
            margin-top: 20px; /* Added margin for better spacing */
        }

        .btn {
            width: 150px;
            padding: 10px;
            background-color: #4caf50;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            font-size: 16px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #45a049;
        }
    </style>
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
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/darshan_14","root","");

            ps = con.prepareStatement("select * from users");

            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                // If user found
    %>
                <div class="container">
                    <h1>Welcome Page</h1>
                    <p class="message">Welcome: <span id="email"><%= request.getParameter("email") %></span></p>
                    <div class="btn-container">
                        <button class="btn"><a href="logout.jsp" style="color: white;">LogOut</a></button>
                    </div>
                </div>
    <%
            } else {
                // If user not found
                out.print("User not found");
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
    %>
</body>
</html>
