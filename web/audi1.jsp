
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
         <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        <script>
    function setColor(btn) {
        var property = document.getElementById(btn);
     
        if (window.getComputedStyle(property,null).getPropertyValue("background-color")=="rgb(230, 230, 230)"||window.getComputedStyle(property,null).getPropertyValue("background-color")=="rgb(255, 255, 255)") {
             property.style.backgroundColor = "#00fA9A";
        }
        else {
           property.style.backgroundColor = "#FFFFFF";
        }
    }
    var map={};
    function seatinfo(seat)
    {
        if(seat in map)
        {
            alert("Deselected");
            delete map[seat];
        }
        else
        {
            alert("Selected");
            map[seat]=1;
        }
    }
             function print()
             {
                 var seatsselected=new Array();
                 for(var key in map)
                 {
                     seatsselected.push(key);
                 }
                 alert(seatsselected);
             }
             </script>
        <style>
            .btn.btn-default
            {
                background-color: #FFFFFF;
            }
            </style>
    </head>
    <body>
        <jsp:includepage="header.jsp" />
       <div class="jumbotron row">
       <div class="panel panel-default col-lg-9">
             <div class="panel-heading">
           <h3>Audi1</h3>    
           </div>
           <div class="panel-content">
           <div class="panel-body">
           <table>
               
               <!--Seats Alignment-->
               <tr><td colspan="20" align="center"><h4><strong>Gold Class(&#8377 250)</strong></h4></td></tr>
               <tr>
                <td><h4>K</h4></td>
             <%
                 for(int i=1;i<=20;i++)
                     
                 {%>
                 <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button type="submit" name="comment" value=<%=i%> class="btn btn-default" id="K<%=i%>" onClick="setColor('K<%=i%>');seatinfo('K<%=i%>')"><%=i%></button></td>
                   <%}%>
                </tr>
                <br/>
                <tr>
                   <td> <h4>J</h4></td>
             <%
                 for(int i=1;i<=20;i++)
                 {%>
               <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn btn-default" id="J<%=i%>" onClick="setColor('J<%=i%>')"><%=i%></button></td>
                   <%}%>
                </tr>
                <tr>
                    <td><h4>I</h4></td>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn btn-default" id="I1" onClick="setColor('I1')">1</button></td>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn btn-default" id="I2" onClick="setColor('I2')">2</button></td>
                    <td></td><td></td>
                    <%
                    for(int i=3;i<=14;i++)
                    {
                    %>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn btn-default" id="I<%=i%>" onClick="setColor('I<%=i%>')"><%=i%></button></td>
                    <%}%>
                    <td></td><td></td>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn btn-default" id="I15" onClick="setColor('I15')">15</button></td>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn btn-default" id="I16" onClick="setColor('I16')">16</button></td>
                </tr>
                <tr>
                    <td><h4>H</h4></td>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn btn-default" id="H1" onClick="setColor('H1')">1</button></td>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn btn-default" id="H2" onClick="setColor('H2')">2</button></td>
                    <td></td><td></td>
                    <%
                    for(int i=3;i<=14;i++)
                    {
                    %>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn btn-default" id="H<%=i%>" onClick="setColor('H<%=i%>')"><%=i%></button></td>
                    <%}%>
                    <td></td><td></td>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn btn-default" id="H15" onClick="setColor('H15')">15</button></td>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn btn-default" id="H16" onClick="setColor('H16')">16</button></td>
                </tr>
                <tr>
                    <td><h4>G</h4></td>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn btn-default" id="G1" onClick="setColor('G1')">1</button></td>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn btn-default" id="G2" onClick="setColor('G2')">2</button></td>
                    <td></td><td></td>
                    <%
                    for(int i=3;i<=14;i++)
                    {
                    %>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn btn-default" id="G<%=i%>" onClick="setColor('G<%=i%>')"><%=i%></button></td>
                    <%}%>
                    <td></td><td></td>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn btn-default" id="G15" onClick="setColor('G15')">15</button></td>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn btn-default" id="G16" onClick="setColor('G16')">16</button></td>
                </tr>
                <tr><td colspan="20" align="center"><h4><strong>Silver Class(&#8377 220)</strong></h4></td></tr>
            <tr>
                    <td><h4>F</h4></td>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn btn-default" id="F1" onClick="setColor('F1')">1</button></td>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn btn-default" id="F2" onClick="setColor('F2')">2</button></td>
                    <td></td><td></td>
                    <%
                    for(int i=3;i<=14;i++)
                    {
                    %>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn btn-default" id="F<%=i%>" onClick="setColor('F<%=i%>')"><%=i%></button></td>
                    <%}%>
                    <td></td><td></td>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn btn-default" id="F15" onClick="setColor('F15')">15</button></td>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn btn-default" id="F16" onClick="setColor('F16')">16</button></td>
                </tr>
                <tr>
                    <td><h4>E</h4></td>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn btn-default" id="E1" onClick="setColor('E1')">1</button></td>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn btn-default" id="E2" onClick="setColor('E2')">2</button></td>
                    <td></td><td></td>
                    <%
                    for(int i=3;i<=14;i++)
                    {
                    %>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn btn-default" id="E<%=i%>" onClick="setColor('E<%=i%>')"><%=i%></button></td>
                    <%}%>
                    <td></td><td></td>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn btn-default" id="E15" onClick="setColor('E15')">15</button></td>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn btn-default" id="E16" onClick="setColor('E16')">16</button></td>
                </tr>
                <tr>
                    <td><h4>D</h4></td>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn btn-default" id="D1" onClick="setColor('D1')">1</button></td>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn btn-default" id="D2" onClick="setColor('D2')">2</button></td>
                    <td></td><td></td>
                    <%
                    for(int i=3;i<=14;i++)
                    {
                    %>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn btn-default" id="D<%=i%>" onClick="setColor('D<%=i%>')"><%=i%></button></td>
                    <%}%>
                    <td></td><td></td>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn btn-default" id="D15" onClick="setColor('D15')">15</button></td>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn btn-default" id="D16" onClick="setColor('D16')">16</button></td>
                </tr>
                <tr>
                    <td><h4>C</h4></td>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn btn-default" id="C1" onClick="setColor('C1')">1</button></td>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn btn-default" id="C2" onClick="setColor('C2')">2</button></td>
                    <td></td><td></td>
                    <%
                    for(int i=3;i<=14;i++)
                    {
                    %>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn btn-default" id="C<%=i%>" onClick="setColor('C<%=i%>')"><%=i%></button></td>
                    <%}%>
                    <td></td><td></td>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn btn-default" id="C15" onClick="setColor('C15')">15</button></td>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn btn-default" id="C16" onClick="setColor('C16')">16</button></td>
                </tr>
                <tr>
                    <td><h4>B</h4></td>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn btn-default" id="B1" onClick="setColor('B1')">1</button></td>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn btn-default" id="B2" onClick="setColor('B2')">2</button></td>
                    <td></td><td></td>
                    <%
                    for(int i=3;i<=14;i++)
                    {
                    %>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn btn-default" id="B<%=i%>" onClick="setColor('B<%=i%>')"><%=i%></button></td>
                    <%}%>
                    <td></td><td></td>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn btn-default" id="B15" onClick="setColor('B15')">15</button></td>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn btn-default" id="B16" onClick="setColor('B16')">16</button></td>
                </tr>
                <tr>
                    <td><h4>A</h4></td>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn btn-default" id="A1" onClick="setColor('A1')">1</button></td>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn btn-default" id="A2" onClick="setColor('A2')">2</button></td>
                    <td></td><td></td>
                    <%
                    for(int i=3;i<=14;i++)
                    {
                    %>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn btn-default" id="A<%=i%>" onClick="setColor('A<%=i%>')"><%=i%></button></td>
                    <%}%>
                    <td></td><td></td>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn btn-default" id="A15" onClick="setColor('A15')">15</button></td>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn btn-default" id="A16" onClick="setColor('A16')">16</button></td>
                </tr>
             <tr><td colspan="20" align="center"><h4><strong>Screen This Way</strong></h4></td></tr>
                <tr><td><button class="btn btn-success">Entry</button></td><td></td><td></td><td colspan="16"><hr style="color:yellow;background-color:#4169E1;height: 3px;width:100%"></td><td></td><td><button class="btn btn-danger">Exit</button></td></tr>
           </table>
        </div>
       </div>
       </div>
           </div>
            <jsp:includepage="footer.jsp" />
    </body>
</html>
