<?php
session_start();

include "../../connection/conn.php";

if (isset($_POST['monto']) && isset($_SESSION['id'])) {

    $monto = $_POST['monto'];
    $id_tarjeta = $_SESSION['id'];
    $sql = "SELECT saldo FROM tb_tarjetas WHERE id_tarjeta = '$id_tarjeta'";
    //$sql = "call cajero.sp_buscarSaldo('$id_tarjeta')";
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $saldo_actual = $row['saldo'];

        if ($saldo_actual >= $monto) {
            $saldo_nuevo = $saldo_actual - $monto;

            $sql_update = "UPDATE tb_tarjetas SET saldo = '$saldo_nuevo' WHERE id_tarjeta = '$id_tarjeta'";
            //$sql_update = "call cajero.sp_actualizarSaldo('$saldo_nuevo', '$id_tarjeta')";
            if ($conn->query($sql_update) === true) {
                $_SESSION['saldo'] = $saldo_nuevo;
                header("Location: ../bienvenida/index.php");
            }else{
                header("Location: ../bienvenida/index.php");
            };
        }else{
            header("Location: ../bienvenida/index.php");
        }

    }else{
        header("Location: ../bienvenida/index.php");
    }
}else{
    header("Location: ../../index.html");
}