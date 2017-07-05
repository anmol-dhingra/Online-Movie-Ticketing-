<%-- 
    Document   : displayhistory
    Created on : 30 Sep, 2016, 7:19:19 PM
    Author     : Lenovo
--%>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%@ page import="java.sql.*" %>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>

    <style>
        #b1{
            background:#ddd;
            border-color: while;
            border: none;
        }
    </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <title>Transaction History</title>
    <script>
function check(){
    var x=confirm("Confirmation: Cancel the ticket??");
    if(x==true)
        return true;
    else
        return false;
}
function back(){
    a= document.getElemtById('b1');
    a.backgroundColor="grey";
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
<jsp:include page="header.jsp" />
    <body onload="fun()">s
        <div class="container">
            <div class="jumbotron">
<%  
HttpSession mySession=request.getSession(false);  
String name=(String)mySession.getAttribute("loginid");
String movietime,date;
%>
<form>
<input type="submit" class = "btn btn-default btn-success" name="history" id="history" align="right" style="background: none;color:black" value="Booking History"> 
</form>
<%
if(request.getParameter("history")!=null){
try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/multiplex","root","");  
PreparedStatement ps=con.prepareStatement("select audino,date,timeslot,count(timeslot) from bookedseat where id='"+name+"' group by date, timeslot");

ResultSet rs=ps.executeQuery();  
%>
<table class="table table-hover table-inverse">
  <thead class="thead-inverse">
    <tr>
      <th>SNo</th>
      <th>Movie Name</th>
      <th>Movie Date</th>
      <th>Movie Time</th>
      <th>No of seats Booked</th>
      <th>Status</th>
    </tr>
  </thead>
  <tbody>
<%
int i=1;
while(rs.next()){
String aud=rs.getString(1);
date=rs.getString(2);
movietime=rs.getString(3);
PreparedStatement ps3=con.prepareStatement("select name from nowshowing where audi='"+aud+"'");
ResultSet rs2=ps3.executeQuery();
out.print("<tr>");
out.print("<th>"+i+"</th>");
out.print("<td>"+rs2.getString(1)+"</td>");
out.print("<td>"+date+"</td>");
out.print("<td>"+movietime+"</td>");
out.print("<td>"+rs.getString(4)+"</td>");
if(currDate.compareTo(date)>0){
    out.print("<td>Watched</td>");
}else if(currTime.compareTo(movietime)>0){
    out.print("<td>Watched</td>");
}else{
    //<a onClick="check(); return false;" href="cancel.jsp" title="click to cancel this booking">Cancel Ticket</a>
//    mySession.setAttribute("time_slot",movietime);
//    mySession.setAttribute("date",date);
    %>
    <td>    
    <form method="post">
<input type="submit" id="b1" name="b1" title="click to cancel this booking" value="Cancel Ticket" onClick="return check();">
    </form>
    <%
    if(request.getParameter("b1")!=null){
    try{
        PreparedStatement ps2=con.prepareStatement("delete from bookedseat where id='"+name+"' and date='"+date+"' and timeslot='"+movietime+"'");
        ps2.executeUpdate(); 
    }catch(Exception e){
    out.print(e);
    }
    %>
    
    
    </td>
    <%
    
}
out.print("</tr>");
i=i+1;
}
}
}
catch(Exception ex){
out.print(ex);
}

}
%>
  </tbody>
</table>
</div>
  </div>
    </body>
    <jsp:include page="footer.jsp" />
</html>
