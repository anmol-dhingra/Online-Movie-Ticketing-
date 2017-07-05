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
      
    <body background="images/adminlogin.jpg">
        <jsp:includepage="header.jsp" />
        <br><br><br>
        <div class=" col-lg-3"  ></div>       <div class="container col-lg-6"  align="center">
        <div class="panel panel-default" align="center" style="opacity: 0.9">
        <form border="2" method="post" >
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
        
            
            
        <%
            String user=request.getParameter("un");
            String passw=request.getParameter("pass");
            if(request.getParameter("c")!=null)
            {
                
                if(user.equals("lcaadmin")&&passw.equals("password"))
                 {
                HttpSession mySession=request.getSession(true);
                mySession.setAttribute("loginid",user);
                %>
        <script>
            window.open("adminform1.jsp");
            </script>
            <%
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
     </div> 
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
