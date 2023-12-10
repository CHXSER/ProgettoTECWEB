<?php
    
    $title = "Carello - BOHEMY";
    $page = "cart";
    $description = "Visualizza elementi nel carello e procedi al pagamento";
    $keywords = "carello, cart";

    session_start();



    include "php/template/header.php";

    $DOM = file_get_contents("html/cart.html");
    echo ($DOM);

    include "php/template/footer.php";
?>