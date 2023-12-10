<?php
    require_once("php/drawing.php");
    $title = "Prodotto - BOHEMY";
    $page = "product";
    $description = "Visualizza il prodotto in dettaglio";
    $keywords = "";

    include "./php/template/header.php";
    $DOM = file_get_contents('./html/product.html');
    if(isset($_GET)) {
        $nome = $_GET["nome"];
        $row = get_drawing($nome);
        $DOM = str_replace("<!-- Immagine -->",  "./images/immagini/" . $row[0]["disegno"], $DOM);
        $DOM = str_replace("<!-- Nome -->", $row[0]["nome"], $DOM);
        $DOM = str_replace("<!-- Prezzo -->", $row[0]["prezzo"] . " €", $DOM);
        //$DOM = str_replace("<p></p>", "<p>" . $row[0]["descrizione"] . "</p>", $DOM);
        $DOM = str_replace("<p class=\"author\"></p>", "<p class=\"author\">Autore: <span>" . $row[0]["autore"] . "</span></p>", $DOM);
    }
    echo ($DOM);
    include "./php/template/footer.php";
?>
