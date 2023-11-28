<?php
    http_response_code(500);

    $title = "Server error - BOHEMY";
    $page = "500";
    $description = "Server error - BOHEMY";
    $keywords = "500";
    include "php/template/header.php";
    $DOM = file_get_contents("html/500.html");
    echo ($DOM);
    include "php/template/footer.php";
?>