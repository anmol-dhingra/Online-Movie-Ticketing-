<%-- 
    Document   : passwordrecovery.jsp
    Created on : 15 Jul, 2016, 1:37:35 AM
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
        <title>Forgot Password</title>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <br><br><br><br>
        <div class="container">
            <div class="jumbotron">
        <form method="get" role="form" name="form1" id="form1">
     <div class="form-group">
    <label for="contactname">Enter Username
    </label>
    <input type="text" class="form-control" id="contactname" name="user" placeholder="Enter your answer" required>
    </div>
    <div class="form-group">
    <label for="contactname">Please provide the security answer
    </label>
    <input type="text" class="form-control" id="contactname" name="ans" placeholder="Enter your answer" required>
    <i>It was asked at the time of user registration...</i>
    </div>
   
            
    
<input type="submit" class="btn btn-success" value="Submit" name="ab">
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
<button type="reset" class="btn btn-warning">Reset</button>
<%
    if(request.getParameter("ab")!=null){
            String ans=request.getParameter("ans");
            String usern=request.getParameter("user");
            
            try{ 
                        Connection con=null;
                        Statement st;
                        ResultSet rs;
			Class.forName("com.mysql.jdbc.Driver");	
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/multiplex","root","");
			st=con.createStatement();
                        rs=st.executeQuery("select * from login where securityanswer='"+ans+"'and username='"+usern+"'");
			if(rs.next()){
                            response.sendRedirect("updatepassword.jsp");
                        }
                        else{
                        %>
                        <script>
                            alert("Wrong credentials entered, please try again");
                        </script>
                        <%
                            }
		}catch(Exception e)
		{
		}
                    }
                    %>
</form>
</div>
</div>
<br><br><br><br><br><br><br><br><br>
                    <jsp:include page="footer.jsp" />
    </body>
</html>