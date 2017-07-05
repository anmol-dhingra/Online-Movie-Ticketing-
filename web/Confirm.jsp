
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/bootstrap.min.css" >
  <script src="jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirmation</title>
    </head>
    <body background="images/tickedbg.jpg" style="background-size: cover">
       <br><br><br><br><br><br><br>
        <div class="container">
          <strong> <h3 >Transaction Successful!!</h3></strong>
           <div class="panel"style="opacity:0.8" >
       <div class="panel-heading">
       <img src="images/logo.PNG" height="100" width="150"></img>
       </div>
           <div class="panel-content">
       <div class="panel-body">
           <img src="images/qrcode.jpg" width="150px" height="150px" align="right">
           <%
           HttpSession mySession=request.getSession(false);
           if(mySession.getAttribute("loginid")!=null)
           {
               if(mySession.getAttribute("audino")!=null)
               {
                   if(mySession.getAttribute("time_slot")!=null)
                           {
                               try
                               {
                               Class.forName("com.mysql.jdbc.Driver");
                               Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/multiplex","root","");
                               Statement st=con.createStatement(),st1=con.createStatement(),st2=con.createStatement();
                               ResultSet rs,rs1,rs2;
                               rs=st.executeQuery("select * from moviesdetail where title=(select name from nowshowing where audi='"+mySession.getAttribute("audino")+"')");
                               rs1=st1.executeQuery("select * from login where username='"+mySession.getAttribute("loginid")+"'");
                               rs.next();rs1.next();
                               out.print("<h4>Congratulation <b>"+rs1.getString(2)+"</b> you have successfully booked your seats</h4><br>");
                               out.print("<H4><b>Movie Name:</b>"+rs.getString(1)+"</h4><br>");
                               out.print("<H4><b>Movie Date:</b>"+mySession.getAttribute("date")+"</h4><br>");
                               out.print("<H4><b>Movie Time:</b>"+mySession.getAttribute("time_slot")+"</h4><br>");
                               out.print("<H4><b>Audi No:</b>"+mySession.getAttribute("audino")+"</h4><br>");
                               out.print("<H4><b>Seat No:</b>"+mySession.getAttribute("Seats")+"</h4><br>");
                               out.print("<h4><b>Total: &#8377</b>"+mySession.getAttribute("amount"));
                               }
                               catch(Exception e)
                               {
                                   out.print(e);
                               }
                               }
                   else
                   {
                       response.sendRedirect("homepage.jsp");
                   }
               }
               else
               {
                   response.sendRedirect("homepage.jsp");
               }
           }
           else
           {
               response.sendRedirect("login.jsp");
           }
           %>
           <div align="right" class="bg bg-info"><h4>Greetings!! Hope To see you again</h4></div>
           <div class="panel-footer"  align="right">
           <button class="btn btn-default" onClick="javascript: window.print();">Print PDF</button>  
           <a class="btn btn-default" href="logout.jsp">Logout</a>
           </div>
       </div>
       </div>
        </div>
           
           </div>
    </body>
</html>
