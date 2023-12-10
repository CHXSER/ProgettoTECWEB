<?php
    
    $DOM = file_get_contents("html/template/header.html");
    $DOM = str_replace("<!-- Titolo -->", $title, $DOM);
    $DOM = str_replace("<!-- Descrizione -->", $description, $DOM);
    $DOM = str_replace("<!-- Keywords -->'", $keywords, $DOM);
    echo($DOM);
?>