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
            
            .sidebar {
                width: 200px;
                height: 100%;
                background-color: #333;
                color: #fff;
                padding: 10px;
                border-radius: 10px;
            }


            .sidebar a {
                color: #fff;
                text-decoration: none;
                display: block;
                margin-bottom: 10px;
            }


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
                grid-gap: 0px; 
            }
            .containerX {
                margin: 0;
                padding: 0;
                width: 100%;
                height: 50px;
                display: grid;
                grid-template-columns: 1fr 3fr 1fr;
                grid-gap: 0px; 
            }
            .container > div {
                margin: 0;
                padding: 0;
                width: 100%;
                height: 100%;
            }
            .container div {
                padding: 5px; 
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
                height: 15vh; 
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
            <div><img src="https://inscripcionessistemas.upea.bo/assets/frontend/educomp/v2.1/images/escudo.png" width="70" height="70" style="float: right;"></div>
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
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    </body>
</html>
