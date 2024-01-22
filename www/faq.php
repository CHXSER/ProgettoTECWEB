<?php
    $title = "FAQ - BOHEMY";
    $page = "faq";
    $description = "";
    $keywords = "";

    include "php/template/header.php";

    $DOM = file_get_contents("html/faq.html");
    echo $DOM;

    include "php/template/footer.php";
?>