<?php
    $title = "Privacy - BOHEMY";
    $page = "pppolicy";
    $description = "";
    $keywords = "";

    include "php/template/header.php";

    $DOM = file_get_contents("html/privacy_policy.html");
    echo $DOM;
    
    include "php/template/footer.php";
?>