<?php
    $title = "Register - BOHEMY";
    $page = "register";
    $description = "Register ...";
    $keywords = "register, account, BOHEMY";

    $script = "validate";
    require_once "php/auth.php";

    $template = (file_get_contents("html/register.html"));

    include "php/template/header.php";
    echo $template;
    include "php/template/footer.php";
?>