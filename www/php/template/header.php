<?php
    if (session_status() === PHP_SESSION_NONE) {
        session_start();
    }
    
    $DOM = file_get_contents("html/template/header.html");
    $DOM = str_replace("<!-- Titolo -->", $title, $DOM);
    $DOM = str_replace("<!-- Descrizione -->", $description, $DOM);
    $DOM = str_replace("<!-- Keywords -->'", $keywords, $DOM);
    if(isset($_SESSION["cart"])) {
        $numCarrello = count($_SESSION["cart"]);
        if($numCarrello == 0) {
            $DOM = str_replace('data-badge=""', "", $DOM);
        } else {
            $DOM = str_replace('data-badge=""', 'data-badge="' . $numCarrello . '"', $DOM);
        }
    } else {
        $_SESSION["cart"] = array();
        $DOM = str_replace('data-badge=""', "", $DOM);
    }
    echo $DOM;
?>