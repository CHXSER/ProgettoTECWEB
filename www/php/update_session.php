<?php
    session_start();

    if(isset($_POST["prodotto"])) {
        $_SESSION["cart"][$_POST["prodotto"]] = $_POST["quantita"];
    }
?>