# JSP-CRUD-II

Gestión de jugadores y clubes de la Liga BBVA y sus competiciones.

## Introducción

Este crud permite al usuario ver los jugadores de la liga BBVA y sus equipos, pudiendo dar de alta nuevos jugadores,
modificar los jugadores existentes y borrar cualquier jugador. También se ha añadido la mejora de poder ver, modificar y borrar competiciones que juegan los equipos.

## Base de datos

La base de datos está compuesta por las tablas:

* Jugadores: jugadores de la liga BBVA, que se podrán añadir, modificar y borrar.

* Equipo: equipos de la liga BBVA.

* Compite: competiciones nacionales e internacionales, que se podrán añadir, modificar y borrar.

<img width="520px" src="/capturas/bbdd.png">

## Login

Se accede al crud mediante un login con filtro de usuarios y contraseñas controlados por un hashMap

<img width="820px" src="/capturas/login.png">

## Página principal (Elección de jugadores o competiciones)

En este caso elegiremos competiciones, ya que es la parte que se ha añadido al anterior CRUD-JSP que solo mostraba la parte de jugadores.

<img width="820px" src="/capturas/principal.png">

## Competiciones

Nos muestra el listado de los nombres de las competiciones y qué equipo participa en ella.

<img width="820px" src="/capturas/competiciones.png">

## Añadir competición

<img width="820px" src="/capturas/añadircompeticion.png">

## Competición añadida correctamente

<img width="820px" src="/capturas/añadidacorrectamente.png">

## Error al añadir competición

Si intentamos añadir una competición con un Código de compite (CodComp) ya existente, nos muestra el siguiente error.

<img width="820px" src="/capturas/añadidoerror.png">

## Muestra competición añadida

Podemos comprobar al final de la tabla que la competición se ha añadido correctamente

<img width="820px" src="/capturas/muestracompeticionañadido.png">

## Modificar competición

<img width="820px" src="/capturas/modificarcompeticion.png">

## Competición modificada correctamente

<img width="820px" src="/capturas/modificadocorrectamente.png">

## Borrar competición

<img width="820px" src="/capturas/borrarcompeticion.png">

## Competición borrada correctamente

<img width="820px" src="/capturas/borradocorrectamente.png">
