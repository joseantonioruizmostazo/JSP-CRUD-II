<%@page import="java.util.HashMap"%>
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
    <body>
        <%
          HashMap<String, String> login = new HashMap();
          login.put("admin", "admin");
          login.put("user", "user");
          login.put("alumno", "alumno");
          login.put("jose", "123");
          String nombre = request.getParameter("usuario");
          String contraseña = request.getParameter("contrasena");
          if (login.containsKey(nombre)) {
            if (login.get(nombre).equals(contraseña)) {
              session.setAttribute("nombre", nombre);
              response.sendRedirect("paginaPrincipal.jsp");
            } else {
              out.println("<div class='alert alert-warning' role='alert'>Lo siento, la contraseña es incorrecta</div>");
              out.println("<a href='index.jsp' class='btn btn-primary'><span class=''></span> Vuelve a intentarlo </button></a>");
            }
          } else {
            out.println("<div class='alert alert-warning' role='alert'>Lo siento, el usuario no se encuentra en la base de datos</div>");
            out.println("<a href='index.jsp' class='btn btn-primary'><span class=''></span> Vuelve a intentarlo</button></a>");
          }
        %>
       <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    </body>
</html>
