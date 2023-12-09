<?php
    require_once("php/auth.php");
    require_once("php/drawing.php");

    $title = "Add product - BOHEMY";
    $page = "add_product";
    $description = "Pagina per aggiungere un prodotto";
    $keywords = "";

    session_start();
    if(!is_admin($_SESSION["username"]))
        header("Location: account.php");      
    
    include "php/template/header.php";
    $DOM = file_get_contents("html/add_product.html");

    if(isset($_POST["nome"])) {
        if(empty(get_drawing($_POST["nome"]))) {
            add_drawing($_POST["nome"], $_POST["prezzo"], $_POST["immagine"], $_POST["descrizione"], $_POST["autore"]);
            header("Location: admin.php");
        } else {

            $DOM = str_replace("<!-- Errori -->", "Questo nome è già stato preso", $DOM);
            //echo $DOM;
        }
    }
    echo $DOM;
    include "php/template/footer.php";
?>