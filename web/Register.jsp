<%-- 
    Document   : Register
    Created on : Jul 5, 2016, 1:35:10 AM
    Author     : Anmol Dhingra
--%>

<%@page contentType="text/html" import="java.sql.*;" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        <link rel="stylesheet" href="style.css">
       <link rel="stylesheet" href="bootstrap.min.css">
        <script src="jquery.min.js"></script>
        <script src="bootstrap.min.js"></script>
    </head>
    <jsp:includepage="header.jsp" />
    <body>
        <form method="post" action="" class="form-sign in">
          <div class="panel-heading">  <h2>Register</h2></div>
          <div class="panel-body">
          <div class="form-group"><label> Name</label><input type="text" name="name" required="true" class="form-control"></div>
          <div class="form-group">  Username<input type="text" name="t1" required="true" class="form-control"></div>
          <div class="form-group">  Password<input type="password" name="pass"  required="true" class="form-control"></div>
          <div class="form-group">Confirm Password<input type="password" name="cpass"  required="true" class="form-control"></div>
          <div class="form-group"><input type=submit name="register" value="Register" ></div>
            <%
            if(request.getParameter("register")!=null)
            { 
            String nam=request.getParameter("name");
            String u=request.getParameter("t1");
            String password=request.getParameter("pass");
            String confirmPassword=request.getParameter("cpass");
            {
            try
            {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/multiplex","root","");
            Statement st=con.createStatement();
            ResultSet rs;
            rs=st.executeQuery("Select * from login where username='"+u+"'");
            if(rs.next())
            {
                %>
          <div class="text-warning bg-warning">
                Username is already taken
                </div>
             <%   
            }
            else if(password.equals(confirmPassword))
                  {
               st.executeUpdate("insert into login values('"+u+"','"+nam+"','"+password+"','nothing')");
}
                       else
                    {%>
                 <div class="text-warning bg-warning">
                Password and Confirm Password Not Equal
            </div>
             <% 
                }
                    }
                catch(Exception e)
                {
                    out.print(e);
                }
            }
      
            }
            
            %>
           </div>
        </form>
           <br><br><br><br><br><br><br>
          <jsp:includepage="footer.jsp" />
        </body>
</html>
