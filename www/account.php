<?php
    $title = "Profilo - BOHEMY";
    $page = "account";
    $description = "Gestisci il tuo profilo di BOHEMY";
    $keywords = "account, profilo, login, registrati";
    
    include "php/template/header.php";
    $DOM = file_get_contents("html/account.html");
    echo ($DOM);
    include "php/template/footer.php";
?>