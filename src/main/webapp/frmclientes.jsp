<!DOCTYPE html>
<html>
<head>
  <title>Sidebar Genérico - Tema Oscuro</title>
  <style>
    /* Estilos generales del sidebar */
    .sidebar {
      width: 250px;
      height: 100vh;
      background-color: #333;
      color: #fff;
      padding: 20px;
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
  </style>
</head>
<body>
  <div class="sidebar">
    <h2>Menú</h2>
    <a href="#" class="active">Inicio</a>
    <a href="#">Acerca de</a>
    <a href="#">Servicios</a>
    <a href="#">Contacto</a>
  </div>
</body>
</html>
