
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
       
    </head>
    <body>
        <%
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/multiplex","root","");;
        ResultSet rs;
        Statement st=con.createStatement();
        rs=st.executeQuery("select name from login where username='Anmol7123'");
        rs.next();
        String name=rs.getString(1);
        %>
        <input type="text" id="name" value="<%=name%>">
    </body>
</html>
