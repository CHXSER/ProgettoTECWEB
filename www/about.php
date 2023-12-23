<?php
    $title = "Chi siamo - BOHEMY";
    $page = "about";
    $description = "BOHEMY è una società artistica dell'Antartide con una passione per la creazione d'arte, dando vita a mondi immaginari e fantastici.";
    $keywords = "BOHEMY, società artistica, Antartide, arte, mondi immaginaris";
    
    include "php/template/header.php";
    $DOM = file_get_contents("html/faq.html");
    echo ($DOM);
    include "php/template/footer.php";
?>