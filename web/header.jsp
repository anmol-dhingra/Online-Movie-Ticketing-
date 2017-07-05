
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
      <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
        <nav class="navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a href="homepage.jsp"><img src="images/logo.PNG" height="50" width="100"></a>
            </div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="homepage.jsp">Home</a></li>
                </ul>
            <ul class="nav navbar-nav navbar-right">
                
                <%
                HttpSession mySession=request.getSession(false);
                if(mySession.getAttribute("loginid")==null)
                {
                    %>
                <li><a href="homepage.jsp">Welcome to LCA</a></li>
                <%
                }
                else
                {
                   String name=(String)mySession.getAttribute("loginid");
                 %>
                <li class="dropdown">
               <a class="dropdown-toggle" data-toggle="dropdown"  style="color:yellow">Hello <%=name%></a>
               <ul class="dropdown-menu">
                   <li><a href="profile.jsp">Update Password</a></li>   
               </ul>
                </li>
                <%
                }
                %>
                <li><a href="contactus.jsp"><span class="glyphicon glyphicon-earphone"></span>Contact Us</a></li>
                <li><a href="register1.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                <%
                if(mySession.getAttribute("loginid")==null)
                {
                    %>
                <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>      
                    <%
                    }
                    else
                    {
                    %>
                <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
                 <%}%>
         <div id="myModal" class="modal fade" role="dialog">
         <div class="modal-dialog" >
         <div class="modal-content">
         </div></div>
         </div>
            </ul>
            </div>
            </nav>
    </body>
</html>
