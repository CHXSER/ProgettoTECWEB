<?php
    
    $title = "Carello - BOHEMY";
    $page = "cart";
    $description = "";
    $keywords = "";


    include "php/template/header.php";

    session_start();

    $DOM = file_get_contents("html/cart.html");
    echo ($DOM);

    include "php/template/footer.php";
?>