
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.assignment1.model.User"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome Page</title>
    </head>
    <body>
        <%
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String dob = request.getParameter("dob");
        %>
        <h1 style = "text-align: center;" >Welcome to IoTBay <%= name %>!</h1>
        <p style = "text-align: center;" >We hope you enjoy your browsing experience</p>
        <p style = "text-align: center;">Click <a href = "main.jsp" >here </a>to proceed to main page</p>
        
        <%
            User user = new User (name,email,password,dob);
            session.setAttribute("user", user);
        %>
    </body>
</html>