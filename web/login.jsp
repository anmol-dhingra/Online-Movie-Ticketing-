<%@page contentType="text/html" import="java.sql.*;" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function myfunc()
            {
                alert("Invalid Username/Password!!");
            }
         </script>
    </head>
       <link rel="stylesheet" href="bootstrap.min.css">
        <script src="jquery.min.js"></script>
        <script src="bootstrap.min.js"></script>
      
    <body background="login.jpg">
        <jsp:includepage="header.jsp" />
        <br><br><br>
        <div class=" col-lg-3"  ></div>       <div class="container col-lg-6"  align="center">
         &nbsp;&nbsp;<div class="panel panel-default" align="center" style="opacity: 0.8">
        <form method="post" action="" border="2" class="form-sign in">
        <div class="panel-heading bg-primary">
        <h3>Login Here</h3>
        </div>
        <div class="panel-body">
        <div class="form-group">
        <label for="username">Username </label> <input type="text" class="form-control" name="un" id="username" size=15px required="true">
        </div>
        <div class="form-group">
        <label>Password </label> <input type="password"  class="form-control"  name="pass" size=15px required="true">
        </div>
        <div class="form-group">
        <input type="submit" name="c" value="Login" class="btn btn-default">
        </div>
        <div class="form-group">
        <a href="register1.jsp">Register</a>&nbsp;&nbsp;&nbsp;<a href="passwordrecovery.jsp">ForgotPassword</a>
        </div>
            </div> 
            
        <%
            String username=request.getParameter("un");
            String password=request.getParameter("pass");
         if(request.getParameter("c")!=null)
         {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/multiplex","root","");
            Statement st=con.createStatement();
            ResultSet rs;
            rs=st.executeQuery("Select * from login where username='"+username+"' and password='"+password+"'");
            if(rs.next())
            {
                HttpSession mySession=request.getSession(true);
                mySession.setAttribute("loginid",username);
                response.sendRedirect("homepage.jsp");
            }
            else
            {
                %>
                <script>
                myfunc();
               </script>
                       <%
            }
         }
        %>
     
    </form>
        
    </body>
    
         </div>
        </div>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
       
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        
        <jsp:includepage="footer.jsp" />
       </body>
    
</html>
