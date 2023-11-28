<?php
    $title = "About - BOHEMY";
    $page = "about";
    $description = "BOHEMY is an art society from Antartica with a passion for creating art, bringing fictional, imaginary worlds to life.";
    $keywords = "BOHEMY, art society, Antartica, art, imaginary worlds";
    include "php/template/header.php";
    $DOM = file_get_contents("html/about.html");
    echo ($DOM);
    include "php/template/footer.php";
?>