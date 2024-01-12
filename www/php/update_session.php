<?php
    session_start();

    if(isset($_POST["prodotto"])) {
        $SESSION["cart"][$_POST["prodotto"]] = $_POST["quantita"]
    }
?>