<?php
    $title = "Profilo - BOHEMY";
    $page = "account";
    $description = "Gestisci il tuo profilo di BOHEMY";
    $keywords = "account, profilo, login, registrati";

    require_once "php/user.php";
    session_start();

    include "php/template/header.php";
    $DOM = file_get_contents("html/account.html");
    if(isset($_SESSION["username"])) {
        $row = get_by_username($_SESSION["username"]);
        $DOM = str_replace("<!-- Username -->", $row[0]["username"], $DOM);
        $DOM = str_replace("<!-- Email -->", $row[0]["email"], $DOM);
    }
    
    echo ($DOM);
    include "php/template/footer.php";
?>