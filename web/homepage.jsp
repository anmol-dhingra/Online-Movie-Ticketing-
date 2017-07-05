
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Multiplex</title>
        <style>
            .nopadding
            {
                padding:0px;
            }
            .modal{
                overflow-y: auto; 
            }
            .modal-open
            {
                overflow: auto;
              
            }
          
            </style>
          <script>
$('.modal fade').on('hide.bs.modal', function(e) {    
    var $if = $(e.delegateTarget).find('iframe');
    var src = $if.attr("src");
    $if.attr("src", '/empty.html');
    $if.attr("src", src);
});

</script>
    </head>
    <body background="images/home2.jpg" >
        <jsp:includepage="header.jsp" />
        <br><br>
        <div id="myCarousel" class="carousel slide" data-ride="carousel" align="center">
            <ol class="carousel-indicators" style="position:absolute">
            <li data-target="#myCarousel" data-slide-to="0" class="active">   
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
            <li data-target="#myCarousel" data-slide-to="3"></li>
            </ol>
        <div class="carousel-inner" role="listbox" align="center" style="width: 75%; height:200 !important">
        <div class="item active">
        <img src="images/mov4.jpg">
        </div>  
        <div class="item">
            <img src="images/mov2.jpg">
                </div>
        <div class="item">
            <img src="images/mov3.jpg">
            </div>
        <div class="item">
            <img src="images/mov1.jpg">
        </div>
            </div>
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
       </div>
     
        <br/>
        <br/>
        <nav class="nav nav-tabs">
            <div class="container">
               <ul class="nav nav-tabs">
               <li><a data-toggle="tab" href="#now-showing" class="active">Now Showing</a><li>
               <li><a data-toggle="tab" href="#comingsoon">Coming Soon</a></li>
               </ul>
            </div>
        </nav>
        <div class="tab-content">
   
        <!--Now Showing tab-->
        <%
             String[] name=new String[4];
             String[] link=new String[4];
             String[] releasedate=new String[4];
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/multiplex","root","");
           Statement st1,st2,st3,st4;
           st1=con.createStatement();st2=con.createStatement();st3=con.createStatement();st4=con.createStatement();
           ResultSet rs1,rs2,rs3,rs4;
           String movie1="Select * from moviesdetail where title=(select name from nowshowing where audi='Audi1')";
           String movie2="Select * from moviesdetail where title=(select name from nowshowing where audi='Audi2')";
           String movie3="Select * from moviesdetail where title=(select name from nowshowing where audi='Audi3')";
           String movie4="Select * from moviesdetail where title=(select name from nowshowing where audi='Audi4')";
           rs1=st1.executeQuery(movie1);
           rs2=st2.executeQuery(movie2);
           rs3=st3.executeQuery(movie3);
           rs4=st4.executeQuery(movie4);
          rs1.next();
          rs2.next();
          rs3.next();
          rs4.next();
           name[0]=rs1.getString(1);
           link[0]="http://www.youtube.com/embed/"+rs1.getString(11);
           name[1]=rs2.getString(1);
           link[1]="http://www.youtube.com/embed/"+rs2.getString(11);
           name[2]=rs3.getString(1);
           link[2]="http://www.youtube.com/embed/"+rs3.getString(11);
           name[3]=rs4.getString(1);
           link[3]="http://www.youtube.com/embed/"+rs4.getString(11);
        }
        catch(Exception e)
        {
            out.print(e);
        }
        %>
        <div id="now-showing"  class="tab-pane fade in active">
            <br> <br>
           <div class="row">
               <div class="col-lg-3">
                <div class="panel panel-default col-sm-10 col-lg-11 col-md-11 " style=" left: 50px">
                    <div class="panel panel-title" style="height:50px"><h4><strong><%=name[0] %></strong></h4></div>
                    <div class="panel-body">
                    <img src="images/mov1.jpg" class="img-thumbnail" style=" width:230px;height:250px; ">
                    </div>
                    
                <div class="panel panel-footer panel-success" >
                <form><a class = "btn btn-default btn-success glyphicon " style="padding: 10px;background: none;color: black" data-toggle="modal" data-target="#Youtube1"><span class="glyphicon glyphicon-play"></span></a>&nbsp;&nbsp;&nbsp;&nbsp;
                <input  type="submit" class="btn btn-default btn-success" style="background: none;color:black" name="audi1" value="Book now"> </form>
                    <%
                        
                        if(request.getParameter("audi1")!=null)
                        {
                            HttpSession mySession=request.getSession(false);
                            if(mySession.getAttribute("loginid")==null)
                            {%><script>alert("You are Not Logged in");</script>
                                <%}
                            else
                                {
                                  mySession.setAttribute("audino","Audi1");
                                  response.sendRedirect("book_audi.jsp");
                    } 
                    }
                         
                    %>
                    </div>
                    </div>
                </div>
                     <div class="col-lg-3">
                 <div class="panel panel-default col-sm-10 col-lg-11 col-md-10 " style=" left: 25px">
                    <div class="panel panel-title" style="height:50px"><h4><strong><%=name[1] %></strong></h4></div>
                    <div class="panel-body">
                    <img src="images/mov2.jpg" class="img-thumbnail" style=" width:230px;height:250px;">
                    </div>
                    <div class="panel panel-footer" >
                    <form><a class = "btn btn-default btn-success glyphicon " style="padding: 10px;background: none;color: black" data-toggle="modal" data-target="#Youtube2"><span class="glyphicon glyphicon-play"></span></a>&nbsp;&nbsp;&nbsp;&nbsp;
                    <input class = "btn btn-default btn-success" style="background: none;color:black" name="audi2" type="submit" value="Book Now"> </form>
                    </div>
                    <%
                        
                        if(request.getParameter("audi2")!=null)
                        {
                            HttpSession mySession=request.getSession(false);
                            if(mySession.getAttribute("loginid")==null)
                            {%><script>alert("You are Not Logged in");</script>
                                <%}
                            else
                                {
                                  mySession.setAttribute("audino","Audi2");
                                  response.sendRedirect("book_audi.jsp");
                    } 
                    }
                         
                    %>
                    </div>
                </div>
                      <div class="col-lg-3">
                <div class="panel panel-default col-sm-10 col-lg-11 col-md-10 " style=" left: 10px">
                    <div class="panel panel-title" style="height:50px"><h4><strong><%=name[2] %></strong></h4></div>
                    <div class="panel-body">
                    <img src="images/mov3.jpg" class="img-thumbnail" style=" width:230px;height:250px; ">
                    </div>
                    
                    <div class="panel panel-footer panel-success" >
                    <form><a class = "btn btn-default btn-success glyphicon " style="padding: 10px;background: none;color: black" data-toggle="modal" data-target="#Youtube3"><span class="glyphicon glyphicon-play"></span></a>&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="submit" class = "btn btn-default btn-success" name="audi3" align="right" style="background: none;color:black" value="Book Now"></form>
                    </div>
                    <%
                        
                        if(request.getParameter("audi3")!=null)
                        {
                            HttpSession mySession=request.getSession(false);
                            if(mySession.getAttribute("loginid")==null)
                            {%><script>alert("You are Not Logged in");</script>
                                <%}
                            else
                                {
                                  mySession.setAttribute("audino","Audi3");
                                  response.sendRedirect("book_audi.jsp");
                    } 
                    }
                         
                    %>
                </div>
                </div>
                  <div class="col-lg-3">
                <div class="panel panel-default col-sm-10 col-lg-11 col-md-10 " >
                    <div class="panel panel-title" style="height:50px"><h4><strong><%=name[3] %></strong></h4></div>
                    <div class="panel-body">
                    <img src="images/mov4.jpg" class="img-thumbnail" style=" width:230px;height:250px; ">
                    </div>
                    
                    <div class="panel panel-footer panel-success" >
                   <form><a class = "btn btn-default btn-success glyphicon " style="padding: 10px;background: none;color: black" data-toggle="modal" data-target="#Youtube4"><span class="glyphicon glyphicon-play"></span></a>&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="submit" class = "btn btn-default btn-success" name="audi4" style="background: none;color:black" value="Book Now"></form>
                    </div>
                    <%
                        
                        if(request.getParameter("audi4")!=null)
                        {
                            HttpSession mySession=request.getSession(false);
                            if(mySession.getAttribute("loginid")==null)
                            {%><script>alert("You are Not Logged in");</script>
                                <%}
                            else
                                {
                                  mySession.setAttribute("audino","Audi4");
                                  response.sendRedirect("book_audi.jsp");
                    } 
                    }
                         
                    %>
                </div>
                </div>
          </div>
        </div>
            <div id="Youtube1" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">   
                    <div class="modal-header">
                            <div class="modal-title">
                            <h4><i>Trailer</i></h4>
                          </div>
                            </div>
                        <div class="flex-video">
                              <iframe src=<%=link[0]%> allowfullscreen="allowfullscreen"  width="590" height="400"></iframe>
                        </div>
                              <div class="modal-footer">
                        <button class="btn btn-default" align="right" data-dismiss="modal">Close</button>  
                    </div>
                </div>
             </div>
            </div>
        <div id="Youtube2" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">   
                    <div class="modal-header">
                            <div class="modal-title">
                            <h4><i>Trailer</i></h4>
                          </div>
                            </div>
                              <iframe src=<%=link[1]%> allowfullscreen="allowfullscreen"  width="590" height="400"></iframe>
                    <div class="modal-footer">
                        <button class="btn btn-default" align="right" data-dismiss="modal">Close</button>  
                    </div>
                </div>
             </div>
            </div>
        <div id="Youtube3" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">   
                    <div class="modal-header">
                            <div class="modal-title">
                            <h4><i>Trailer</i></h4>
                          </div>
                            </div>
                              <iframe src=<%=link[2]%> allowfullscreen="allowfullscreen"  width="590" height="400"></iframe>
                    <div class="modal-footer">
                        <button class="btn btn-default" align="right" data-dismiss="modal">Close</button>  
                    </div>
                </div>
             </div>
            </div>
        <div id="Youtube4" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">   
                    <div class="modal-header">
                            <div class="modal-title">
                            <h4><i>Trailer</i></h4>
                          </div>
                            </div>
                              <iframe src=<%=link[3]%> allowfullscreen="allowfullscreen"  width="590" height="400"></iframe>
                    <div class="modal-footer">
                        <button class="btn btn-default" align="right" data-dismiss="modal">Close</button>  
                    </div>
                </div>
             </div>
            </div>
        <!--coming soon-->
        <div id="comingsoon" class="tab-pane fade">
            <br> <br>
            <div class="row">
                <div class="col-lg-3">
                <div class="panel panel-default col-sm-10 col-lg-11 col-md-11 " style=" left: 50px">
                    <div class="panel panel-title" style="height:50px"><h4><strong>Tutak Tutak Tutiya</strong></h4></div>
                    <div class="panel-body">
                    <img src="images/2mov1.jpg" class="img-thumbnail" style=" width:230px;height:250px; ">
                    </div>
                <div class="panel panel-footer panel-success" >
                <form><a class = "btn btn-default btn-success glyphicon " style="padding: 10px;background: none;color: black" data-toggle="modal" data-target="#Youtube5"><span class="glyphicon glyphicon-play"></span></a>&nbsp;&nbsp;&nbsp;&nbsp;
                
                    </div>
                    </div>
                </div>
                     
            </div>
       </div>
        <div id="Youtube5" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">   
                    <div class="modal-header">
                            <div class="modal-title">
                            <h4><i>Trailer</i></h4>
                          </div>
                            </div>
                              <iframe src="http://www.youtube.com/embed/d6C9vO6YRm8" allowfullscreen="allowfullscreen"  width="590" height="400"></iframe>
                    <div class="modal-footer">
                        <button class="btn btn-default" align="right" data-dismiss="modal">Close</button> 
                        <h4>Release Date:7 October</h4>
                    </div>
                </div>
             </div>
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
        <div style="position: fixed; right: 0px; top: 90%; width: 5; height: 5;">
            <a href="adminlogin.jsp" class="btn primary">
  <img src="images/admin.jpg" class="pull-left" width ="50" height="50" style="opacity:0.6"/>
</a>
        </div>
         <jsp:includepage="footer.jsp" />
       
    </body>
   
</html>
