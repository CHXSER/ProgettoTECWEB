<?php
    http_response_code(500);

    $title = "Errore server - BOHEMY";
    $page = "500";
    $description = "Errore server - BOHEMY";
    $keywords = "500";
    include "php/template/header.php";
    $DOM = file_get_contents("html/500.html");
    echo ($DOM);
    include "php/template/footer.php";
?>