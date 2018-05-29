<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"  crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"  crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"  crossorigin="anonymous"></script>
    <link rel="stylesheet" href="crud.css">

    <title>Jugadores y sus clubes de La Liga BBVA - José Antonio Ruiz Mostazo</title>
  </head>
  <body id="correcto">
    <%
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3399/clubes","root", "");
      Statement s = conexion.createStatement();

      request.setCharacterEncoding("UTF-8");
      
      String actualizacion = "UPDATE compite SET "
                           + "NomComp='" + request.getParameter("NomComp")
                           + "', CodEqui=" + Integer.valueOf(request.getParameter("CodEqui"))
                           + " WHERE CodComp=" + Integer.valueOf(request.getParameter("CodComp"));
      s.execute(actualizacion);
       %>
      <div class="margin"><span class="textomensaje">competición actualizada correctamente</span></div>
      <%
      
      conexion.close();
    %>
    <br>
    <a href="competiciones.jsp" class="btn btn-primary"><span class=""></span> Volver a competiciones</button>
    <div id="copa"></div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>