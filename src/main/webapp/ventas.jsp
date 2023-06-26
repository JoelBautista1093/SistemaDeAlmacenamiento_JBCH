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
    </head>
    <body>
        <div class="container">
            <br>
            <div>
                <img src="https://www.upea.bo/assets/img_institucion/ins_logo_1607438579.png" width="80" height="80">

                <img src="https://inscripcionessistemas.upea.bo/assets/frontend/educomp/v2.1/images/escudo.png" width="70" height="70" style="float: right;">
            </div>
            <div>
                <h1 style="text-align: center;">SISTEMA DE INVENTARIO</h1> 
                <h2 style="text-align: center;">Tienda de Productos de Limpieza CleanMaster</h2> 
            </div>
            
            <br>
            <jsp:include page="META-INF/menu.jsp">
                <jsp:param name="opcion" value="ventas" />
            </jsp:include>
            <br>
            <a href="#" class="btn btn-primary btn-sm"><i class="fa-solid fa-circle-plus"></i> Nuevo </a>
            <br><br>
            <table class="table table-dark table-striped">
                <tr>
                    <th>Id</th>
                    <th>Cliente</th>
                    <th>Producto</th>
                    <th>Fecha</th>
                    <th>Cantidad</th>
                    <th>Precio</th>
                    <th>Costo Total Venta</th>
                    <th></th>
                    <th></th>
                </tr>
                <c:forEach var="item" items="${ventas}">
                    <tr>
                        <td>${item.id_venta}</td>
                        <td>${item.cliente}</td>
                        <td>${item.producto}</td>
                        <td>${item.fecha}</td>
                        <td>${item.cantidad}</td>
                        <td>${item.precio}</td>
                        <td>${item.precio_total}</td>
                        <td><a href="VentaControlador?action=edit&id=${item.id_venta}"><i class="fa-regular fa-pen-to-square"></i></a></td>
                        <td><a href="VentaControlador?action=delete&id=${item.id_venta}" onclick="return confirm('Esta Segurrooo?')"><i class="fa-regular fa-trash-can"></i></a></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    </body>
</html>
