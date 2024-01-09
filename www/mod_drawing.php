<?php
    require "php/auth.php";
    require "php/drawing.php";
    $title = "Modifica - BOHEMY";
    $page = "mod_drawing";
    $description = "Modifica il prodotto";
    $keywords = "";
    
    session_start();
    if(isset($_POST["nome"])) {
        mod_drawing($_POST["nome"], $_POST["prezzo"], $_POST["immagine"], $_POST["descrizione"], $_POST["autore"], $_GET["nome"], $_POST["quantita"]);
        header("Location: admin.php");
    } else if(isset($_SESSION["username"])) {
        if(!is_admin($_SESSION["username"])) {
            header("Location: index.php");
        } else {
            include "php/template/header.php";
            $DOM = file_get_contents("html/template/form_mod.html");
            $row = get_drawing($_GET["nome"]);
            $DOM = str_replace("<!-- Nome -->", $row[0]["nome"], $DOM);
            $DOM = str_replace("<!-- Prezzo -->", $row[0]["prezzo"], $DOM);
            $DOM = str_replace("<!-- Immagine -->", $row[0]["disegno"], $DOM);
            $DOM = str_replace("<!-- Descrizione -->", $row[0]["descrizione"], $DOM);
            $DOM = str_replace("<!-- Quantita -->", $row[0]["quantita"], $DOM);
            $DOM = str_replace("<!-- Autore -->", $row[0]["autore"], $DOM);
            echo $DOM;
            include "php/template/footer.php";
        }
    }
?>