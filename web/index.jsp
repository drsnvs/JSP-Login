<%-- 
    Document   : index
    Created on : 23 Mar, 2024, 12:02:50 AM
    Author     : DARSHAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login Page</title>
    <style>
        /* CSS styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }
        form {
            background-color: #fff;
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
        }
        td {
            padding: 10px 0;
        }
        input[type="text"],
        input[type="password"] {
            width: calc(100% - 20px);
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #4caf50;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <%
        try {
            HttpSession ssn = request.getSession();
            ssn.setAttribute("key", ssn.getId());
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
    <h2 style="text-align:center;">Login Page</h2>
    <form method="post" action="loginData.jsp" onsubmit="return validation()">
        <table>
            <tr>
                <td>Email</td>
                <td><input type="text" name="email" id="email"></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" name="password" id="password"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Submit"></td>
            </tr>
        </table>    
    </form>
    <script>
        function validation(){
            var email = document.getElementById("email").value;
            var password = document.getElementById("password").value;
            var regex = /^[a-z0-9]+@[a-z]+\.[a-z]{2,3}$/;
            var result = regex.test(email);
            if(email == ""){
                alert("Enter email");
                return false;
            }
            if(password == ""){
                alert("Enter password");
                return false;
            }
            if(!result){
                alert("Enter valid email formate");
                return false;
            }
        }
    </script>
</body>
</html>
