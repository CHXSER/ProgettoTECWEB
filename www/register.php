<?php
    $title = "Registrazione - BOHEMY";
    $page = "register";
    $description = "Crea il tuo profilo per poter acquistare quadri";
    $keywords = "register, account, BOHEMY, registrazione";

    require_once "php/auth.php";
    $template = (file_get_contents("html/register.html"));
    $err = isset($_SESSION["error-reg"]) ? $_SESSION["error-reg"] : null;

    include "php/template/header.php";
    try {
        if(isset($err))
            $template = str_replace("<!-- errors -->", $_SESSION["error-reg"], $template);
        echo $template;
        $_SESSION["error-reg"] = null;
    } catch (Exception $e) {
        server_error();
    }
    include "php/template/footer.php";
?>