<?php
    ini_set('display_errors', 1);
    ini_set('display_startup_errors', 1);
    error_reporting(E_ALL); 

    header_remove('x-powered-by');
    ob_start();

    require_once "php/auth.php";
    
    if(session_status() === PHP_SESSION_NONE)
        session_start();

    $DOM = file_get_contents("html/template/header.html");
    if(isset($title) && isset($description) && isset($keywords)) {
        $DOM = str_replace("<!-- Titolo -->", $title, $DOM);
        $DOM = str_replace("<!-- Descrizione -->", $description, $DOM);
        $DOM = str_replace("<!-- Keywords -->'", $keywords, $DOM);
    }

    if(isset($_SESSION["cart"])) {
        if(isset($_SESSION["username"]) && is_admin($_SESSION["username"])) {
            $DOM = preg_replace('/<!-- Elimina carello -->.*?<!-- Elimina carello -->/s', '', $DOM);
        } else {
            $numCarrello = count($_SESSION["cart"]);
            if($numCarrello == 0) {
                $DOM = str_replace('data-badge=""', "", $DOM);
            } else {
                $DOM = str_replace('data-badge=""', 'data-badge="' . $numCarrello . '"', $DOM);
            }
        }
    } else {
        $_SESSION["cart"] = array();
        $DOM = str_replace('data-badge=""', "", $DOM);
    }

    echo ($DOM);
?>