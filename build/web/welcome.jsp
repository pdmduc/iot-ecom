
<%@page import="uts.ioit.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome Page</title>
    </head>
    <body>
        <%
            String account_type = request.getParameter("account_type");
            String email = request.getParameter("email");
            String name = request.getParameter("name");
            String password = request.getParameter("password");
            String dob = request.getParameter("dob");
            String phone_number = request.getParameter("phone_number");
            String billing_address = request.getParameter("billing_address");
        %>
        <h1 style = "text-align: center;" >Welcome to IoTBay <%= name %>!</h1>
        <p style = "text-align: center;" >We hope you enjoy your browsing experience</p>
        <h1>Welcome <%= name %>!</h1>
        <h1>Your Email is <%= email %></h1>
        <h1>Your name is <%= name %></h1>
        <h1>Your password is <%= password %></h1>
        <h1>Your date of birth is <%= dob %></h1>
        <h1>Your phone number is <%= phone_number %></h1>
        <p style = "text-align: center;">Click <a href = "main.jsp" >here </a>to proceed to main page</p>
        
        <%
            User user = new User (account_type,email,name, password, dob, phone_number, billing_address);
            session.setAttribute("user", user);
        %>
    </body>
</html>