<?php 

session_start();

if(!isset($_SESSION['id'])){
    header("Location: ../../index.html");
}
?>

<!doctype html>
<html lang="es">

<head>
    <title>Retiro</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <!-- Bootstrap CSS v5.2.1 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
    <!-- CSS -->
    <link rel="stylesheet" href="../../assets/CSS/retiro.css">
    <!-- FONTS -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
        rel="stylesheet">
    <!-- ICONOS -->
</head>

<body class="body">
    <header>
        <nav class="navbar">
            <div>
                <a class="nombre_banco">Cajero Express | Banco Nacional de Mexico</a>
            </div>
        </nav>
    </header>
    <main>
        <div>
            <h1 class="titulo_consulta">Retiro</h1>
        </div>
        <div>
            <h2 class="saldo">$50,000.00</h2>
            <h6 class="dispobinle">Saldo dispobinle</h6>
        </div>
        <div class="contenedor">
            <button class="btn btn btn-retiro">$50</button>
            <button class="btn btn btn-retiro">$100</button>
            <button class="btn btn btn-retiro">$200</button>
            <button class="btn btn btn-retiro">$500</button>
        </div>
        <div class="contenedor_2">
            <form action="update.php" method="post">
                <input name="monto" class="otra_cantidad" type="text" placeholder="Ingrese otra cantidad">
                <button type="submit" class="btn btn-otra_cantidad">Enviar</button>
            </form>

        </div>
        <div>
            <a class="btn btn-3" href="../bienvenida/index.php">Regresar al menú</a>
        </div>
    </main>
    <footer>
        <!-- place footer here -->
    </footer>
    <!-- Bootstrap JavaScript Libraries -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
        integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
        crossorigin="anonymous"></script>
</body>

</html>