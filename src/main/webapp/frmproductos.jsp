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
            <h1 id="h1">Formulario Productos</h1>
        </div>
        <div class="container">
            <div></div>
            <div>
                <form class="row g-3">
                    <input type="hidden" name="id" value="${producto.id}">
                    <div class="col-12">
                        <label for="inputAddress" class="form-label">Nombre</label>
                        <input type="text" class="form-control" name="nombre" value="${producto.nombre}" placeholder="Ingrese el nombre del producto">
                    </div>
                    <div class="col-12">
                        <label for="inputAddress" class="form-label">Marca</label>
                        <input type="text" class="form-control" name="marca" value="${producto.marca}" placeholder="Ingrese la marca">
                    </div>
                    <div class="col-12">
                        <label for="inputAddress" class="form-label">Descripcion</label>
                        <input type="text" class="form-control" name="descripcion" value="${producto.descripcion}" placeholder="Ingrese una breve descripcion">
                    </div>
                    <div class="col-12">
                        <label for="inputEmail4" class="form-label">Categoria</label>
                        <select name="cliente_id" class="form-control">
                            <option value="">--Seleccione--</option>
                            <c:forEach var="item" items="${lista_categorias}">
                                <option value="${item.id_cat}" 
                                            <c:if test="${productos.categoria == item.id_cat}"> 
                                            selected
                                        </c:if>
                                        >${item.descripcion}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-12">
                        
                    </div>
                    <div class="col-12">
                        <label for="inputAddress" class="form-label">Cantidad</label>
                        <input type="text" class="form-control" name="cantidad" value="${producto.cantidad}" placeholder="Ingrese la cantidad de producto">
                    </div>
                    <div class="col-12">
                        <label for="inputAddress" class="form-label">Ubicacion</label>
                        <input type="text" class="form-control" name="ubicacion" value="${producto.ubicacion}" placeholder="Ingrese la ubicacion del producto">
                    </div>
                    <div class="col-12">
                        <button type="submit" class="btn btn-primary">Enviar</button>
                        <a href="ProductoControlador" style="float: right;" class="btn btn-danger">Cancelar</a>
                    </div>
                </form>
            </div>
            <div></div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    </body>
</html>
