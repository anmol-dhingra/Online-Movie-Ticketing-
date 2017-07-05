<%@page import="com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException"%>
<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <title>Sign Up</title>
        
    </head>
    <body background="login.jpg">
        <jsp:includepage="header.jsp" />
        <%--Form to fill details--%>

<div class="container">
    <DIV class="col-md-10 col-md-offset-1">
          <DIV class="panel panel-info" style="opacity:0.9">
            <div class="panel-heading">
              <strong>Sign Up</strong>
            </div>
          <DIV class="panel-body">
            <form method="post" role="form" id="form1" name="form1">
              <div class="form-group">
                <label>User Name</label>
                <input type="text" class="form-control" placeholder="User Name" id="username" name="username" required>
              </div>
                <div class="form-group">
                <label>Name</label>
                <input type="Text" class="form-control" placeholder="Enter your full name" id="actualname" name="actualname" required>
              </div>
              <div class="form-group">
                <label>Email</label>
                <input type="email" class="form-control" placeholder="Email" id="email" name="email" required>
              </div>
                <div class="form-group">
                <label>Mobile Number</label>
                <input type="text" class="form-control" placeholder="10 digits only" id="contact" name="contact" required>
                <span id="director" ></span>
              </div>
              <div class="form-group">
                <label>Password</label>
                <input type="password" class="form-control" placeholder="Enter Password" id="pwd" name="pwd" required>
                
              </div>
              <div class="form-group">
                <label>Retype Password</label>
                <input type="password" class="form-control" placeholder="Confirm Password" id="retypepwd" name="retypepwd" required>
                <span id="director" ></span>
              </div>
                
                <div class="form-group">
                <label>Security Answer</label>&nbsp;<br>
                What was your first teacher name? 
                <input type="Text" class="form-control" placeholder="If you forget password, use it for account retrieval" id="answer" name="answer" required>
              </div>
        
              <input type="submit" class="btn btn-success" id="sub" name="sub" value="Sign Up">
              &nbsp &nbsp &nbsp
              <button type="Reset" class="btn btn-warning" id="button2">Reset</button>
            </form>
          </DIV>
          </DIV>
        </DIV>
      </div>
    

        <%
        if(request.getParameter("sub")!=null){
           %>
       
        
        <%
            String username=request.getParameter("username");
            String name=request.getParameter("actualname");
            String emailid=request.getParameter("email");
            String contact=request.getParameter("contact");
            
        
            String pwd=request.getParameter("pwd");
            String retypepwd=request.getParameter("retypepwd");
            String answer=request.getParameter("answer");
            Connection con=null;
            Statement st;
	    ResultSet rs;
            if(!(pwd.equals(retypepwd))){
                            //throw new ArithmeticException("Password not equal");
                            %><script>alert("Password and Confirm Password not equal")</script><%
                        }
else
{
            try{    
                    if(contact.matches("[0-9]+")&&contact.length()==10)
{}
else
{throw new ArithmeticException("");}
			Class.forName("com.mysql.jdbc.Driver");	
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/multiplex","root","");
			st=con.createStatement();
                        
                        st.executeUpdate("INSERT INTO login VALUES('"+username+"','"+name+"','"+emailid+"','"+pwd+"','"+answer+"','"+contact+"')");
                        %>
                <script>
               var x=comfirm("Account successfully created!");
               if(x==true)
               {
                </script>
                <%
                    response.sendRedirect("login.jsp"); %>
                    }
                    
                    <%
		}catch(SQLIntegrityConstraintViolationException e)
		{
                  %> <script>
                alert("Username already taken, please choose another one");
                </script>
              
                    
                    <%
		}
catch(ArithmeticException e1)   
                        { %>
                <script>alert("Invalid Mobile No.");</script>    
                <% }
                catch(Exception e1)
                    {
                    }
                     
}
}
                    %>
             <jsp:includepage="footer.jsp" />
    </body>
</html>