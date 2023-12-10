<?php
    require_once "php/gestione_carrello.php";
    require_once "php/drawing.php";

    $title = "Carello - BOHEMY";
    $page = "cart";
    $description = "Visualizza elementi nel carello e procedi al pagamento";
    $keywords = "carello, cart";

    include "php/template/header.php";
    $DOM = file_get_contents("html/cart.html");
    $vuoto = file_get_contents("html/empty_cart.html");
    $productHTML = file_get_contents("html/template/cart_product.html");
    $summaryProduct = file_get_contents("html/template/product_summary_item.html");
    $totalSummary = file_get_contents("html/summary.html");

    $template = "";
    $prezzo_totale = 0;

    if(empty($_SESSION["cart"])) {
        $DOM = str_replace("<!-- Vuoto -->", $vuoto, $DOM);
    } else {
        foreach($_SESSION["cart"] as $product => $quantity) {
            $row = get_drawing($product);

            // Cart product 
            $template = str_replace("<!-- Nome -->", $row[0]["nome"], $productHTML);
            $template = str_replace("<!-- Immagine -->", "images/immagini/" . $row[0]["disegno"], $template);
            $template = str_replace("<!-- Prezzo -->", $row[0]["prezzo"], $template);
            $template = str_replace("<!-- Quantità -->", $quantity, $template);
            $template = $template . "<!-- Informazioni prodotto -->";
            $DOM = str_replace("<!-- Informazioni prodotto -->", $template, $DOM);
            $prezzo_totale += $row[0]["prezzo"] * $quantity;
            $template = "";

            // Product summary
            $template = str_replace("<!-- Nome -->", $row[0]["nome"], $summaryProduct);
            $template = str_replace("<!-- Prezzo -->", $row[0]["prezzo"], $template);
            $template = str_replace("<!-- Quantità -->", $quantity, $template);
            $template = $template . "\n<!-- Sommario -->";
            $totalSummary = str_replace("<!-- Sommario -->", $template, $totalSummary);
        }

        // Summary
        $totalSummary = str_replace("<!-- Totale -->", $prezzo_totale, $totalSummary);
        $DOM = str_replace("<!-- Vuoto -->", $totalSummary, $DOM);
        // TODO: Prezzo spedizione e tasse, subtotale
    }

    echo ($DOM);

    include "php/template/footer.php";
?>