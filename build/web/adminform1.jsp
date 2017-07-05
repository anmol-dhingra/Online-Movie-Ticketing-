<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <title>Upcoming</title>
       
    </head>
    <jsp:includepage="header.jsp" />
    <body>
      <%
                    HttpSession mySession=request.getSession(false);
                    if(mySession.getAttribute("loginid")==null||!mySession.getAttribute("loginid").equals("lcaadmin"))
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
        <div class="tab-content">
            <!--Movie Register-->
<div id="movieregister" class="tab-pane fade in active">
<div class="jumbotron">
<div class="container">
    <DIV class="col-md-10 col-md-offset-1">
          <DIV class="panel panel-info">
            <div class="panel-heading">
              <strong>Register the Movie here</strong>
              </SPAN>
            </div>
          <DIV class="panel-body">
            <form method="post" role="form" id="form1" name="form1">
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
            String h="123.jpg";
            Connection con=null;
            Statement st;
	    ResultSet rs;
            try{    
			Class.forName("com.mysql.jdbc.Driver");	
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/multiplex","root","");
			st=con.createStatement();
                        st.executeUpdate("INSERT INTO moviesdetail VALUES('"+title+"','"+genre+"','"+language+"','"+starcast+"','"+rating+"','"+director+"','"+comment+"','"+duration+"','"+releasedate+"','"+h+"','"+youtube+"')");
			
	
		}catch(Exception e)
		{
                    out.print(e);
		}
                    }
                    %>
        </div>
        <div id="nowshowing" class="tab-pane fade">
            <div class="jumbotron">
            <div class="container">
             <DIV class="col-md-10 col-md-offset-1">
             <DIV class="panel panel-info">
             <div class="panel-heading">
              <strong>Now Showing</strong>
            </div>
          <DIV class="panel-body">
            <form method="post" role="form" >
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
                <label>Select Movie Title</label>
                    
                    <%
                        String title="";
                        try{
                            Connection con=null;
                            Statement st1,st2;
                            ResultSet rs1,rs2;
                            Class.forName("com.mysql.jdbc.Driver");	
                            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/multiplex","root","");
                            st1=con.createStatement();
                            rs1=st1.executeQuery("select count(*) from comingsoon");
                            int c=0;
                            if(rs1.next()){
                            c=Integer.parseInt(rs1.getString(1));
                            }
                            %>
                            <div class="dropdown">
                                <select id="movie" name="movie" class="dropdown">
                                    <%
                                    st2=con.createStatement();
                                    rs2=st2.executeQuery("select name from comingsoon");
                                    while(rs2.next()){
                                        title=rs2.getString(1);
                                    %>
                                <option value="<%out.print(title);%>">
                                  <%
                                        out.print(title);
                                    }
                                %>
                                </option>
                                
                            </select>
                            <%
                        }catch(Exception ex){
                            
                        }
                    %>
              
                </div>
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
                    </div>
    
        <%
        if(request.getParameter("sub")!=null)
        {
           
            title=request.getParameter("movie");
            String selected=request.getParameter("audi");
            int movieno=1;
            
            if(selected.equals("Audi1")){
                movieno=1;
            }else if(selected.equals("Audi2")){
                movieno=2;
            }else if(selected.equals("Audi3")){
                movieno=3;
            }else if(selected.equals("Audi4")){
                movieno=4;
            }  
            Connection con=null;
            Statement st,st3,st4;
	    ResultSet rs,rs3;
            Class.forName("com.mysql.jdbc.Driver");	
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/multiplex","root","");
			st=con.createStatement();
                        st3=con.createStatement();
                        st4=con.createStatement();
            try{    
                        st.executeUpdate("INSERT INTO nowshowing VALUES('"+movieno+"','"+title+"','"+selected+"')");
			st3.executeUpdate("delete from comingsoon where name='"+title+"'");
		}catch(Exception e)
		{
                    %>
                    <script>
                        var x=confirm("Warning! Movie already running, do you want to update?");
                        if(x==true){
                            <%
                                st.executeUpdate("Update nowshowing set name='"+title+"' where movieno='"+movieno+"'");
                                st3.executeUpdate("delete from comingsoon where name='"+title+"'");
                        st4.executeUpdate("delete from usercomment where audino='"+selected+"'");
                            %>  
                        }else{
                            alert("No update done");
                        }
                    </script>
                    <%
		}
                    }
                    %>
              
           <div id="comingsoon" class="tab-pane fade">
            <div class="jumbotron">
<div class="container">
    <DIV class="col-md-10 col-md-offset-1">
          <DIV class="panel panel-info">
            <div class="panel-heading">
              <strong>Coming Soon</strong>
            </div>
          <DIV class="panel-body">
            <form method="post" role="form" id="form1" name="form1">
              <div class="form-group">
                <label>Enter Movie Title</label>
                <input type="text" class="form-control" placeholder="Name" id="moviename" name="moviename" required>
                <span class="helptext"><i>Please enter full title of the movie...</i></span>
                <span id="moviename"></span>
              </div>
              
              
              <input type="submit" class="btn btn-success" id="sub1" name="sub1" value="Add">
              &nbsp &nbsp &nbsp
              <button type="Reset" class="btn btn-warning" id="button2">Reset</button>
            </form>
          </DIV>
          </DIV>
        </DIV>
      </div>
                </div>
    </div>
                    </div>
                    
                    
        <%
        if(request.getParameter("sub1")!=null){
           
            String titl=request.getParameter("moviename");
            Connection con=null;
            Statement st,st1;
	    ResultSet rs;
            
            try{    
			Class.forName("com.mysql.jdbc.Driver");	
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/multiplex","root","");
			st=con.createStatement();
                        st1=con.createStatement();
			 ResultSet moviesel;
                        Statement stmt;
                        stmt=con.createStatement();
                        moviesel=stmt.executeQuery("select * from moviesdetail where title='"+titl+"'");
                       if(moviesel.next()){
                             st.executeUpdate("INSERT INTO comingsoon VALUES('"+titl+"')");
                              %>
                        <script>
                            alert("Movie successfully added");
                        </script>
                        <%
                       }
                       else
                       {
                        %>
                        <script>
                            alert("Register the movie First");
                        </script>
                        <%
	
		}
                }   catch(Exception e)
		{
                 //   out.print(e);
                }
                    }
                    %> 
         <jsp:includepage="footer.jsp" />
        
                   
    </body>
     
</html>
