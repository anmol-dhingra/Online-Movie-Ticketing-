

<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Audi1</title>
        <style>
            div.ScrollStyle
    {
    max-height: 150px;
    overflow-y: scroll;
    }
    div.box{margin:2px;border:1px solid pink;padding:10px;background-color:#e3e3e3} 
            .border-between > [class*='col-']:before {
    background: black;
    bottom: 5px;
    content: " ";
    left: 0;
    position: absolute;
    width: 1px;
    top: 5px;
            </style>
            <script>  
var request;  
function postComment(){  
var comment=document.commentform.comment.value;  
var name=document.commentform.name.value;  
  
var url="ajaxdis.jsp?comment="+comment+"&name="+name;  
  
if(window.XMLHttpRequest){  
request=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try{  
request.onreadystatechange=function(){  
if(request.readyState==4){  
var val=request.responseText;  
document.getElementById('mylocation').innerHTML=val;  
}  
}//end of function  
request.open("GET",url,true);  
request.send();  
}catch(e){alert("Unable to connect to server");}  
}  
function fun()
{
   <%
     DateFormat dateFormat = new SimpleDateFormat("HH:mm");
     DateFormat myformat=new SimpleDateFormat("yyyy-MM-dd");
     Calendar cal = Calendar.getInstance();
     Calendar cal2=Calendar.getInstance();
     cal2.add(Calendar.DATE,1);
     String currTime=dateFormat.format(cal.getTime());
     String currDate=myformat.format(cal.getTime());
     String tomarrow=myformat.format(cal2.getTime());
   %>    
 }
</script>
    </head>
     <jsp:includepage="header.jsp" />
     <body background="screen.jpg" onload="fun()">
        <div class="container">
        <div class="row border-between">
        <div class="col-lg-12 panel panel-default" style="opacity:0.8">
            <div class="panel-content">
                <div class="panel-body">
                <div class="col-lg-7">
            <% String audiselected="";
           HttpSession mySession=request.getSession(false);
          
           if(mySession.getAttribute("audino")!=null)
           audiselected=(String)mySession.getAttribute("audino");
           else
           {
               %><script>alert("You are not logged in");</script><%
               response.sendRedirect("login.jsp");
           }
           String movie="Select * from moviesdetail where title=(select name from nowshowing where audi='"+audiselected+"')";
            String image="";
            if(audiselected=="Audi1")
                   image="images/mov1.jpg";
            else if(audiselected=="Audi2")
               image="images/mov2.jpg";
            else if(audiselected=="Audi3")
                image="images/mov3.jpg";
            else
                image="images/mov4.jpg";
            %>
                <img src="<%=image%>" style="width:310px; height:300px" class="img-thumbnail" style="">
                </div>
        <%
            try
            {
           Class.forName("com.mysql.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/multiplex","root","");
           Statement st=con.createStatement();
           ResultSet rs;
           rs=st.executeQuery(movie);
           if(rs.next())
           {
           String title=rs.getString(1);
           String genre=rs.getString(2);
           String language=rs.getString(3);
           String starcast=rs.getString(4);
           String rating=rs.getString(5);
           String director=rs.getString(6);
           String comment=rs.getString(7);
           String duration=rs.getString(8);
           String releasedate=rs.getString(9);
           String arrow=rs.getString(10);
           String youtubeid=rs.getString(11);
         
           out.println("<h3>"+title+"("+rating+")"+"("+duration+" hrs)</h3>");
           out.println("<strong><h4>Category:</h4>"+genre+"</strong><br>");
           out.println("<strong><h4>Language:</h4>"+language+"</strong><br>");
           out.println("<strong><h4>Starcast:</h4>"+starcast+"</strong><br>");
           out.println("<strong><h4>Director:</h4>"+director+"</strong><br><br>");
           out.println("<strong><h3>The Plot</h3></strong><br/>"+comment+"<br>");
           }
           else
           {
               out.println("else");
           }
             }catch(Exception e){out.println(e);}
%>

                </div>
            </div>
        </div>
        </div>
         <div class="panel panel-default"><br>
             <nav class="nav nav-tabs">
            
               <ul class="nav nav-tabs">
               <li><a data-toggle="tab" href="#today" class="active"><%=currDate%></a><li>
               <li><a data-toggle="tab" href="#tomarrow"><%=tomarrow%></a></li>
               </ul>
          
        </nav>
        <div class="tab-content">
   <div id="today" class="tab-pane fade in active">
             <div class="panel panel-success">
             <div class="panel-heading">
                 <h4><%
                     out.print(mySession.getAttribute("audino"));
                     %></h4>
             <span class="glyphicon glyphicon-time"><b> Movie-Time</b></span>
                   </div><br>
             <div class="panel body">
        <div class="container">
            &nbsp;&nbsp;
            <form>
                <%
                    if(currTime.compareTo("09:00")>0)
                    {
                        %><input type="submit" class="btn btn-sm btn-info disabled" id="sub1" name="sub1" value="9:00"/>&nbsp;&nbsp;&nbsp;<%
                    }
                    else
{
                %>
      <input type="submit" class="btn btn-sm btn-info" id="sub1" name="sub1" value="9:00"/>&nbsp;&nbsp;&nbsp;<%}%>
      <%
                    if(currTime.compareTo("12:15")>0)
                    {
                        %><input type="submit" class="btn btn-sm btn-info disabled" id="sub2" name="sub2" value="12:15"/>&nbsp;&nbsp;&nbsp;<%
                    }
                    else
{
                %>
      <input type="submit" class="btn btn-sm btn-info" id="sub1" name="sub2" value="12:15"/>&nbsp;&nbsp;&nbsp;<%}%>
       <%
                    if(currTime.compareTo("15:30")>0)
                    {
                        %><input type="submit" class="btn btn-sm btn-info disabled" id="sub3" name="sub3" value="15:30"/>&nbsp;&nbsp;&nbsp;<%
                    }
                    else
{
                %>
      <input type="submit" class="btn btn-sm btn-info" id="sub3" name="sub3" value="15:30"/>&nbsp;&nbsp;&nbsp;<%}%>
       <%
                    if(currTime.compareTo("18:45")>0)
                    {
                        %><input type="submit" class="btn btn-sm btn-info disabled" id="sub1" name="sub1" value="18:45"/>&nbsp;&nbsp;&nbsp;<%
                    }
                    else
{
                %>
      <input type="submit" class="btn btn-sm btn-info" id="sub4" name="sub4" value="18:45"/>&nbsp;&nbsp;&nbsp;<%}%>
       <%
                    if(currTime.compareTo("22:00")>0)
                    {
                        %><input type="submit" class="btn btn-sm btn-info disabled" id="sub5" name="sub5" value="22:00"/>&nbsp;&nbsp;&nbsp;<%
                    }
                    else
{
                %>
      <input type="submit" class="btn btn-sm btn-info" id="sub5" name="sub5" value="22:00"/>&nbsp;&nbsp;&nbsp;<%}%>
      </form>
            <%
                String url="";
                if(audiselected=="Audi1")
                {
                    url="audi_1.jsp";
                }
                else if(audiselected=="Audi2")
                {
                    url="audi_2.jsp";
                }
                else if(audiselected=="Audi3")
                {
                    url="audi_3.jsp";
                }else
                {
                    url="audi_4.jsp";
                }
            if(request.getParameter("sub1")!=null)
            {
                %><script>alert("saf");</script><%
                mySession.setAttribute("time_slot","9:00");
                 mySession.setAttribute("date",currDate);
                response.sendRedirect(url);
            }
            %>
            <%
            if(request.getParameter("sub2")!=null)
            {
                %><script>alert("saf");</script><%
                mySession.setAttribute("time_slot","12:15");
                 mySession.setAttribute("date",currDate);
                response.sendRedirect(url);
            }
            %><%
            if(request.getParameter("sub3")!=null)
            {
                %><script>alert("saf");</script><%
                mySession.setAttribute("time_slot","15:30");
                 mySession.setAttribute("date",currDate);
                response.sendRedirect(url);
            }
            %><%
            if(request.getParameter("sub4")!=null)
            {
                %><script>alert("saf");</script><%
                mySession.setAttribute("time_slot","18:45");
                 mySession.setAttribute("date",currDate);
                response.sendRedirect(url);
            }
            %><%
            if(request.getParameter("sub5")!=null)
            {
                %><script>alert("saf");</script><%
                mySession.setAttribute("time_slot","22:00");
                 mySession.setAttribute("date",currDate);
                response.sendRedirect(url);
            }
            %>
      <br>
      </div>
    </div>
        </div>
      </div>
      <div id="tomarrow" class="tab-pane fade">
          <div class="panel panel-success">
             <div class="panel-heading">
                 <h4><%
                     out.print(mySession.getAttribute("audino"));
                     %></h4>
             <span class="glyphicon glyphicon-time"><b> Movie-Time</b></span>
                   </div><br>
             <div class="panel body">
        <div class="container">
            &nbsp;&nbsp;
            <form>
               
      <input type="submit" class="btn btn-sm btn-info" id="sub6" name="sub6" value="9:00"/>&nbsp;&nbsp;&nbsp;
     
      <input type="submit" class="btn btn-sm btn-info" id="sub7" name="sub7" value="12:15"/>&nbsp;&nbsp;&nbsp;
       
      <input type="submit" class="btn btn-sm btn-info" id="sub8" name="sub8" value="15:30"/>&nbsp;&nbsp;&nbsp;
       
      <input type="submit" class="btn btn-sm btn-info" id="sub9" name="sub9" value="18:45"/>&nbsp;&nbsp;&nbsp;
       
      <input type="submit" class="btn btn-sm btn-info" id="sub10" name="sub10" value="22:00"/>&nbsp;&nbsp;&nbsp;
      </form>
            <%
             
                if(audiselected=="Audi1")
                {
                    url="audi_1.jsp";
                }
                else if(audiselected=="Audi2")
                {
                    url="audi_2.jsp";
                }
                else if(audiselected=="Audi3")
                {
                    url="audi_3.jsp";
                }else
                {
                    url="audi_4.jsp";
                }
            if(request.getParameter("sub6")!=null)
            {
                mySession.setAttribute("time_slot","9:00");
                 mySession.setAttribute("date",tomarrow);
                 
                response.sendRedirect(url);
            }
           
            if(request.getParameter("sub7")!=null)
            {
                
                mySession.setAttribute("time_slot","12:15");
                 mySession.setAttribute("date",tomarrow);
                response.sendRedirect(url);
            }
          
            if(request.getParameter("sub8")!=null)
            {
             
                mySession.setAttribute("time_slot","15:30");
               mySession.setAttribute("date",tomarrow);
                response.sendRedirect(url);
            }
         
            if(request.getParameter("sub9")!=null)
            {
              
                mySession.setAttribute("time_slot","18:45");
            mySession.setAttribute("date",tomarrow);
                response.sendRedirect(url);
            }
           
            if(request.getParameter("sub10")!=null)
            {
              
                mySession.setAttribute("time_slot","22:00");
                mySession.setAttribute("date",tomarrow);
                response.sendRedirect(url);
            }
            %>
      <br>
      </div>
    </div>
        </div>
      </div>
          </div>
      </div>
     
     
      <div class="panel panel-warning">
        <div class="panel-heading">
       <span class="glyphicon glyphicon-envelope"><b> Movie Review </b></span>
       </div>
        <div class="panel-body">
<form name="commentform">
  <div class="form-group">
    
    <input type="hidden" name="name" id="name" placeholder="Enter Full Name" required>
  </div>
    <%
        String name=(String)mySession.getAttribute("loginid");
    
    %><script>document.getElementById("name").value="<%=name%>"</script>
<div class="form-group">
    <label for="contactmessage">Message</label>
    <textarea class="form-control" name="comment" rows="4" required>
    </textarea>
</div>
<input type="button" class="btn btn-sm btn-success" value="Submit" onclick="postComment()">
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
<button type="reset" class="btn btn-sm btn-warning">Reset</button>
<%
try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/multiplex","root","");    
String audin=(String)mySession.getAttribute("audino");
PreparedStatement ps2=con.prepareStatement("select * from usercomment where audino='"+audin+"'"); 
ResultSet rs=ps2.executeQuery();  
out.print("<hr/><h4>Comments:</h4>");  
%>
<div class="ScrollStyle">
<%
while(rs.next()){  
out.print("<div class='box'>");  
out.print("<h5>"+rs.getString(1)+"</h5>");  
out.print("<h6>- "+rs.getString(2)+"</h6>");  
out.print("</div>");  
}  
  
con.close();  
}catch(Exception e){out.print(e);}  
  
 
%>

</form>
            <span id="mylocation"> </span> 
            </div>
</div>
</div>
      
      
 </div>
            </div>
            
            </div>
   </div>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
         
    </body>
     <jsp:includepage="footer.jsp" />
</html>
