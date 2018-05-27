<%@page import="java.util.ArrayList"%>
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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="crud.css">

    <title>Jugadores y sus clubes de La Liga BBVA - José Antonio Ruiz Mostazo</title>
  </head>
  <body id="modifica">
    <% request.setCharacterEncoding("UTF-8"); %>
    <div class="container">
      <br><br>
      <div class="panel panel-warning">
        <div class="panel-heading panel text-center">Modificación de competición</div>
          <form method="get" action="grabaCompeticionModificado.jsp">
            <div id="champion"></div>
            <div class="form-group"> 
              <label>&nbsp;&nbsp;Código de Compite:&nbsp;</label><input type="text" size="5" name="CodComp" value="<%= request.getParameter("CodComp") %>" readonly>
            </div>
            <div class="form-group">
              <label>&nbsp;&nbsp;Nombre de competición:&nbsp;</label>
              <%
                  ArrayList<String> nombre = new ArrayList();
                  nombre.add("Liga BBVA");
                  nombre.add("Copa del Rey");
                  nombre.add("UEFA Champions League");
                  nombre.add("UEFA Europa League");
                  nombre.add("Supercopa de Europa");
                  nombre.add("Supercopa de España");
                  nombre.add("Mundialito de Clubes");
                  nombre.add("Trofeo Santiago Bernabeu");
                  nombre.add("Trofeo Joan Gamper");
                %>
                
                <select name="NomComp">
                    <%
                      for (String n : nombre) {
                        out.println("<option>" + n + "</option>");
                      }
                    %>  
                </select>
            </div>
            <div class="form-group">
                <% String NomEqui = request.getParameter("NomEqui"); %>
              <label>&nbsp;&nbsp;Equipo:&nbsp;</label><select name="CodEqui"><option value="<%= request.getParameter("CodEqui") %>"><%=NomEqui%></option>
                <%
                  Class.forName("com.mysql.jdbc.Driver");
                  Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3399/clubes","root", "");
                  Statement s = conexion.createStatement();

                  ResultSet listado = s.executeQuery ("SELECT CodEqui, NomEqui FROM equipo");
                  
                  while(listado.next()) {
                    
                    out.println("<option value=" + listado.getString("CodEqui") + ">" + listado.getString("NomEqui") + "</option>");  
                  }
                  
                  conexion.close();
                 %>
              
            </select>
            </div>
            <hr>
            &nbsp;&nbsp;<a href="competiciones.jsp" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span>Cancelar</a>
            <button type="submit" class="btn btn-info"><span class="glyphicon glyphicon-ok"></span>Aceptar</button><br><br>
          </form>

      </div>
      <div class="text-center">&copy; José Antonio Ruiz Mostazo</div>
    </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>
