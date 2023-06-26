<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <title>Pagina Base</title>
        <style>
            /* Estilos generales del sidebar */
            .sidebar {
                width: 200px;
                height: 100%;
                background-color: #333;
                color: #fff;
                padding: 10px;
                border-radius: 10px;
            }

            /* Estilos para los enlaces del sidebar */
            .sidebar a {
                color: #fff;
                text-decoration: none;
                display: block;
                margin-bottom: 10px;
            }

            /* Estilos para los enlaces activos del sidebar */
            .sidebar a.active {
                font-weight: bold;
            }
            .container {
                margin: 0;
                padding: 0;
                width: 100%;
                height: 100%;
                display: grid;
                grid-template-columns: 1fr 89%;
                grid-gap: 0px; /* Espacio entre las columnas */
            }
            .containerX {
                margin: 0;
                padding: 0;
                width: 100%;
                height: 50px;
                display: grid;
                grid-template-columns: 1fr 3fr 1fr;
                grid-gap: 0px; /* Espacio entre las columnas */
            }
            .container > div {
                margin: 0;
                padding: 0;
                width: 100%;
                height: 100%;
            }
            .container div {
                padding: 5px; /* Espacio interno alrededor del contenido */
            }
            body {
                margin: 0;
                padding: 0;
            }
            .titulo2 {
                color: #ffffff;
                background-color: #36393F;
                text-align: center;
                padding: 10px;
                border-radius: 10px;
            }
            .hn {
                display: flex;
                justify-content: center;
                align-items: flex-end;
                height: 15vh; /* Ajusta la altura según tus necesidades */
            }
            .h1{
                color: #ffffff;
                background-color: #36393F;
                padding: 10px;
                border-radius: 10px;
            }
        </style>
    </head>
    <body>
        <div class="containerX">
            <div><img src="https://www.upea.bo/assets/img_institucion/ins_logo_1607438579.png" width="80" height="80"></div>
            <div class="hn"><h1 class="h1">SISTEMA DE INVENTARIO</h1></div>
            <div><img src="https://inscripcionessistemas.upea.bo/assets/frontend/educomp/v2.1/images/escudo.png" width="80" height="80" style="float: right;"></div>
        </div>
        <br><br>
        <div class="container">
            <div class="left-div">
                <div class="sidebar">
                    <h2>Menú</h2>
                    <a href="#" class="active">Inicio</a>
                    <a href="#">Acerca de</a>
                    <a href="#">Servicios</a>
                    <a href="#">Contacto</a>
                </div>
            </div>
            <div class="right-div">
                <div> 
                    <h2 class="titulo2">Tienda de Productos de Limpieza CleanMaster</h2>  
                </div>

                <jsp:include page="META-INF/menu.jsp">
                    <jsp:param name="opcion" value="clientes" />
                </jsp:include>
                <br>
                <a href="#" class="btn btn-primary btn-sm"><i class="fa-solid fa-circle-plus"></i> Nuevo </a>
                <br><br>
                <table class="table table-dark table-striped">
                    <tr align="center">
                        <th>Id</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>CI</th>
                        <th>Correo</th>
                        <th>Celular</th>
                        <th></th>
                        <th></th>
                    </tr>
                    <c:forEach var="item" items="${clientes}">
                        <tr align="center">
                            <td>${item.id}</td>
                            <td>${item.nombre}</td>
                            <td>${item.apellido}</td>
                            <td>${item.ci}</td>
                            <td>${item.correo}</td>
                            <td>${item.celular}</td>
                            <td><a href="ClienteControlador?action=edit&id=${item.id}"><i class="fa-regular fa-pen-to-square"></i></a></td>
                            <td><a href="ClienteControlador?action=delete&id=${item.id}" onclick="return(confirm('Esta Seguro de eliminar???'))">
                                    <i class="fa-regular fa-trash-can"></i>
                                </a>
                            </td>
                        </tr> 
                    </c:forEach>
                </table>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    </body>
</html>
