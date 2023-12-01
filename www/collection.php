<?php
    $title = "Collezione - BOHEMY";
    $page = "collection";
    $description = "";
    $keywords = "";
    include "php/template/header.php";
    $DOM = file_get_contents("html/collection.html");
    echo ($DOM);
    include "php/template/footer.php";
?>