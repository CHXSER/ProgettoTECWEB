<?php
    http_response_code(404);
    $title = "Pagina non trovata - BOHEMY";
    $page  = "404";
    $description = "Pagina non trovata nel server";
    $keywords = "404";
    include "php/template/header.php";

    $DOM = file_get_contents("html/404.html");
    echo ($DOM);

    include "php/template/footer.php";
?>