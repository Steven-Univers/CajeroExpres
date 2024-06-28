<?php 

session_start();

if(!isset($_SESSION['id'])){
    header("Location: ../../index.html");
}

$nombre = $_SESSION['nombre'];
$ap_paterno = $_SESSION['ap_paterno'];

?>




<!doctype html>
<html lang="en">
    <head>
        <title>bienvenida</title>
        <!-- Required meta tags -->
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
        />

        <!-- Bootstrap CSS v5.2.1 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous"/>
        <link rel="stylesheet" href="../../assets/CSS/bienvenida.css">
        <!-- <link rel="preload" href="assets/CSS/styles.css">*/ -->
    </head>

    <body>
        <div class="inicio">
            <h1>Bienvenid@ Usuario 1</h1>
        
            <div class="contenido">
                <a href="../../index.html" class="btn btn-1">Cerrar sesion</a>
                <box-icon name='credit-card'></box-icon>
            </div>
            <div class="contenido">
                <a href="../retiro/index.php" class="btn btn-3">Retiro</a>
                <box-icon name='money-withdraw'></box-icon>
            </div>
            <div class="contenido">
                <a href="../consulta_saldo/index.php" class="btn btn-2">Consultar saldo</a>
                <box-icon type='solid' name='wallet'></box-icon>
            </div>
                
        </div>
        
    </body>
</html>
