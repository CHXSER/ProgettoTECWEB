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
        $template = str_replace("<img src=\"\" alt=\"\" />",  "<img src=\"./images/immagini/" . $row[$i]["disegno"] . "\" alt=\"" . $row[$i]["descrizione"] . "\" />", $card);
        $template = str_replace("<h2></h2>", "<h2>" . $row[$i]["nome"] . "</h2>", $template);
        $template = $template . "\n<!-- Collezione db -->";
        $DOM = str_replace("<!-- Collezione db -->", $template, $DOM);
        $template = $card;
    }
    echo ($DOM);
    include "php/template/footer.php";
?>