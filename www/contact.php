<?php
    $title = "Contattaci - BOHEMY";
    $page = "contact";
    $description = "Scopri le origini di BOHEMY e tutti i suoi segreti";
    $keywords = "BOHEMY, origini, segreti, faq";

    if(isset($_POST["nome"]) && isset($_POST["email"]) && isset($_POST["messaggio"])) {

        $to = $_POST["email"];
        $subject = "Abbiamo ricevuto la tua domanda";
        $message = "Ciao " . $_POST["nome"] . ", La preghiamo di aspettare la risposta";
        $mailSuccess = mail($to, $subject, $message);
    }

    include "php/template/header.php";
    $DOM = file_get_contents("html/contact.html");
    echo ($DOM);
    include "php/template/footer.php";
?>