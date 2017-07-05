<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%> 
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <title>Upcoming</title>
        <%!
           // public void theimage()
            //{
            //ServletContext context = pageContext.getServletContext();
              //  String filePath = context.getInitParameter("file-upload");
             //   }
            %>
    </head>
    <jsp:includepage="header.jsp" />
    <body>
        <%
                    HttpSession mySession=request.getSession(false);
                    if(!mySession.getAttribute("loginid").equals("lcaadmin"))
                    {
                        response.sendRedirect("adminlogin.jsp");
                    }
        %>
        <%--Form to fill details--%>
        <div class="nav nav-pills nav-justified">
            <div class="container-fluid">
        <ul class="nav nav-pills nav-justified">    
            <li><a href="#movieregister" data-toggle="tab" class="active">Register</a></li>
            <li><a href="#nowshowing" data-toggle="tab">Now Showing</a></li>
            <li><a href="#comingsoon" data-toggle="tab">Coming soon</a></li>
        </ul>
                </div>
        </div>
        
            
            <!--Movie Register-->

<div class="jumbotron">
<div class="container">
    <DIV class="col-md-10 col-md-offset-1">
          <DIV class="panel panel-info">
            <div class="panel-heading">
              <strong>Register the Movie here</strong>
              </SPAN>
            </div>
          <DIV class="panel-body">
              <form method="post" enctype="multipart/form-data" role="form" id="form1" name="form1" >
              <div class="form-group">
                <label>Movie Title</label>
                <input type="text" class="form-control" placeholder="Name" id="moviename" name="moviename" required>
                <span class="helptext"><i>Please enter full title of the movie...</i></span>
        <span id="moviename"></span>
              </div>
                <div class="form-group">
                <label>Star Cast</label>
                <input type="Text" class="form-control" placeholder="Actors and Actress" id="starcast" name="starcast" required>
                <span id="starcast" class="helptext"><i>If more than one actor, use ',' as seperator...</i></span>
              </div>
              <div class="form-group">
                <label>Genre</label>
                <input type="Text" class="form-control" placeholder="Genre" id="genre" name="genre" required>
              </div>
                <span id="genre"></span>
              <div class="form-group">
                <label>Duration</label>
                <input type="Text" class="form-control" placeholder="Running time" id="duration" name="duration" required>
                <span id="duration" class="helptext"><i>Write as HH:MM format...</i></span>
              </div>
              <div class="form-group">
                <label>Director</label>
                <input type="Text" class="form-control" placeholder="Director" id="director" name="director" required>
                <span id="director" ></span>
              </div>
                <div class="form-group">
                <label>Release Date</label>
                <input type="Text" class="form-control" placeholder="Release Date" id="releasedate" name="releasedate" required>
                <span id="releasedate" class="helptext"><i>Write as DD/Month format...</i></span>
              </div>
              <div class="form-group">
                <label>Language</label>
                <input type="text" class="form-control" placeholder="Language" id="language" name="language" required >
                <span id="language"></span>
              </div>
              <div class="form-group">
                <label>Censor Rating</label>
                <input type="text" class="form-control" placeholder="Category" id="rating" name="rating" required>
                <span id="rating"></span>
              </div>
        <div class="form-group">
        <label>Choose Movie Poster</label><br>
        <label class="btn btn-default btn-file">
            <input type="file" id="file-id" name="file_name"><br>
            <input type="text" name="file_path" id="file-path">
        </label>
      
        <span id="demo3"></span>
        </div>
         <div class="form-group">
                <label>Youtube Link-id</label>
                <input type="text" class="form-control" placeholder="Eg:-Ohq6NmKMja8 in (https://www.youtube.com/watch?v=Ohq6NmKMja8)" id="youtube" name="youtube" required>
               
              </div>       
        <div class="form-group"
        <label for="contactmessage">Description</label>
        <textarea class="form-control" id="comment" name="comment" rows="6" required>
        </textarea>
        <span id="comment"></span>
        </div>
        
              <input type="submit" class="btn btn-success" id="register" name="register" value="Add">
              &nbsp &nbsp &nbsp
              <button type="Reset" class="btn btn-warning" id="button2">Reset</button>
            </form>
          </DIV>
          </DIV>
        </DIV>
      </div>
    </div>
      <%
        if(request.getParameter("register")!=null){
          
            String title=request.getParameter("moviename");
            String genre=request.getParameter("genre");
            String language=request.getParameter("language");
            String starcast=request.getParameter("starcast");
            String rating=request.getParameter("rating");
            String director=request.getParameter("director");
            String comment=request.getParameter("comment");
            comment = comment.replaceAll("[^a-zA-Z0-9]", "");
            String duration=request.getParameter("duration");
            String releasedate=request.getParameter("releasedate");
            String youtube=request.getParameter("youtube");
            %>
            
            <%
            String h="123.jpg";
            Connection con=null;
            Statement st;
	    ResultSet rs;
            try{    
			Class.forName("com.mysql.jdbc.Driver");	
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/multiplex","root","");
			st=con.createStatement();
                        st.executeUpdate("INSERT INTO moviesdetail VALUES('"+title+"','"+genre+"','"+language+"','"+starcast+"','"+rating+"','"+director+"','"+comment+"','"+duration+"','"+releasedate+"','"+h+"','"+youtube+"')");
                        out.println("Uploaded");
	
		}catch(Exception e)
		{
                    out.print(e);
		}
                    }
                    %>
        
        <div id="nowshowing" class="tab-pane fade">
            <div class="jumbotron">
            <div class="container">
             <DIV class="col-md-10 col-md-offset-1">
             <DIV class="panel panel-info">
             <div class="panel-heading">
              <strong>Now Showing</strong>
              </SPAN>
            </div>
          <DIV class="panel-body">
            <form method="post" role="form" id="form1" name="form1">
            <div class="form-group">
                <label>Audi</label>
                <div class="dropdown">
                <select id="audi" name="audi" class="dropdown dropdown-toggle"> 
                <option value="Audi1">Audi 1</option>
                <option value="Audi2">Audi 2</option>
                <option value="Audi3">Audi 3</option>
                <option value="Audi4">Audi 4</option>
                </select>
                </div>
                </div>
              <div class="form-group">
                <label>Enter Movie Title</label>
                <input type="text" class="form-control" placeholder="Name" id="moviename" name="moviename" required>
                <span class="helptext"><i>Please enter full title of the movie...</i></span>
                <span id="moviename"></span>
              </div>
              <input type="submit" class="btn btn-success" id="sub" name="sub" value="Add">
              &nbsp &nbsp &nbsp
              <button type="Reset" class="btn btn-warning" id="button2">Reset</button>
            </form>
          </DIV>
          </DIV>
        </DIV>
      </div>
    </div>
        <%
        if(request.getParameter("sub")!=null)
        {
           
            String title=request.getParameter("moviename");
            String selected=request.getParameter("audi");
                Connection con=null;
                Statement st;
            try{    
			Class.forName("com.mysql.jdbc.Driver");	
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/multiplex","root","");
			st=con.createStatement();
                        ResultSet r;
                        r=st.executeQuery("select count(*) from nowshowing");
                        int count=0;
                        if(r.next())
                        count=r.getInt(1);
                        st.executeUpdate("INSERT INTO nowshowing (movieno,name,audi) VALUES("+(++count)+",'"+title+"','"+selected+"')");
			
            }catch(Exception e)
		{
                    out.println(e);
		}
        }
            %>
            </div>
            
           <div id="comingsoon" class="tab-pane fade">
            <div class="jumbotron">
            <div class="container">
             <DIV class="col-md-10 col-md-offset-1">
             <DIV class="panel panel-info">
             <div class="panel-heading">
              <strong>Coming Soon</strong>
              </div>
          <DIV class="panel-body">
            <form method="post" role="form" id="form2" name="form2">
            <div class="form-group">
                <label>Movie no</label>
                <div class="dropdown">
                <select id="movieno" name="movieno" class="dropdown dropdown-toggle"> 
                <option value="Movie1">Movie 1</option>
                <option value="Movie2">Movie 2</option>
                <option value="Movie3">Movie 3</option>
                <option value="Movie4">Movie 4</option>
                </select>
                </div>
                </div>
              <div class="form-group">
                <label>Enter Movie Title</label>
                <input type="text" class="form-control" placeholder="Name" id="moviename2" name="moviename2" required>
                <span class="helptext"><i>Please enter full title of the movie...</i></span>
                <span id="moviename"></span>
              </div>
              <input type="submit" class="btn btn-success" id="sub2" name="sub2" value="Add">
              &nbsp &nbsp &nbsp
              <button type="Reset" class="btn btn-warning" id="button2">Reset</button>
            </form>
          </DIV>
          </DIV>
        </DIV>
      </div>
    </div>
        <%
        if(request.getParameter("sub2")!=null)
        {
           
            String title2=request.getParameter("moviename2");
            
                Connection con=null;
                Statement st;
            try{    
			Class.forName("com.mysql.jdbc.Driver");	
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/multiplex","root","");
			st=con.createStatement();
                        ResultSet r;
                        r=st.executeQuery("select count(*) from comingsoon");
                        int count=0;
                        if(r.next())
                        count=r.getInt(1);
                        st.executeUpdate("INSERT INTO comingsoon (name) VALUES('"+title2+"')");
			
		}catch(Exception e)
		{
                    out.println(e);
		}
        }
            %>
            </div>  
         <jsp:includepage="footer.jsp" />
        
                   
    </body>
     
</html>
