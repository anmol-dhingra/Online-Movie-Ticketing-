package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.text.*;
import java.util.*;
import java.sql.*;

public final class displayhistory_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("  \n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("        <head>\n");
      out.write("\n");
      out.write("    <style>\n");
      out.write("        #b1{\n");
      out.write("            background:#ddd;\n");
      out.write("            border-color: while;\n");
      out.write("            border: none;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css\">\n");
      out.write("  <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js\"></script>\n");
      out.write("  <script src=\"http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js\"></script>\n");
      out.write("        <title>Transaction History</title>\n");
      out.write("    <script>\n");
      out.write("function check(){\n");
      out.write("    var x=confirm(\"Confirmation: Cancel the ticket??\");\n");
      out.write("    if(x==true)\n");
      out.write("        return true;\n");
      out.write("    else\n");
      out.write("        return false;\n");
      out.write("}\n");
      out.write("function back(){\n");
      out.write("    a= document.getElemtById('b1');\n");
      out.write("    a.backgroundColor=\"grey\";\n");
      out.write("} \n");
      out.write("    function fun()\n");
      out.write("{\n");
      out.write("   ");

     DateFormat dateFormat = new SimpleDateFormat("HH:mm");
     DateFormat myformat=new SimpleDateFormat("yyyy-MM-dd");
     Calendar cal = Calendar.getInstance();
     Calendar cal2=Calendar.getInstance();
     cal2.add(Calendar.DATE,1);
     String currTime=dateFormat.format(cal.getTime());
     String currDate=myformat.format(cal.getTime());
     String tomarrow=myformat.format(cal2.getTime());
   
      out.write("    \n");
      out.write(" }\n");
      out.write("</script>\n");
      out.write("    </head>\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.jsp", out, false);
      out.write("\n");
      out.write("    <body onload=\"fun()\">s\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <div class=\"jumbotron\">\n");
  
HttpSession mySession=request.getSession(false);  
String name=(String)mySession.getAttribute("loginid");
String movietime,date;

      out.write("\n");
      out.write("<form>\n");
      out.write("<input type=\"submit\" class = \"btn btn-default btn-success\" name=\"history\" id=\"history\" align=\"right\" style=\"background: none;color:black\" value=\"Booking History\"> \n");
      out.write("</form>\n");

if(request.getParameter("history")!=null){
try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/multiplex","root","");  
PreparedStatement ps=con.prepareStatement("select date,timeslot,count(timeslot) from bookedseat where name='"+name+"' group by date, timeslot");
ResultSet rs=ps.executeQuery();  

      out.write("\n");
      out.write("<table class=\"table table-hover table-inverse\">\n");
      out.write("  <thead class=\"thead-inverse\">\n");
      out.write("    <tr>\n");
      out.write("      <th>SNo</th>\n");
      out.write("      <th>Movie Date</th>\n");
      out.write("      <th>Movie Time</th>\n");
      out.write("      <th>No of seats Booked</th>\n");
      out.write("      <th>Status</th>\n");
      out.write("    </tr>\n");
      out.write("  </thead>\n");
      out.write("  <tbody>\n");

int i=1;
while(rs.next()){
date=rs.getString(1);
movietime=rs.getString(2);
out.print("<tr>");
out.print("<th>"+i+"</th>");
out.print("<td>"+date+"</td>");
out.print("<td>"+movietime+"</td>");
out.print("<td>"+rs.getString(3)+"</td>");
if(currDate.compareTo(date)>0){
    out.print("<td>Watched</td>");
}else if(currTime.compareTo(movietime)>0){
    out.print("<td>Watched</td>");
}else{
    //<a onClick="check(); return false;" href="cancel.jsp" title="click to cancel this booking">Cancel Ticket</a>
//    mySession.setAttribute("time_slot",movietime);
//    mySession.setAttribute("date",date);
    
      out.write("\n");
      out.write("    <td>    \n");
      out.write("    <form method=\"post\">\n");
      out.write("<input type=\"submit\" id=\"b1\" name=\"b1\" title=\"click to cancel this booking\" value=\"Cancel Ticket\" onClick=\"return check();\">\n");
      out.write("    </form>\n");
      out.write("    ");

    if(request.getParameter("b1")!=null){
    try{
        PreparedStatement ps2=con.prepareStatement("delete from bookedseat where name='"+name+"' and date='"+date+"' and timeslot='"+movietime+"'");
        ps2.executeUpdate(); 
    }catch(Exception e){
    out.print(e);
    }
    
      out.write("\n");
      out.write("    \n");
      out.write("    \n");
      out.write("    </td>\n");
      out.write("    ");

    
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

      out.write("\n");
      out.write("  </tbody>\n");
      out.write("</table>\n");
      out.write("</div>\n");
      out.write("  </div>\n");
      out.write("    </body>\n");
      out.write("    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footer.jsp", out, false);
      out.write("\n");
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
