<?php
    require_once('./php/service_manager.php');
    $title = "Titolo";
    $page = "index";
    $description = "descrizione";
    $keywords = "";

    include "./php/template/header.php";
    $content = "";
    $DOM = file_get_contents('./html/home.html');
    echo ($DOM);
    include "./php/template/footer.php"
?>