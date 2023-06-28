<%
    if(session.getAttribute("login") != "OK"){
        response.sendRedirect("Login.jsp");
    }
%>
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
            <h1 id="h1">Formulario Usuarios</h1>
        </div>
        <div class="container">
            <div></div>
            <div>
                <form class="row g-3" method="post">
                    <input type="hidden" name="id" value="${usuario.id}">
                    <div class="col-12">
                        <label for="inputAddress" class="form-label">Nombre</label>
                        <input type="text" class="form-control" name="nombre" value="${usuario.nombre}" placeholder="Ingrese su nombre">
                    </div>
                    <div class="col-12">
                        <label for="inputAddress" class="form-label">Apellido</label>
                        <input type="text" class="form-control" name="apellido" value="${usuario.apellido}" placeholder="Ingrese su apellido">
                    </div>
                    <div class="col-12">
                        <label for="inputAddress" class="form-label">Celular</label>
                        <input type="text" class="form-control" name="celular" value="${usuario.celular}" placeholder="Ingrese su celular">
                    </div>
                    <div class="col-12">
                        <label for="inputEmail4" class="form-label">Carnet</label>
                        <input type="text" class="form-control" name="ci" value="${usuario.ci}" placeholder="Ingrese su numero de carnet">
                    </div>
                    <div class="col-12">
                        <label for="inputAddress" class="form-label">Email</label>
                        <input type="email" class="form-control" name="correo" value="${usuario.correo}" placeholder="Ingrese su Correo">
                    </div>
                    <div class="col-12">
                        <label for="inputAddress" class="form-label">Contraseña</label>
                        <input type="password" class="form-control" name="password" value="${usuario.password}" placeholder="Ingrese su Contraseña">
                    </div>
                    <div class="col-12">
                        <button type="submit" class="btn btn-primary">Enviar</button>
                        <a href="UsuarioControlador" style="float: right;" class="btn btn-danger">Cancelar</a>
                    </div>
                </form>
            </div>
            <div></div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    </body>
</html>
