<?php
    require "php/auth.php";
    require "php/drawing.php";

    $title = "BOHEMY";
    $page = "index";
    $description = "descrizione";
    $keywords = "";

    include "./php/template/header.php";
    $DOM = file_get_contents('./html/home.html');
    $card = file_get_contents("html/template/card.html");
    $template = "";
    $row = best_seller();
    for($i=0; $i < 4; $i++) {
        $template = str_replace("<!-- Immagine -->",  "./images/immagini/" . $row[$i]["path"], $card);
        $template = str_replace("<input type=\"hidden\" name=\"nome\" value=\"\">","<input type=\"hidden\" name=\"nome\" value=\"" . $row[$i]["nome"] . "\">", $template);
        $template = str_replace("<!-- Nome -->", $row[$i]["nome"], $template);
        $template = str_replace("<!-- Prezzo -->", $row[$i]["prezzo"] . " €", $template);
        $template = $template . "\n<!-- Collezione db -->";
        $DOM = str_replace("<!-- Collezione db -->", $template, $DOM);
        $template = $card;
    }
    echo ($DOM);
    include "./php/template/footer.php";
?>
