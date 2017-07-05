<%-- 
    Document   : seatbook
    Created on : 9 Jul, 2016, 3:38:16 PM
    Author     : Lenovo
--%>

<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" >
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Audi 1</title>
<p id="demo"></p>
<script>  
var request;
var res="";
var seatsselected;
var finalseats;
var count=0;

function sendInfo(num)  
{
var arraystr = seatsselected.join(" ");
var v=document.vinform.comment.value;
var url="index.jsp?val="+arraystr+"&count="+count;
  
if(window.XMLHttpRequest){  
request=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try  
{  
request.onreadystatechange=getInfo;  
request.open("GET",url,true);  
request.send();  
}  
catch(e)  
{  
alert("Unable to connect to server");  
}  
}  
  
function getInfo(){  
if(request.readyState==4){  
var val=request.responseText;  
document.getElementById('myShow').innerHTML=val;  
}  
} 

function setColor(btn) {
        var property = document.getElementById(btn);
     
        if (window.getComputedStyle(property,null).getPropertyValue("background-color")=="rgb(230, 230, 230)"||window.getComputedStyle(property,null).getPropertyValue("background-color")=="rgb(255, 255, 255)") {
             property.style.backgroundColor = "#5cb85c";
        }
        else {
           property.style.backgroundColor = "#FFFFFF";
        }
}
        var map={};
    function seatInfo(seat)
    {
        if(seat in map)
        {
            count=count-1;
            delete map[seat];
        }
        else
        {
            count=count+1;
            map[seat]=1;
        }
    }
     function print()
             {
                 seatsselected=new Array();
                 for(var key in map)
                 {
                     seatsselected.push(key);
                 }
             }
function check()
{
    finalseats=new Array();
    for(var key in map)
    {
        finalseats.push(key);
    }
    document.getElementById("urlstring").value=finalseats;
      if(count>0) 
                       var x=confirm("Hello User you have selected "+seatsselected+" Do you want to Book??");
                   else
                       alert("Please select a seat!!");
                if(x==true&&count>0)
                   return true;
               else
                   return false;
}

</script></head>
    <body>
     <jsp:includepage="header.jsp" />
      <div class="jumbotron col-lg-8">
       <div class="panel panel-default">
        <div class="panel-heading">
       <label><b> Audi 1 </b></label>
       </div>
        <div class="panel-body">

<%
            Connection con=null;
           Statement st,st1;
	   ResultSet rs,rs1;
           HashMap<String,Integer> booked=new HashMap<String,Integer>();
            HttpSession mySession=request.getSession(false);
           String time_slot="",date="";
           
            try{    
                if(mySession.getAttribute("time_slot")!=null&&mySession.getAttribute("date")!=null)
                {
                    time_slot=(String)mySession.getAttribute("time_slot");
                    date=(String)mySession.getAttribute("date");
                  
                }
                else
                {
                    response.sendRedirect("homepage.jsp");
                }
			Class.forName("com.mysql.jdbc.Driver");	
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/multiplex","root","");
			st=con.createStatement();
                        rs=st.executeQuery("select seatno from bookedseat where audino='Audi1' and timeslot='"+time_slot+"' and date='"+date+"'");
		while(rs.next()){
                    booked.put((rs.getString(1)),1);
                }
	
		}
            catch(Exception e)
		{
                    out.print(e);
                } 
                st1=con.createStatement();
                rs1=st1.executeQuery("Select * from moviesdetail where title=(select name from nowshowing where audi='Audi1')");
            String moviename="",rating="",language="";
                if(rs1.next())
                {
                    moviename=rs1.getString(1);
                    rating=rs1.getString(5);
                    language=rs1.getString(3);
                    }
             
%>            
<form name="vinform" id="form1">
<table>
               <tr><td colspan="20" align="center"><h4><strong>Gold Class(&#8377 250)</strong></h4></td></tr>
               <tr>
                <td><h4>K</h4></td>
             <%
                 
                 for(int i=1;i<=20;i++)
                 {
                 String a=Integer.toString(i);
                 if(booked.containsKey("K"+a))
                 {
                     %>
                     <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-danger disabled" name="comment" value="<%=i%>" id="K<%=i%>"></td>
                 <%
                 }
                else{
                %>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="K<%=i%>" onClick="setColor('K<%=i%>');seatInfo('K<%=i%>');print(); sendInfo('K<%=i%>');"></td>
                 <%
                    }
                 } 
                 %>   
                </tr>
                <br/>
                <tr>
                <td><h4>J</h4></td>
             <%
                 
                 for(int i=1;i<=20;i++)
                 {
                 String a=Integer.toString(i);
                 if(booked.containsKey("J"+a))
                 {
                     %>
                     <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-danger disabled" name="comment" value="<%=i%>" id="J<%=i%>" ></td>
                 <%
                 }
                else{
                %>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="J<%=i%>" onClick="setColor('J<%=i%>');seatInfo('J<%=i%>');print(); sendInfo('J<%=i%>');"></td>
                 <%
                    }
                 } 
                 %>   
                </tr>
                <tr>
                <td><h4>I</h4></td>
             <%
                 
                 for(int i=1;i<=20;i++)
                 {
                 String a=Integer.toString(i);
                 if(booked.containsKey("I"+a))
                 {
                     %>
                     <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-danger disabled" name="comment" value="<%=i%>" id="I<%=i%>"></td>
                 <%
                 }
                else{
                %>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="I<%=i%>" onClick="setColor('I<%=i%>');seatInfo('I<%=i%>');print(); sendInfo('I<%=i%>')"></td>
                 <%
                    }
                 } 
                 %>   
                </tr>
                <tr>
                <td><h4>H</h4></td>
             <%
                 
                 for(int i=1;i<=2;i++)
                 {
                 String a=Integer.toString(i);
                 if(booked.containsKey("H"+a))
                 {
                     %>
                     <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-danger disabled" name="comment" value="<%=i%>" id="K<%=i%>" ></td>
                 <%
                 }
                else{
                %>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="H<%=i%>" onClick="setColor('H<%=i%>');seatInfo('H<%=i%>');print(); sendInfo('H<%=i%>');"></td>
                 <%
                    }
                 } 
                 %>   
                <td></td><td></td>
               
             <%
                 
                 for(int i=3;i<=14;i++)
                 {
                 String a=Integer.toString(i);
                 if(booked.containsKey("H"+a))
                 {
                     %>
                     <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-danger disabled" name="comment" value="<%=i%>" id="H<%=i%>" ></td>
                 <%
                 }
                else{
                %>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="H<%=i%>" onClick="setColor('H<%=i%>');seatInfo('H<%=i%>');print(); sendInfo('H<%=i%>');"></td>
                 <%
                    }
                 } 
                 %>   
                <td></td><td></td>
                <%
                 
                 for(int i=15;i<=16;i++)
                 {
                 String a=Integer.toString(i);
                 if(booked.containsKey("H"+a))
                 {
                     %>
                     <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-danger disabled" name="comment" value="<%=i%>" id="H<%=i%>"></td>
                 <%
                 }
                else{
                %>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="H<%=i%>" onClick="setColor('H<%=i%>'); seatInfo('H<%=i%>');print(); sendInfo('H<%=i%>');"></td>
                 <%
                    }
                 } 
                 %>                   
                </tr>
                
                <tr>
                <td><h4>G</h4></td>
             <%
                 
                 for(int i=1;i<=2;i++)
                 {
                 String a=Integer.toString(i);
                 if(booked.containsKey("G"+a))
                 {
                     %>
                     <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-danger disabled" name="comment" value="<%=i%>" id="G<%=i%>" ></td>
                 <%
                 }
                else{
                %>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="G<%=i%>" onClick="setColor('G<%=i%>');seatInfo('G<%=i%>');print(); sendInfo('G<%=i%>');"></td>
                 <%
                    }
                 } 
                 %>   
                <td></td><td></td>
               
             <%
                 
                 for(int i=3;i<=14;i++)
                 {
                 String a=Integer.toString(i);
                 if(booked.containsKey("G"+a))
                 {
                     %>
                     <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-danger disabled" name="comment" value="<%=i%>" id="G<%=i%>" "></td>
                 <%
                 }
                else{
                %>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="G<%=i%>" onClick="setColor('G<%=i%>');seatInfo('G<%=i%>');print(); sendInfo('G<%=i%>');"></td>
                 <%
                    }
                 } 
                 %>   
                <td></td><td></td>
                <%
                 
                 for(int i=15;i<=16;i++)
                 {
                 String a=Integer.toString(i);
                 if(booked.containsKey("G"+a))
                 {
                     %>
                     <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-danger disabled" name="comment" value="<%=i%>" id="G<%=i%>" ></td>
                 <%
                 }
                else{
                %>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="G<%=i%>" onClick="setColor('G<%=i%>');seatInfo('G<%=i%>');print(); sendInfo('G<%=i%>');"></td>
                 <%
                    }
                 } 
                 %>                   
                </tr>
                
                <tr><td colspan="20" align="center"><h4><strong>Silver Class(&#8377 220)</strong></h4></td></tr>
            <tr>
                <td><h4>F</h4></td>
             <%
                 
                 for(int i=1;i<=2;i++)
                 {
                 String a=Integer.toString(i);
                 if(booked.containsKey("F"+a))
                 {
                     %>
                     <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-danger disabled" name="comment" value="<%=i%>" id="F<%=i%>" ></td>
                 <%
                 }
                else{
                %>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="F<%=i%>" onClick="setColor('F<%=i%>'); seatInfo('F<%=i%>');print(); sendInfo('F<%=i%>');"></td>
                 <%
                    }
                 } 
                 %>   
                <td></td><td></td>
               
             <%
                 
                 for(int i=3;i<=14;i++)
                 {
                 String a=Integer.toString(i);
                 if(booked.containsKey("F"+a))
                 {
                     %>
                     <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-danger disabled" name="comment" value="<%=i%>" id="F<%=i%>" ></td>
                 <%
                 }
                else{
                %>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="F<%=i%>" onClick="setColor('F<%=i%>'); seatInfo('F<%=i%>');print(); sendInfo('F<%=i%>');"></td>
                 <%
                    }
                 } 
                 %>   
                <td></td><td></td>
                <%
                 
                 for(int i=15;i<=16;i++)
                 {
                 String a=Integer.toString(i);
                 if(booked.containsKey("F"+a))
                 {
                     %>
                     <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-danger disabled" name="comment" value="<%=i%>" id="F<%=i%>" ></td>
                 <%
                 }
                else{
                %>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="F<%=i%>" onClick="setColor('F<%=i%>');seatInfo('F<%=i%>');print(); sendInfo('F<%=i%>');"></td>
                 <%
                    }
                 } 
                 %>                   
                </tr>
                
                <tr>
                <td><h4>E</h4></td>
             <%
                 
                 for(int i=1;i<=2;i++)
                 {
                 String a=Integer.toString(i);
                 if(booked.containsKey("E"+a))
                 {
                     %>
                     <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-danger disabled" name="comment" value="<%=i%>" id="E<%=i%>" ></td>
                 <%
                 }
                else{
                %>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="E<%=i%>" onClick="setColor('E<%=i%>');seatInfo('E<%=i%>');print(); sendInfo('E<%=i%>');"></td>
                 <%
                    }
                 } 
                 %>   
                <td></td><td></td>
               
             <%
                 
                 for(int i=3;i<=14;i++)
                 {
                 String a=Integer.toString(i);
                 if(booked.containsKey("E"+a))
                 {
                     %>
                     <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-danger disabled" name="comment" value="<%=i%>" id="E<%=i%>" ></td>
                 <%
                 }
                else{
                %>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="E<%=i%>" onClick="setColor('E<%=i%>');seatInfo('E<%=i%>');print(); sendInfo('E<%=i%>');"></td>
                 <%
                    }
                 } 
                 %>   
                <td></td><td></td>
                <%
                 
                 for(int i=15;i<=16;i++)
                 {
                 String a=Integer.toString(i);
                 if(booked.containsKey("E"+a))
                 {
                     %>
                     <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-danger disabled" name="comment" value="<%=i%>" id="E<%=i%>" ></td>
                 <%
                 }
                else{
                %>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="E<%=i%>" onClick="setColor('E<%=i%>');seatInfo('E<%=i%>');print(); sendInfo('E<%=i%>');"></td>
                 <%
                    }
                 } 
                 %>                   
                </tr>
                
                <tr>
                <td><h4>D</h4></td>
             <%
                 
                 for(int i=1;i<=2;i++)
                 {
                 String a=Integer.toString(i);
                 if(booked.containsKey("D"+a))
                 {
                     %>
                     <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-danger disabled" name="comment" value="<%=i%>" id="D<%=i%>" ></td>
                 <%
                 }
                else{
                %>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="D<%=i%>" onClick="setColor('D<%=i%>');seatInfo('D<%=i%>');print(); sendInfo('D<%=i%>');"></td>
                 <%
                    }
                 } 
                 %>   
                <td></td><td></td>
               
             <%
                 
                 for(int i=3;i<=14;i++)
                 {
                 String a=Integer.toString(i);
                 if(booked.containsKey("D"+a))
                 {
                     %>
                     <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-danger disabled" name="comment" value="<%=i%>" id="D<%=i%>" ></td>
                 <%
                 }
                else{
                %>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="D<%=i%>" onClick="setColor('D<%=i%>');seatInfo('D<%=i%>');print(); sendInfo('D<%=i%>');"></td>
                 <%
                    }
                 } 
                 %>   
                <td></td><td></td>
                <%
                 
                 for(int i=15;i<=16;i++)
                 {
                 String a=Integer.toString(i);
                 if(booked.containsKey("D"+a))
                 {
                     %>
                     <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-danger disabled" name="comment" value="<%=i%>" id="D<%=i%>" ></td>
                 <%
                 }
                else{
                %>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="D<%=i%>" onClick="setColor('D<%=i%>');seatInfo('D<%=i%>');print(); sendInfo('D<%=i%>');"></td>
                 <%
                    }
                 } 
                 %>                   
                </tr>
                
                <tr>
                <td><h4>C</h4></td>
             <%
                 
                 for(int i=1;i<=2;i++)
                 {
                 String a=Integer.toString(i);
                 if(booked.containsKey("C"+a))
                 {
                     %>
                     <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-danger disabled" name="comment" value="<%=i%>" id="C<%=i%>"></td>
                 <%
                 }
                else{
                %>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="C<%=i%>" onClick="setColor('C<%=i%>');seatInfo('C<%=i%>');print(); sendInfo('C<%=i%>');"></td>
                 <%
                    }
                 } 
                 %>   
                <td></td><td></td>
               
             <%
                 
                 for(int i=3;i<=14;i++)
                 {
                 String a=Integer.toString(i);
                 if(booked.containsKey("C"+a))
                 {
                     %>
                     <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-danger disabled" name="comment" value="<%=i%>" id="C<%=i%>" ></td>
                 <%
                 }
                else{
                %>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="C<%=i%>" onClick="setColor('C<%=i%>');seatInfo('C<%=i%>');print(); sendInfo('C<%=i%>');"></td>
                 <%
                    }
                 } 
                 %>   
                <td></td><td></td>
                <%
                 
                 for(int i=15;i<=16;i++)
                 {
                 String a=Integer.toString(i);
                 if(booked.containsKey("C"+a))
                 {
                     %>
                     <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-danger disabled" name="comment" value="<%=i%>" id="C<%=i%>" "></td>
                 <%
                 }
                else{
                %>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="C<%=i%>" onClick="setColor('C<%=i%>'); seatInfo('C<%=i%>');print();sendInfo('C<%=i%>');"></td>
                 <%
                    }
                 } 
                 %>                   
                </tr>
                <tr>
                <td><h4>B</h4></td>
             <%
                 
                 for(int i=1;i<=2;i++)
                 {
                 String a=Integer.toString(i);
                 if(booked.containsKey("B"+a))
                 {
                     %>
                     <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-danger disabled" name="comment" value="<%=i%>" id="B<%=i%>" "></td>
                 <%
                 }
                else{
                %>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="B<%=i%>" onClick="setColor('B<%=i%>');seatInfo('B<%=i%>');print(); sendInfo('B<%=i%>');"></td>
                 <%
                    }
                 } 
                 %>   
                <td></td><td></td>
               
             <%
                 
                 for(int i=3;i<=14;i++)
                 {
                 String a=Integer.toString(i);
                 if(booked.containsKey("B"+a))
                 {
                     %>
                     <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-danger disabled" name="comment" value="<%=i%>" id="B<%=i%>"></td>
                 <%
                 }
                else{
                %>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="B<%=i%>" onClick="setColor('B<%=i%>'); sendInfo('B<%=i%>');seatInfo('B<%=i%>')"></td>
                 <%
                    }
                 } 
                 %>   
                <td></td><td></td>
                <%
                 
                 for(int i=15;i<=16;i++)
                 {
                 String a=Integer.toString(i);
                 if(booked.containsKey("B"+a))
                 {
                     %>
                     <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-danger disabled" name="comment" value="<%=i%>" id="B<%=i%>" ></td>
                 <%
                 }
                else{
                %>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="B<%=i%>" onClick="setColor('B<%=i%>');seatInfo('B<%=i%>');print(); sendInfo('B<%=i%>');"></td>
                 <%
                    }
                 } 
                 %>                   
                </tr>
                <tr>
                <td><h4>A</h4></td>
             <%
                 
                 for(int i=1;i<=2;i++)
                 {
                 String a=Integer.toString(i);
                 if(booked.containsKey("A"+a))
                 {
                     %>
                     <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-danger disabled" name="comment" value="<%=i%>" id="A<%=i%>" ></td>
                 <%
                 }
                else{
                %>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="A<%=i%>" onClick="setColor('A<%=i%>');seatInfo('A<%=i%>');print(); sendInfo('A<%=i%>');"></td>
                 <%
                    }
                 } 
                 %>   
                <td></td><td></td>
               
             <%
                 
                 for(int i=3;i<=14;i++)
                 {
                 String a=Integer.toString(i);
                 if(booked.containsKey("A"+a))
                 {
                     %>
                     <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-danger disabled" name="comment" value="<%=i%>" id="A<%=i%>" ></td>
                 <%
                 }
                else{
                %>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="A<%=i%>" onClick="setColor('A<%=i%>');seatInfo('A<%=i%>');print(); sendInfo('A<%=i%>');"></td>
                 <%
                    }
                 } 
                 %>   
                <td></td><td></td>
                <%
                 
                 for(int i=15;i<=16;i++)
                 {
                 String a=Integer.toString(i);
                 if(booked.containsKey("A"+a))
                 {
                     %>
                     <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-danger disabled" name="comment" value="<%=i%>" id="A<%=i%>" ></td>
                 <%
                 }
                else{
                %>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="A<%=i%>" onClick="setColor('A<%=i%>');seatInfo('A<%=i%>');print(); sendInfo('A<%=i%>');"></td>
                 <%
                    }
                 } 
                 %>                   
                </tr>
             <tr><td colspan="20" align="center"><h4><strong>Screen This Way</strong></h4></td></tr>
                <tr><td><button class="btn btn-success">Entry</button></td><td></td><td></td><td colspan="16"><hr style="color:yellow;background-color:#4169E1;height: 3px;width:100%"></td><td></td><td><button class="btn btn-danger">Exit</button></td></tr>
           </table>
                <br/> 
                </form>
            <span id="amit"> </span>  
            
</div>
</div>
</div>
                        
   <div class=" col-lg-4">
       <br><br><br><br><br><br><br><br>
       <button class="btn btn-success">Seat No</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-default">Seat No</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-danger disabled">Seat No</button><br>
       <h4>  <b>Seat Selected&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seat Available&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seat Booked</b></h4><br>
       <div class="panel panel-default"> 
       <div class="panel-heading"><h3><%out.print("Movie:  "+moviename+"("+rating+")");%></h3><h3><%out.print("Movie Time:  "+time_slot);%></h3></div>
         <div class="panel-content">
             <div class="panel-body" ><div id="myShow"></div></div><br><br><br><br><br><br><br></div>
         <div class="panel-footer">
             <form method="post">
             <input type="hidden" name="urlstring" id="urlstring" value="">
             <input type="submit" class="btn btn-primary" id="Book" value="Book Now" name="Book" onClick="return check();">
         </form>
             <%
                 if(request.getParameter("Book")!=null)
                 {
                     try
                     {
                     String seat=request.getParameter("urlstring");
                     String[] seatno=seat.split(",");
                     int l=seatno.length;
                     Statement myst;
                     myst=con.createStatement();
                     for(int i=0;i<l;i++)
                     {
                         
                         myst.executeUpdate("insert into bookedseat values('"+date+"','Audi1','"+time_slot+"','"+seatno[i]+"')");
                     }
                     mySession.setAttribute("Seats", seat);
                     %><script>window.open("Confirm.jsp")</script><%
                     }
                     catch(Exception e)
                     {
                         out.print(e);
                     }
                }
             %>
         </div>
         </div>
        </div>
        
    </body>
    
</html>