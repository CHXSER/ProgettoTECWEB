<?php
    http_response_code(404);
    $title = "Page not found - BOHEMY";
    $page  = "404";
    $description = "Page not  found - BOHEMY";
    $keywords = "404";
    include "php/template/header.php";

    $DOM = file_get_contents("html/404.html");
    echo ($DOM);

    include "php/template/footer.php";
?>