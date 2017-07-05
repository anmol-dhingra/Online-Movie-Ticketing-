<%-- 
    Document   : contactus
    Created on : 15 Jul, 2016, 1:11:13 AM
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
        <title>Contact Us</title>
    </head>
    <body background="images/screen.jpg">
         <jsp:include page="header.jsp" />
        <div class="container">
            <div class="jumbotron">
  <div class="row">
    <div class="col-md-6">
      <div class="panel panel-default" >
        <div class="panel-heading">
       <span class="glyphicon glyphicon-map-marker"> Address</span>
       </div>
        <div class="panel-body">
        <address>
            <h3><i>LIGHT CAMERA ACTION</i></h3>&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/logo.PNG" width="150" height="150"><br><br>
      THAPAR UNIVERSITY,<br>
          PATIALA,<br>
          147004<br>
          PUNJAB<br>
          INDIA.<br>
          <span class="glyphicon glyphicon-envelope"></span>&nbsp;Contact Us<br><strong>Anmol Dhingra</strong> anmol7phillaur@gmail.com<br>
        <strong>Anshul S Kaul</strong> anshulsaraswatkaul@gmail.com<br>

       </address>
     </div>
   </div>
</div>
<div class="col-md-6">
      <div class="panel panel-warning">
        <div class="panel-heading">
       <span class="glyphicon glyphicon-envelope"> Feedback/Enquiry</span>
       </div>
        <div class="panel-body">
<form method="post" role="form" name="form1" id="form1">
  <div class="form-group">
    <label for="contactname">Full Name
    </label>
    <input type="text" class="form-control" id="contactname" name="fullname" placeholder="Enter Full Name" required>
    <i>Please enter both your First Name and Last Name...</i>
    <span id="demo1"></span>
  </div>
  
    <div class="form-group">
    <label for="contactemail">Email-id
    </label>
    <input type="email" class="form-control" id="contactemail" name="email" placeholder="Enter Email-id" required>
    <span id="demo4"></span>
  </div>
    <div class="form-group">
    <label for="contactsubject">Subject</label>
    <input type="text" class="form-control" id="contactsubject" name="subject" placeholder="Subject" >
    <span id="demo2"></span>
  </div>
<div class="form-group">
    <label for="contactmessage">Message</label>
    <textarea class="form-control" id="contactmessage" name="comment" rows="6" required>
    </textarea>
    <span id="demo3"></span>
  </div>
<input type="submit" class="btn btn-success" value="Submit" name="a">
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
<button type="reset" class="btn btn-warning">Reset</button>
</form>
</div>
</div>
</div>
</div>
</div>
</div>
<%
    if(request.getParameter("a")!=null){
            String name=request.getParameter("fullname");
            String email=request.getParameter("email");
            String subject=request.getParameter("subject");
            String msg=request.getParameter("comment");
            try{ 
                        Connection con=null;
                        Statement st;
                        ResultSet rs;
			Class.forName("com.mysql.jdbc.Driver");	
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/multiplex","root","");
			st=con.createStatement();
                        st.executeUpdate("INSERT INTO feedback VALUES('"+name+"','"+email+"','"+subject+"','"+msg+"')");
			
                        %>
                        <script>
                            alert("Thank you very much for your valuable feedback");
                        </script>
                        <%
		}catch(Exception e)
		{
		}
                    }
                    %>
                     <jsp:include page="footer.jsp" />
</body>
</html>