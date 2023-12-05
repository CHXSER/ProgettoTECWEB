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
        $template = str_replace("<img src=\"\" alt=\"\" />",  "<img src=\"./images/immagini/" . $row[$i]["path"] . "\" alt=\"" . $row[$i]["descrizione"] . "\" />", $card);
        $template = str_replace("<h2></h2>", "<h2>" . $row[$i]["nome"] . "</h2>", $template);
        $template = $template . "\n<!-- Collezione db -->";
        $DOM = str_replace("<!-- Collezione db -->", $template, $DOM);
        $template = $card;
    }
    echo ($DOM);
    include "./php/template/footer.php";
?>
