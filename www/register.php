<?php
    $title = "Register - BOHEMY";
    $page = "register";
    $description = "Crea il tuo profilo per poter acquistare quadri";
    $keywords = "register, account, BOHEMY, registrazione";

    $script = "validate";
    require_once "php/auth.php";

    $template = (file_get_contents("html/register.html"));

    include "php/template/header.php";
    echo $template;
    include "php/template/footer.php";
?>