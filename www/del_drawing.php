<?php
    require "php/auth.php";
    require "php/drawing.php";

    $title = "Elimina - BOHEMY";
    $page = "del_drawing";
    $description = "Elimina il prodotto";
    $keywords = "";

    session_start();
    if(isset($_POST["yes"]) && isset($_GET["nome"])) {
        delete_drawing($_GET["nome"]);
        header("Location: admin.php");
    } else if(isset($_SESSION["username"])) {
        if(!is_admin($_SESSION["username"])) {
            header("Location: index.php");
        } else {
            include "php/template/header.php";
            $DOM = file_get_contents("html/template/delete.html");
            $DOM = str_replace("<!-- Nome -->", $_GET["nome"], $DOM);
            echo $DOM;
            include "php/template/footer.php";
        }
    }
?>