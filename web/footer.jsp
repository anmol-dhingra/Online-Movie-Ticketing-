
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <link rel="stylesheet" href="bootstrap.min.css">
        <script src="jquery.min.js"></script>
        <script src="bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        p
        {
          color: white;
        }
        .footer
        {
            display:table;
            padding:15px;
            width: 100%;
        }
        .border-between > [class*='col-']:before {
    background: #e3e3e3;
    bottom: 5px;
    content: " ";
    left: 0;
    position: absolute;
    width: 1px;
    top: 5px;
}
    </style>
    <body>
        <div class="container" style="background-color: black;width:100%">
        <div id="footer">
        <div class="row border-between" >   
        <div class="col-sm-4 mob-accordion">
        <p align="left"><br>
        ABOUT US<br><br>
        LCA(Lights Camera Action) is the Premium Film<br> and retail Entertainment company in India<br>
        The Multiplex has 4 screens with dolby sound.<br>Our Team is dedicated to give the best Movie<br>
        Experience..
        </p>    
        </div>
        
       <div class="col-sm-4">
        <p><br>Follow us<br><br>
            <a href="https://www.facebook.com/LCA-Multiplex-539419769577585/?ref=aymt_homepage_panel" target="_blank"><img src="images/fb.png" height="80" width="80"></a>
            <br><br><br><br></p>
        </div>
                
        <div class="col-sm-4 mob-accordion">
            <p>
                <br>
           COPYRIGHT<br><br>
           © 2016 LCA LTD<br>
           ALL RIGHTS RESERVED<br><br><br><br>
        </p>
        </div>
        </div>
        </div>
        </div>
        </body>
</html>
