<%
    if(session.getAttribute("login") != "OK"){
        response.sendRedirect("Login.jsp");
    }
%>
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
            .container {
                margin: 0;
                padding: 0;
                width: 100%;
                height: 50px;
                display: grid;
                grid-template-columns: 35% 50% 10%;
                grid-gap: 0px; /* Espacio entre las columnas */
            }
            #h1 {
                text-align: center;
            }
        </style>
    </head>
    <body>
        <br>
        <div>
            <h1 id="h1">Formulario Ventas</h1>
        </div>
        <div class="container">
            <div></div>
            <div>
                <form class="row g-3">
                    <input type="hidden" name="id_venta" value="${ventas.id_venta}">
                    <input type="hidden" name="id_producto" value="${ventas.id_producto}">
                    <input type="hidden" name="id_cliente" value="${ventas.id_cliente}">
                    <div class="mb-3">
                    <label for="-" class="form-label">Cliente</label>
                    <select name="cliente_id" class="form-control">
                        <option value="">--Seleccione--</option>
                        <c:forEach var="item" items="${lista_clientes}">
                            <option value="${item.id}" 
                                    <c:if test="${ventas.id_cliente == item.id}">
                                        selected
                                    </c:if>
                                        >${item.nombre}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="-" class="form-label">Producto</label>
                    <select name="producto_id" class="form-control">
                        <option value="">--Seleccione--</option>
                        <c:forEach var="item" items="${lista_productos}">
                            <option value="${item.id}"
                                    <c:if test="${ventas.id_producto == item.id}">
                                        selected
                                    </c:if>>${item.nombre}</option>
                        </c:forEach>
                    </select>
                </div>
                    <div class="col-12">
                        <label for="inputAddress" class="form-label">Cantidad</label>
                        <input type="text" class="form-control" name="cantidad" value="${ventas.cantidad}" placeholder="Ingrese la cantidad">
                    </div>
                    <div class="col-12">
                        <label for="inputEmail4" class="form-label">Fecha</label>
                        <input type="text" class="form-control" name="fecha" value="${ventas.fecha}" placeholder="Ingrese la fecha">
                    </div>
                    <div class="col-12">
                        <button type="submit" class="btn btn-primary">Enviar</button>
                        <a href="VentaControlador" style="float: right;" class="btn btn-danger">Cancelar</a>
                    </div>
                </form>
            </div>
            <div></div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    </body>
</html>
