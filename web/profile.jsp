<%-- 
    Document   : profile
    Created on : Jul 15, 2016, 11:08:41 PM
    Author     : Anmol Dhingra
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
        <jsp:include page="header.jsp"/>
        <div class="container">
            <div class="jumbotron">
        <form method="post" role="form">
  <div class="form-group">
    <label>Enter Password
    </label>
    <input type="password" class="form-control" id="contactname" name="oldpwd" placeholder="Enter Password" required>
  </div>
  <div class="form-group">
    <label>Enter New Password
    </label>
    <input type="password" class="form-control" id="contactname" name="newpwd" placeholder="Enter New Password" required>
  </div>
  <div class="form-group">
    <label>Confirm New Password
    </label>
    <input type="password" class="form-control" id="contactname" name="retypenewpwd" placeholder="Confirm Password" required>
  </div>
            <input type="submit" class="btn btn-success" name="pwdsubmit">&nbsp;&nbsp;&nbsp;&nbsp;
            <button type="reset" class="btn btn-warning">Reset</button>
  </form>
                <%
                    String usern="";
        HttpSession mySession=request.getSession(false);
        if(mySession.getAttribute("loginid")==null){
            response.sendRedirect("login.jsp");
        }
        else{
        usern=(String)mySession.getAttribute("loginid");
        }
      
            
        if(request.getParameter("pwdsubmit")!=null){
            String oldp=request.getParameter("oldpwd");
            String newp=request.getParameter("newpwd");
            String retypep=request.getParameter("retypenewpwd");
        try{ 
           
                        Connection con=null;
                        Statement st,stmt;
                        ResultSet rs;
			Class.forName("com.mysql.jdbc.Driver");	
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/multiplex","root","");
			st=con.createStatement();
                        rs=st.executeQuery("select password from login where username='"+usern+"'");
                        rs.next();
			if(rs.getString(1).equals(oldp)){
                            if(newp.equals(retypep)){
                                stmt=con.createStatement();
                                stmt.executeUpdate("update login set password='"+newp+"' where username='"+usern+"'");
                            }
                            else{
                                %>
                                <script>
                                    alert("Passwords don't match, please try again");
                                </script>
                                <%
                            }
                        }
                        else{
                        %>
                        <script>
                            alert("Password not correct");
                        </script>
                        <%
                            }
		}catch(Exception e)
		{
		}
                    }
                    %>
                    </div>
        </div>
                    
                    <jsp:include page="footer.jsp"/>
    </body>
</html>
