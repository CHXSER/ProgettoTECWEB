<?php
    require "php/auth.php";
    require "php/drawing.php";

    $title = "Collezione - BOHEMY";
    $page = "collection";
    $description = "La collezione completa dei quadri BOHEMY";
    $keywords = "collezione, quadri, BOHEMY, arte, disegni";


    include "php/template/header.php";

    $DOM = file_get_contents("html/collection.html");
    $card = file_get_contents("html/template/card.html");
    $template = "";
    $row = get_all_drawings();
    for($i = 0;$i < count_drawings(); $i++) {
        $template = str_replace("<!-- Immagine -->",  "./images/immagini/" . $row[$i]["disegno"], $card);
        $template = str_replace("<input type=\"hidden\" name=\"nome\" value=\"\">","<input type=\"hidden\" name=\"nome\" value=\"" . $row[$i]["nome"] . "\">", $template);
        $template = str_replace("<!-- Nome -->", $row[$i]["nome"], $template);
        $template = str_replace("<!-- Prezzo -->", $row[$i]["prezzo"] . " €", $template);
        $template = $template . "\n<!-- Collezione db -->";
        $DOM = str_replace("<!-- Collezione db -->", $template, $DOM);
        $template = $card;
    }
    echo ($DOM);
    include "php/template/footer.php";
?>