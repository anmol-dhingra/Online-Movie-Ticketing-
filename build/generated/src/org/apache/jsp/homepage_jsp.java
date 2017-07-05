package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class homepage_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/bootstrap.min.css\">\n");
      out.write("        <script src=\"jquery.min.js\"></script>\n");
      out.write("        <script src=\"js/bootstrap.min.js\"></script>\n");
      out.write("        \n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n");
      out.write("        <title>Multiplex</title>\n");
      out.write("        <style>\n");
      out.write("            .nopadding\n");
      out.write("            {\n");
      out.write("                padding:0px;\n");
      out.write("            }\n");
      out.write("            .modal{\n");
      out.write("                overflow-y: auto; \n");
      out.write("            }\n");
      out.write("            .modal-open\n");
      out.write("            {\n");
      out.write("                overflow: auto;\n");
      out.write("              \n");
      out.write("            }\n");
      out.write("          \n");
      out.write("            </style>\n");
      out.write("          <script>\n");
      out.write("$('.modal fade').on('hide.bs.modal', function(e) {    \n");
      out.write("    var $if = $(e.delegateTarget).find('iframe');\n");
      out.write("    var src = $if.attr(\"src\");\n");
      out.write("    $if.attr(\"src\", '/empty.html');\n");
      out.write("    $if.attr(\"src\", src);\n");
      out.write("});\n");
      out.write("\n");
      out.write("</script>\n");
      out.write("    </head>\n");
      out.write("    <body background=\"images/home2.jpg\" >\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.jsp", out, false);
      out.write("\n");
      out.write("        <br><br>\n");
      out.write("        <div id=\"myCarousel\" class=\"carousel slide\" data-ride=\"carousel\" align=\"center\">\n");
      out.write("            <ol class=\"carousel-indicators\" style=\"position:absolute\">\n");
      out.write("            <li data-target=\"#myCarousel\" data-slide-to=\"0\" class=\"active\">   \n");
      out.write("            <li data-target=\"#myCarousel\" data-slide-to=\"1\"></li>\n");
      out.write("            <li data-target=\"#myCarousel\" data-slide-to=\"2\"></li>\n");
      out.write("            <li data-target=\"#myCarousel\" data-slide-to=\"3\"></li>\n");
      out.write("            </ol>\n");
      out.write("        <div class=\"carousel-inner\" role=\"listbox\" align=\"center\" style=\"width: 75%; height:200 !important\">\n");
      out.write("        <div class=\"item active\">\n");
      out.write("        <img src=\"images/mov4.jpg\">\n");
      out.write("        </div>  \n");
      out.write("        <div class=\"item\">\n");
      out.write("            <img src=\"images/mov2.jpg\">\n");
      out.write("                </div>\n");
      out.write("        <div class=\"item\">\n");
      out.write("            <img src=\"images/mov3.jpg\">\n");
      out.write("            </div>\n");
      out.write("        <div class=\"item\">\n");
      out.write("            <img src=\"images/mov1.jpg\">\n");
      out.write("        </div>\n");
      out.write("            </div>\n");
      out.write("            <a class=\"left carousel-control\" href=\"#myCarousel\" role=\"button\" data-slide=\"prev\">\n");
      out.write("    <span class=\"glyphicon glyphicon-chevron-left\" aria-hidden=\"true\"></span>\n");
      out.write("    <span class=\"sr-only\">Previous</span>\n");
      out.write("  </a>\n");
      out.write("  <a class=\"right carousel-control\" href=\"#myCarousel\" role=\"button\" data-slide=\"next\">\n");
      out.write("    <span class=\"glyphicon glyphicon-chevron-right\" aria-hidden=\"true\"></span>\n");
      out.write("    <span class=\"sr-only\">Next</span>\n");
      out.write("  </a>\n");
      out.write("       </div>\n");
      out.write("     \n");
      out.write("        <br/>\n");
      out.write("        <br/>\n");
      out.write("        <nav class=\"nav nav-tabs\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("               <ul class=\"nav nav-tabs\">\n");
      out.write("               <li><a data-toggle=\"tab\" href=\"#now-showing\" class=\"active\">Now Showing</a><li>\n");
      out.write("               <li><a data-toggle=\"tab\" href=\"#comingsoon\">Coming Soon</a></li>\n");
      out.write("               </ul>\n");
      out.write("            </div>\n");
      out.write("        </nav>\n");
      out.write("        <div class=\"tab-content\">\n");
      out.write("   \n");
      out.write("        <!--Now Showing tab-->\n");
      out.write("        ");

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
        
      out.write("\n");
      out.write("        <div id=\"now-showing\"  class=\"tab-pane fade in active\">\n");
      out.write("            <br> <br>\n");
      out.write("           <div class=\"row\">\n");
      out.write("               <div class=\"col-lg-3\">\n");
      out.write("                <div class=\"panel panel-default col-sm-10 col-lg-11 col-md-11 \" style=\" left: 50px\">\n");
      out.write("                    <div class=\"panel panel-title\" style=\"height:50px\"><h4><strong>");
      out.print(name[0] );
      out.write("</strong></h4></div>\n");
      out.write("                    <div class=\"panel-body\">\n");
      out.write("                    <img src=\"images/mov1.jpg\" class=\"img-thumbnail\" style=\" width:230px;height:250px; \">\n");
      out.write("                    </div>\n");
      out.write("                    \n");
      out.write("                <div class=\"panel panel-footer panel-success\" >\n");
      out.write("                <form><a class = \"btn btn-default btn-success glyphicon \" style=\"padding: 10px;background: none;color: black\" data-toggle=\"modal\" data-target=\"#Youtube1\"><span class=\"glyphicon glyphicon-play\"></span></a>&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("                <input  type=\"submit\" class=\"btn btn-default btn-success\" style=\"background: none;color:black\" name=\"audi1\" value=\"Book now\"> </form>\n");
      out.write("                    ");

                        
                        if(request.getParameter("audi1")!=null)
                        {
                            HttpSession mySession=request.getSession(false);
                            if(mySession.getAttribute("loginid")==null)
                            {
      out.write("<script>alert(\"You are Not Logged in\");</script>\n");
      out.write("                                ");
}
                            else
                                {
                                  mySession.setAttribute("audino","Audi1");
                                  response.sendRedirect("book_audi.jsp");
                    } 
                    }
                         
                    
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                     <div class=\"col-lg-3\">\n");
      out.write("                 <div class=\"panel panel-default col-sm-10 col-lg-11 col-md-10 \" style=\" left: 25px\">\n");
      out.write("                    <div class=\"panel panel-title\" style=\"height:50px\"><h4><strong>");
      out.print(name[1] );
      out.write("</strong></h4></div>\n");
      out.write("                    <div class=\"panel-body\">\n");
      out.write("                    <img src=\"images/mov2.jpg\" class=\"img-thumbnail\" style=\" width:230px;height:250px;\">\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"panel panel-footer\" >\n");
      out.write("                    <form><a class = \"btn btn-default btn-success glyphicon \" style=\"padding: 10px;background: none;color: black\" data-toggle=\"modal\" data-target=\"#Youtube2\"><span class=\"glyphicon glyphicon-play\"></span></a>&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("                    <input class = \"btn btn-default btn-success\" style=\"background: none;color:black\" name=\"audi2\" type=\"submit\" value=\"Book Now\"> </form>\n");
      out.write("                    </div>\n");
      out.write("                    ");

                        
                        if(request.getParameter("audi2")!=null)
                        {
                            HttpSession mySession=request.getSession(false);
                            if(mySession.getAttribute("loginid")==null)
                            {
      out.write("<script>alert(\"You are Not Logged in\");</script>\n");
      out.write("                                ");
}
                            else
                                {
                                  mySession.setAttribute("audino","Audi2");
                                  response.sendRedirect("book_audi.jsp");
                    } 
                    }
                         
                    
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                      <div class=\"col-lg-3\">\n");
      out.write("                <div class=\"panel panel-default col-sm-10 col-lg-11 col-md-10 \" style=\" left: 10px\">\n");
      out.write("                    <div class=\"panel panel-title\" style=\"height:50px\"><h4><strong>");
      out.print(name[2] );
      out.write("</strong></h4></div>\n");
      out.write("                    <div class=\"panel-body\">\n");
      out.write("                    <img src=\"images/mov3.jpg\" class=\"img-thumbnail\" style=\" width:230px;height:250px; \">\n");
      out.write("                    </div>\n");
      out.write("                    \n");
      out.write("                    <div class=\"panel panel-footer panel-success\" >\n");
      out.write("                    <form><a class = \"btn btn-default btn-success glyphicon \" style=\"padding: 10px;background: none;color: black\" data-toggle=\"modal\" data-target=\"#Youtube3\"><span class=\"glyphicon glyphicon-play\"></span></a>&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("                    <input type=\"submit\" class = \"btn btn-default btn-success\" name=\"audi3\" align=\"right\" style=\"background: none;color:black\" value=\"Book Now\"></form>\n");
      out.write("                    </div>\n");
      out.write("                    ");

                        
                        if(request.getParameter("audi3")!=null)
                        {
                            HttpSession mySession=request.getSession(false);
                            if(mySession.getAttribute("loginid")==null)
                            {
      out.write("<script>alert(\"You are Not Logged in\");</script>\n");
      out.write("                                ");
}
                            else
                                {
                                  mySession.setAttribute("audino","Audi3");
                                  response.sendRedirect("book_audi.jsp");
                    } 
                    }
                         
                    
      out.write("\n");
      out.write("                </div>\n");
      out.write("                </div>\n");
      out.write("                  <div class=\"col-lg-3\">\n");
      out.write("                <div class=\"panel panel-default col-sm-10 col-lg-11 col-md-10 \" >\n");
      out.write("                    <div class=\"panel panel-title\" style=\"height:50px\"><h4><strong>");
      out.print(name[3] );
      out.write("</strong></h4></div>\n");
      out.write("                    <div class=\"panel-body\">\n");
      out.write("                    <img src=\"images/mov4.jpg\" class=\"img-thumbnail\" style=\" width:230px;height:250px; \">\n");
      out.write("                    </div>\n");
      out.write("                    \n");
      out.write("                    <div class=\"panel panel-footer panel-success\" >\n");
      out.write("                   <form><a class = \"btn btn-default btn-success glyphicon \" style=\"padding: 10px;background: none;color: black\" data-toggle=\"modal\" data-target=\"#Youtube4\"><span class=\"glyphicon glyphicon-play\"></span></a>&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("                    <input type=\"submit\" class = \"btn btn-default btn-success\" name=\"audi4\" style=\"background: none;color:black\" value=\"Book Now\"></form>\n");
      out.write("                    </div>\n");
      out.write("                    ");

                        
                        if(request.getParameter("audi4")!=null)
                        {
                            HttpSession mySession=request.getSession(false);
                            if(mySession.getAttribute("loginid")==null)
                            {
      out.write("<script>alert(\"You are Not Logged in\");</script>\n");
      out.write("                                ");
}
                            else
                                {
                                  mySession.setAttribute("audino","Audi4");
                                  response.sendRedirect("book_audi.jsp");
                    } 
                    }
                         
                    
      out.write("\n");
      out.write("                </div>\n");
      out.write("                </div>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("            <div id=\"Youtube1\" class=\"modal fade\" role=\"dialog\">\n");
      out.write("                <div class=\"modal-dialog\">\n");
      out.write("                    <div class=\"modal-content\">   \n");
      out.write("                    <div class=\"modal-header\">\n");
      out.write("                            <div class=\"modal-title\">\n");
      out.write("                            <h4><i>Trailer</i></h4>\n");
      out.write("                          </div>\n");
      out.write("                            </div>\n");
      out.write("                        <div class=\"flex-video\">\n");
      out.write("                              <iframe src=");
      out.print(link[0]);
      out.write(" allowfullscreen=\"allowfullscreen\"  width=\"590\" height=\"400\"></iframe>\n");
      out.write("                        </div>\n");
      out.write("                              <div class=\"modal-footer\">\n");
      out.write("                        <button class=\"btn btn-default\" align=\"right\" data-dismiss=\"modal\">Close</button>  \n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("             </div>\n");
      out.write("            </div>\n");
      out.write("        <div id=\"Youtube2\" class=\"modal fade\" role=\"dialog\">\n");
      out.write("                <div class=\"modal-dialog\">\n");
      out.write("                    <div class=\"modal-content\">   \n");
      out.write("                    <div class=\"modal-header\">\n");
      out.write("                            <div class=\"modal-title\">\n");
      out.write("                            <h4><i>Trailer</i></h4>\n");
      out.write("                          </div>\n");
      out.write("                            </div>\n");
      out.write("                              <iframe src=");
      out.print(link[1]);
      out.write(" allowfullscreen=\"allowfullscreen\"  width=\"590\" height=\"400\"></iframe>\n");
      out.write("                    <div class=\"modal-footer\">\n");
      out.write("                        <button class=\"btn btn-default\" align=\"right\" data-dismiss=\"modal\">Close</button>  \n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("             </div>\n");
      out.write("            </div>\n");
      out.write("        <div id=\"Youtube3\" class=\"modal fade\" role=\"dialog\">\n");
      out.write("                <div class=\"modal-dialog\">\n");
      out.write("                    <div class=\"modal-content\">   \n");
      out.write("                    <div class=\"modal-header\">\n");
      out.write("                            <div class=\"modal-title\">\n");
      out.write("                            <h4><i>Trailer</i></h4>\n");
      out.write("                          </div>\n");
      out.write("                            </div>\n");
      out.write("                              <iframe src=");
      out.print(link[2]);
      out.write(" allowfullscreen=\"allowfullscreen\"  width=\"590\" height=\"400\"></iframe>\n");
      out.write("                    <div class=\"modal-footer\">\n");
      out.write("                        <button class=\"btn btn-default\" align=\"right\" data-dismiss=\"modal\">Close</button>  \n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("             </div>\n");
      out.write("            </div>\n");
      out.write("        <div id=\"Youtube4\" class=\"modal fade\" role=\"dialog\">\n");
      out.write("                <div class=\"modal-dialog\">\n");
      out.write("                    <div class=\"modal-content\">   \n");
      out.write("                    <div class=\"modal-header\">\n");
      out.write("                            <div class=\"modal-title\">\n");
      out.write("                            <h4><i>Trailer</i></h4>\n");
      out.write("                          </div>\n");
      out.write("                            </div>\n");
      out.write("                              <iframe src=");
      out.print(link[3]);
      out.write(" allowfullscreen=\"allowfullscreen\"  width=\"590\" height=\"400\"></iframe>\n");
      out.write("                    <div class=\"modal-footer\">\n");
      out.write("                        <button class=\"btn btn-default\" align=\"right\" data-dismiss=\"modal\">Close</button>  \n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("             </div>\n");
      out.write("            </div>\n");
      out.write("        <!--coming soon-->\n");
      out.write("        <div id=\"comingsoon\" class=\"tab-pane fade\">\n");
      out.write("            <br> <br>\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-lg-3\">\n");
      out.write("                <div class=\"panel panel-default col-sm-10 col-lg-11 col-md-11 \" style=\" left: 50px\">\n");
      out.write("                    <div class=\"panel panel-title\" style=\"height:50px\"><h4><strong>Tutak Tutak Tutiya</strong></h4></div>\n");
      out.write("                    <div class=\"panel-body\">\n");
      out.write("                    <img src=\"images/2mov1.jpg\" class=\"img-thumbnail\" style=\" width:230px;height:250px; \">\n");
      out.write("                    </div>\n");
      out.write("                <div class=\"panel panel-footer panel-success\" >\n");
      out.write("                <form><a class = \"btn btn-default btn-success glyphicon \" style=\"padding: 10px;background: none;color: black\" data-toggle=\"modal\" data-target=\"#Youtube5\"><span class=\"glyphicon glyphicon-play\"></span></a>&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("                \n");
      out.write("                    </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                     \n");
      out.write("            </div>\n");
      out.write("       </div>\n");
      out.write("        <div id=\"Youtube5\" class=\"modal fade\" role=\"dialog\">\n");
      out.write("                <div class=\"modal-dialog\">\n");
      out.write("                    <div class=\"modal-content\">   \n");
      out.write("                    <div class=\"modal-header\">\n");
      out.write("                            <div class=\"modal-title\">\n");
      out.write("                            <h4><i>Trailer</i></h4>\n");
      out.write("                          </div>\n");
      out.write("                            </div>\n");
      out.write("                              <iframe src=\"http://www.youtube.com/embed/d6C9vO6YRm8\" allowfullscreen=\"allowfullscreen\"  width=\"590\" height=\"400\"></iframe>\n");
      out.write("                    <div class=\"modal-footer\">\n");
      out.write("                        <button class=\"btn btn-default\" align=\"right\" data-dismiss=\"modal\">Close</button> \n");
      out.write("                        <h4>Release Date:7 October</h4>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("             </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <br/>\n");
      out.write("        <br/>\n");
      out.write("        \n");
      out.write("        <br/>\n");
      out.write("        <br/>\n");
      out.write("        <br/>\n");
      out.write("        <br/>\n");
      out.write("        <br/>\n");
      out.write("        <br/>\n");
      out.write("        <br/>\n");
      out.write("        <br/>\n");
      out.write("        <br/>\n");
      out.write("        <br/>\n");
      out.write("        <br/>\n");
      out.write("        <div style=\"position: fixed; right: 0px; top: 90%; width: 5; height: 5;\">\n");
      out.write("            <a href=\"adminlogin.jsp\" class=\"btn primary\">\n");
      out.write("  <img src=\"images/admin.jpg\" class=\"pull-left\" width =\"50\" height=\"50\" style=\"opacity:0.6\"/>\n");
      out.write("</a>\n");
      out.write("        </div>\n");
      out.write("         ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footer.jsp", out, false);
      out.write("\n");
      out.write("       \n");
      out.write("    </body>\n");
      out.write("   \n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
