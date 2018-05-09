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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"  crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"  crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"  crossorigin="anonymous"></script>
    <link rel="stylesheet" href="crud.css">
        <title>Jugadores y sus clubes de La Liga BBVA - José Antonio Ruiz Mostazo</title>
    </head>
    <body id="jugadores">
		<div class="container">
			<br><br>			
      <div class="panel panel-warning">
        <div class="panel-heading text-center"><h2>Competiciones y sus clubes de la Liga BBVA</h2></div>
        <%
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3399/clubes","root", "");
          Statement s = conexion.createStatement();

          ResultSet listado = s.executeQuery ("SELECT * FROM compite INNER JOIN equipo ON compite.CodEqui = equipo.CodEqui");
        %>

        <table class="table table-striped table table-condensed">
        <form method="get" action="grabaCompeticion.jsp">
          <tr><td><input type="text" name="CodComp" size="5"></td>
              <td>   
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
              </td>
              <td><select name="CodEqui">
                <option value="0"></option>  
                <option value="1">1-Real Madrid</option>
                <option value="2">2-F.C. Barcelona</option>
                <option value="3">3-Sevilla F.C.</option>
                <option value="4">4-Valencia C.F.</option>
                <option value="5">5-Atl. Madrid</option>
                <option value="6">6-Málaga C.F.</option>
                <option value="7">7-Alavés C.F.</option>
                <option value="8">8-Leganés F.C.</option>
                <option value="9">9-Betis F.C.</option>
                <option value="10">10-Getafe C.F.</option>
                <option value="11">11-R.C. Deportivo</option>
                <option value="12">12-C.D. Celta</option>
                <option value="13">13-Real Sociedad</option>
                <option value="14">14-Ath. Bilbao</option>
                <option value="15">15-R.C.D Español</option>
                <option value="16">16-Eibar</option>
                <option value="17">17-U.D Levante</option>
                <option value="18">18-Girona</option>
                <option value="19">19-Villarreal</option>
                <option value="20">20-Las Palmas</option>
              </select></td>
              
              <td><button type="submit" value="Añadir" class="btn btn-success"><span class="glyphicon glyphicon-plus"></span> Añadir</button></td><td></td></tr>           
          <td><div id="logo"></div></td>
        </form>
        <tr><th>Código compite</th><th>Nombre competición</th><th>Código equipo</th><th>Nombre Equipo</th></tr>
        
        <%
          while (listado.next()) {
            out.println("<tr><td>");
            out.println(listado.getString("CodComp") + "</td>");
            out.println("<td>" + listado.getString("NomComp") + "</td>");
            out.println("<td>" + listado.getString("CodEqui") + "</td>");
            out.println("<td>" + listado.getString("NomEqui") + "</td>");
        %>
        <td>
            <form method="get" action="modificaCompeticion.jsp">
              <input type="hidden" name="CodComp" value="<%=listado.getString("CodComp") %>">  
              <input type="hidden" name="NomComp" value="<%=listado.getString("NomComp") %>">
              <input type="hidden" name="CodEqui" value="<%=listado.getString("CodEqui") %>">
                <button type="submit"  class="btn btn-warning"><span class="glyphicon glyphicon-pencil"></span></button>
            </form>
        </td>
	
        <td>
        <form method="get" action="borraCompeticion.jsp">
          <input type="hidden" name="CodComp" value="<%=listado.getString("CodComp") %>"/>
          <button type="submit" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span></button>
        </form>
        </td></tr>
        
        <%
          } // while

          conexion.close();
        %>
        
        </table>
      </div>
      <div class="text-center">&copy; José Antonio Ruiz Mostazo</div>
    </div>
        <a href="paginaPrincipal.jsp" class="btn btn-primary"><span class="glyphicon glyphicon-home"></span> Página Principal</button>
        <a href="jugadores.jsp" class="btn btn-warning"><span class=""></span> Jugadores</button>
        <a href="index.jsp" class="btn btn-danger"><span class=""></span> Logout</button>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    </body>
</html>
