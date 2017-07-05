<%-- 
    Document   : updatepassword
    Created on : 15 Jul, 2016, 1:57:21 AM
    Author     : Lenovo
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
        <title>Update Password</title>
    </head>
    <body>
          <jsp:include page="header.jsp" />
        <div class="container">
            <div class="jumbotron">
        <form method="post" role="form" name="form1" id="form1">
    <div class="form-group">
    <label for="contactname">Enter Password
    </label>
    <input type="password" class="form-control" name="pwd" placeholder="Enter password" required>

    <span id="demo1"></span>
    </div>
    <div class="form-group">
    <label for="contactname">Confirm Password
    </label>
    <input type="password" class="form-control" name="retypepwd" placeholder="Enter again to confirm" required>

    <span id="demo1"></span>
    </div>        
    
<input type="submit" class="btn btn-success" value="Submit" name="abc">
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
<button type="reset" class="btn btn-warning">Reset</button>
<%
    if(request.getParameter("abc")!=null){
            String pwd=request.getParameter("pwd");
            String retypepwd=request.getParameter("retypepwd");
            String usern=request.getParameter("user");
            if(!pwd.equals(retypepwd)){
                %>
                <script>
                    alert("Please try again, passwords not same");
                </script>
                <%
            }
            else
            try{ 
                        Connection con=null;
                        Statement st;
                        ResultSet rs;
			Class.forName("com.mysql.jdbc.Driver");	
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/multiplex","root","");
			st=con.createStatement();
                        st.executeUpdate("update login set password='"+pwd+"' where username='"+usern+"'");
			%><script>alert("Successfully updated");</script><%
                        
		}catch(Exception e)
		{
out.print(e);
		}
                    }
                    %>
</form>
</div>
</div>
  <jsp:include page="footer.jsp" />
    </body>
</html>