<?php
    require_once("php/gestione_carrello.php");
    if($_SERVER["REQUEST_METHOD"] === "GET") {
        remove_from_cart($_GET["nome"]);
        header("Location: cart.php");
    }
?>