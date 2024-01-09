<?php
    require_once("php/drawing.php");

    $title = "Prodotto - BOHEMY";
    $page = "product";
    $description = "Visualizza il prodotto in dettaglio";
    $keywords = "";

    include "./php/template/header.php";
    $DOM = file_get_contents('./html/product.html');
    $prodotto_esaurito = file_get_contents('./html/template/prodotto_esaurito.html');
    $bottone_carrello = file_get_contents('./html/template/bottone_aggiungi_car.html');
    if(isset($_GET)) {
        $nome = $_GET["nome"];
        $row = get_drawing($nome);
        $DOM = str_replace("<!-- Immagine -->",  "./images/immagini/" . $row[0]["disegno"], $DOM);
        $DOM = str_replace("<!-- Nome -->", $row[0]["nome"], $DOM);
        $DOM = str_replace("<!-- Prezzo -->", $row[0]["prezzo"] . " €", $DOM);
        $DOM = str_replace("<!-- Descrizione -->", $row[0]["descrizione"], $DOM);
        $DOM = str_replace("<!-- Autore -->", $row[0]["autore"], $DOM);

        if($row[0]["quantita"] < 1) {
            $DOM = str_replace("<!-- Prodotto Esaurito -->", $prodotto_esaurito, $DOM);
        } else {
            for($i=1;$i<$row[0]["quantita"] + 1;$i++) {
                $bottone_carrello = str_replace("<!-- Quantita -->", '<option value="'. $i . '">' . $i . '</option>\n<!-- Quantita -->', $bottone_carrello);
            }
            $DOM = str_replace("<!-- Bottone Carrello-->", $bottone_carrello, $DOM);
        }
    }
    echo ($DOM);
    include "./php/template/footer.php";
?>
