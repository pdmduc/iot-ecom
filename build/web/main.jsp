
<%@page import="uts.ioit.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main Page</title>
    </head>
    
    <body>
        <h1 style= "text-align: center;"> This is the main page of IoT Bay</h1>
      <%
        User user = (User) session.getAttribute("user");%>
        <%
        if (user != null){
        %>
        
        <p style = "text-align: center;">
         ${user.name} is logged in as
        </br>
            Email/ Username: ${user.email}
        </br>
        <a href = "logout.jsp">Logout</a>
        
        </p>
        <%}else{%>
        <p style = "text-align: center;">
            You are logged in as a guest
            
            </br>
         <a href = "register.jsp">Register</a>
         </br>
         <a href = "login.jsp">Login</a>
           </p>
        <%}%>
        
          <h2 style = "text-align: center;"> 
        <b>Products will be displayed soon!</b>
        </h2>
    </body>
</html>
