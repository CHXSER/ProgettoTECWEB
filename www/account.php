<?php
    $title = "Profilo - BOHEMY";
    $page = "account";
    $description = "";
    $keywords = "";
    include "php/template/header.php";
    $DOM = file_get_contents("html/account.html");
    echo ($DOM);
    include "php/template/footer.php";
?>