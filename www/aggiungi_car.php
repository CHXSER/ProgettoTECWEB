<?php
    require_once("php/gestione_carrello.php");

    if($_SERVER["REQUEST_METHOD"] === "POST") {
        add_to_cart($_POST["nome"], $_POST["quantity"]);
        header("Location: cart.php");
    }
?>