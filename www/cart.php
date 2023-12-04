<?php
    $title = "Carello - BOHEMY";
    $page = "cart";
    $description = "";
    $keywords = "";
    include "php/template/header.php";
    $DOM = file_get_contents("html/cart.html");
    echo ($DOM);
    include "php/template/footer.php";
?>