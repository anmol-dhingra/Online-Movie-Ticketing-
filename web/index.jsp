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
        <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <%  
            HttpSession mySession=request.getSession(false);
            String audin=(String)mySession.getAttribute("audino");
    String comment=request.getParameter("val");  
    int count=Integer.parseInt(request.getParameter("count"));
    String[] myseats;
    myseats=comment.split("\\s");
    int amount=0;
    if(audin!="Audi3")
    for(int i=0;i<myseats.length;i++)
    {
        if(count>0)
        {
        if(myseats[i].charAt(0)>='G')
        {
            amount+=250;
        }
        else
        {
            amount+=220;
        }
        }
     
    }
    else
      for(int i=0;i<myseats.length;i++)
    {
        if(count>0)
        {
        if(myseats[i].charAt(0)>='E')
        {
            amount+=250;
        }
        else
        {
            amount+=220;
        }
        }
     
    }  
  
    out.print("<h4><b>Seats Selected=</b>"+comment+"</h4><br/>");
out.print("<h4><b>Total: &#8377</b>"+amount+"</h4>");

mySession.setAttribute("amount", amount);
   // out.print(count+"<br/>");
        %>
        
    </body>
</html>