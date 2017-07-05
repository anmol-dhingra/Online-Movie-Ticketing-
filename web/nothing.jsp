<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" >
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking</title>
<p id="demo"></p>
<script>  
var seatsselected;
var request;
var count=0;
function fun(){
    alert("hello");
}
function sendInfo(num)  
{
//  
var arraystr = seatsselected.join("-");
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
document.getElementById('amit').innerHTML=val;  
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
            alert("Deselected");
            
            delete map[seat];
           
        }
        else
        {
             count=count+1;
            alert("selected");
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
//                 var x=confirm("Hello User you have selected "+seatsselected+" Do you wanna Book??");
//                 if(x==true)
//                     return true;
//                 else
//                     return false;
             }
function sendIn(num)  
{ 
var arraystr = seatsselected.join("-");
var v=document.vin.comm.value;  
var url="index1.jsp?val="+arraystr;  

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
document.getElementById('am').innerHTML=val;  
}  
}     


</script></head>
    <body>
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
           String time_slot="";
            try{    
                if(mySession.getAttribute("time_slot")!=null)
                {
                    time_slot=(String)mySession.getAttribute("time_slot");
                   
                }
                else
                {
                %><script>alert("You have not selected a time slot");</script><%
                    //response.sendRedirect("homepage.jsp");
                }
			Class.forName("com.mysql.jdbc.Driver");	
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/multiplex","root","");
			st=con.createStatement();
                        rs=st.executeQuery("select seatno from book");
		while(rs.next()){
                    booked.put((rs.getString(1)),1);
                }
	
		}
            catch(Exception e)
		{
                    out.print(e);
                } 
               // st1=con.createStatement();
//                rs1=st1.executeQuery("select seatno from book");
//            String moviename="",rating="",language="";
//                if(rs1.next())
//                {
//                    moviename=rs1.getString(1);
//                    rating=rs1.getString(5);
//                    language=rs1.getString(3);
//                    }
             
%>            
<form role="form" name="vinform" id="form1">
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
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="K<%=i%>" onClick="setColor('K<%=i%>'); seatInfo('K<%=i%>'); print(); sendInfo('K<%=i%>');"></td>
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
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="J<%=i%>" onClick="setColor('J<%=i%>'); sendInfo('J<%=i%>');seatInfo('J<%=i%>')"></td>
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
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="I<%=i%>" onClick="setColor('I<%=i%>'); sendInfo('I<%=i%>');seatInfo('I<%=i%>')"></td>
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
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="H<%=i%>" onClick="setColor('H<%=i%>'); sendInfo('H<%=i%>');seatInfo('H<%=i%>')"></td>
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
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="H<%=i%>" onClick="setColor('H<%=i%>'); sendInfo('H<%=i%>');seatInfo('H<%=i%>')"></td>
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
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="H<%=i%>" onClick="setColor('H<%=i%>'); sendInfo('H<%=i%>');seatInfo('H<%=i%>')"></td>
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
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="G<%=i%>" onClick="setColor('G<%=i%>'); sendInfo('G<%=i%>');seatInfo('G<%=i%>')"></td>
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
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="G<%=i%>" onClick="setColor('G<%=i%>'); sendInfo('G<%=i%>');seatInfo('G<%=i%>')"></td>
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
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="G<%=i%>" onClick="setColor('G<%=i%>'); sendInfo('G<%=i%>');seatInfo('G<%=i%>')"></td>
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
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="F<%=i%>" onClick="setColor('F<%=i%>'); sendInfo('F<%=i%>');seatInfo('F<%=i%>')"></td>
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
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="F<%=i%>" onClick="setColor('F<%=i%>'); sendInfo('F<%=i%>');seatInfo('F<%=i%>')"></td>
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
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="F<%=i%>" onClick="setColor('F<%=i%>'); sendInfo('F<%=i%>');seatInfo('F<%=i%>')"></td>
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
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="E<%=i%>" onClick="setColor('E<%=i%>'); sendInfo('E<%=i%>');seatInfo('E<%=i%>')"></td>
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
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="E<%=i%>" onClick="setColor('E<%=i%>'); sendInfo('E<%=i%>');seatInfo('E<%=i%>')"></td>
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
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="E<%=i%>" onClick="setColor('E<%=i%>'); sendInfo('E<%=i%>');seatInfo('E<%=i%>')"></td>
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
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="D<%=i%>" onClick="setColor('D<%=i%>'); sendInfo('D<%=i%>');seatInfo('D<%=i%>')"></td>
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
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="D<%=i%>" onClick="setColor('D<%=i%>'); sendInfo('D<%=i%>');seatInfo('D<%=i%>')"></td>
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
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="D<%=i%>" onClick="setColor('D<%=i%>'); sendInfo('D<%=i%>');seatInfo('D<%=i%>')"></td>
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
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="C<%=i%>" onClick="setColor('C<%=i%>'); sendInfo('C<%=i%>');seatInfo('C<%=i%>')"></td>
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
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="C<%=i%>" onClick="setColor('C<%=i%>'); sendInfo('C<%=i%>');seatInfo('C<%=i%>')"></td>
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
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="C<%=i%>" onClick="setColor('C<%=i%>'); sendInfo('C<%=i%>');seatInfo('C<%=i%>')"></td>
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
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="B<%=i%>" onClick="setColor('B<%=i%>'); sendInfo('B<%=i%>');seatInfo('B<%=i%>')"></td>
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
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="B<%=i%>" onClick="setColor('B<%=i%>'); sendInfo('B<%=i%>');seatInfo('B<%=i%>')"></td>
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
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="A<%=i%>" onClick="setColor('A<%=i%>'); sendInfo('A<%=i%>');seatInfo('A<%=i%>')"></td>
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
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="A<%=i%>" onClick="setColor('A<%=i%>'); sendInfo('A<%=i%>');seatInfo('A<%=i%>')"></td>
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
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn btn-default" name="comment" value="<%=i%>" id="A<%=i%>" onClick="setColor('A<%=i%>'); sendInfo('A<%=i%>');seatInfo('A<%=i%>')"></td>
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
                </div>
</div>
</div>
            <span id="amit"> </span>  
    <div class="col-lg-4">    
       <br><br><br><br><br><br><br><br>
       <button class="btn btn-success">Seat No</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-default">Seat No</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-danger disabled">Seat No</button><br>
       <h4>  <b>Seat Selected&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seat Available&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seat Booked</b></h4><br>
       <div class="panel panel-default"> 
       
         <div class="panel-content">
             <div class="panel-body">
                 <form name="vin">
       <input type="button" class="btn btn-primary" id="Book" value="Book Now" name="comm" onClick=" print(); sendIn('12')">
         </form>
                 <span id="am"> </span>
             </div>
         <div class="panel-footer">
             </div>
         </div>
        </div>
</div>

         
    </body>
    
</html>