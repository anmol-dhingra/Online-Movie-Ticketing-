<%-- 
    Document   : logout.jsp
    Created on : Jul 7, 2016, 11:49:16 PM
    Author     : Anmol Dhingra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
       <%
           HttpSession mySession=request.getSession(false);
            mySession.invalidate();
            response.sendRedirect("homepage.jsp");
       %>
       </body>
</html>
