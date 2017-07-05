<!DOCTYPE html>  
<html>  
<head>  
<style>  
div.box{margin:2px;border:1px solid pink;padding:10px;background-color:#e3e3e3} 
div.ScrollStyle
{
    max-height: 150px;
    overflow-y: scroll;
}
</style>  
</head>  
<body>  
  
<%@ page import="java.sql.*" %>  
<%  
    HttpSession mySession=request.getSession(false);
String comment=request.getParameter("comment");  
String name=request.getParameter("name");  
String audin=(String)mySession.getAttribute("audino");

try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/multiplex","root","");  
PreparedStatement ps=con.prepareStatement("insert into usercomment(comment,name,audino) values(?,?,?)");
ps.setString(1,comment);  
ps.setString(2,name);  
ps.setString(3, audin);
ps.executeUpdate();
out.print("<div class='box'>");
out.print("<h5>"+comment+"</h5>");
out.print("<h6>- "+name+"</h6>");  
out.print("</div>");  
 
  
con.close();  
}catch(Exception e){out.print(e);}  
   
%>  
</body>  
</html>  