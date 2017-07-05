

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="jumbotron">
            <div class="container">
             <DIV class="col-md-10 col-md-offset-1">
             <DIV class="panel panel-info">
             <div class="panel-heading">
              <strong>Now Showing</strong>
              </SPAN>
            </div>
          <DIV class="panel-body">
            <form method="post" role="form" id="form1" name="form1">
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
                <label>Enter Movie Title</label>
                <input type="text" class="form-control" placeholder="Name" id="moviename" name="moviename" required>
                <span class="helptext"><i>Please enter full title of the movie...</i></span>
                <span id="moviename"></span>
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
        <%
        if(request.getParameter("sub")!=null)
        {
           
            String title=request.getParameter("moviename");
            String selected=request.getParameter("audi");
            %><script>
                alert(<%=selected%>);
            </script><%
                Connection con=null;
                Statement st;
            try{    
			Class.forName("com.mysql.jdbc.Driver");	
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/multiplex","root","");
			st=con.createStatement();
                        st.executeUpdate("INSERT INTO nowshowing (name,audi) VALUES('"+title+"','"+selected+"')");
			
		}catch(Exception e)
		{
                    out.println(e);
		}
        }
            else
{%>
    <script>alert("gotcha");</script><%}%>
                 
            </div>
    </body>
</html>
