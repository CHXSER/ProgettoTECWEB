<?php
    require_once("php/user.php");

    session_start();
    if (isset($_SESSION["username"])) {
        // Esegui pagamento
        foreach($_SESSION["cart"] as $product => $quantity) {
            purchase($_SESSION["username"], $product, date("Y-m-d"), $quantity);
        }
        $_SESSION["cart"] = array();
        header("Location: account.php");
    } else {
        // Reinderizza al login per eseguire accesso
        header("Location: login.php");
    }
?>