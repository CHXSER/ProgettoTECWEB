<?php
    $title = "Contattaci - BOHEMY";
    $page = "contact";
    $description = "Scopri le origini di BOHEMY e tutti i suoi segreti";
    $keywords = "BOHEMY, origini, segreti, faq";

    include "php/template/header.php";
    $DOM = file_get_contents("html/contact.html");
    echo ($DOM);
    include "php/template/footer.php";
?>