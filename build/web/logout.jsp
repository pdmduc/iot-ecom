<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.ioit.model.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
    </head>
    <body>
        <%
            String name = request.getParameter("name");
        %>
        <h1 style = "text-align: center;" >Logged  out of IoT Bay</h1>
        <h2 style = "text-align: center;" >We hoped you enjoyed your browsing experience!
            </b>
            <a href="index.jsp" style = "text-align: center;" >Logout</a> </h2>
        <%session.invalidate(); %>
    </body>
</html>
