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
                <img src="https://www.upea.bo/assets/img_institucion/ins_logo_1607438579.png" width="130" height="130">

                <img src="https://inscripcionessistemas.upea.bo/assets/frontend/educomp/v2.1/images/escudo.png" width="120" height="120" style="float: right;">
            </div>
            <div>
                <h1 style="text-align: center;">SISTEMA DE INVENTARIO</h1> 
                <h2 style="text-align: center;">Tienda de Productos de Limpieza CleanMaster</h2> 
            </div>
            
            <br>
            <jsp:include page="META-INF/menu.jsp">
                <jsp:param name="opcion" value="productos" />
            </jsp:include>
            <br>
            <a href="#" class="btn btn-primary btn-sm"><i class="fa-solid fa-circle-plus"></i> Nuevo </a>
            <br><br>
            <table class="table table-dark table-striped">
                <tr>
                    <th>Id</th>
                    <th>Nombre</th>
                    <th>Descripción</th>
                    <th>Precio</th>
                    <th></th>
                    <th></th>
                </tr>
                <tr>
                    <td>1</td>
                    <td>Tablet</td>
                    <td>Note 25</td>
                    <td>1500</td>
                    <td><a href="#"><i class="fa-regular fa-pen-to-square"></i></a></td>
                    <td><a href="#"><i class="fa-regular fa-trash-can"></i></a></td>
                </tr>
            </table>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    </body>
</html>
