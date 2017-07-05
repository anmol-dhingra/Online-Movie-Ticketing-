<%-- 
    Document   : index
    Created on : 9 Jul, 2016, 3:19:01 PM
    Author     : Lenovo
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <%  
    String comment=request.getParameter("val");
    double amount=0;
    String[] data = comment.split("\\-");
    for(int i=0;i<data.length;i++){
    out.print(data[i]+" ");
    }
        %>
        
    </body>
</html>