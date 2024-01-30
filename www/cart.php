<?php
    require_once "php/drawing.php";
    require_once "php/gestione_carrello.php";

    $title = "Carello - BOHEMY";
    $page = "cart";
    $description = "Visualizza elementi nel carello e procedi al pagamento";
    $keywords = "carello, cart";

    include "php/template/header.php";
    $DOM = file_get_contents("html/cart.html");
    $vuoto = file_get_contents("html/empty_cart.html");
    $productList = file_get_contents("html/template/product_list.html");
    $productHTML = file_get_contents("html/template/cart_product.html");
    $summaryProduct = file_get_contents("html/template/product_summary_item.html");
    $totalSummary = file_get_contents("html/summary.html");

    if(isset($_SESSION["username"]) && is_admin($_SESSION["username"])) {
        header("Location: admin.php");
    }

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
            for($i=1;$i<$row[0]["quantita"] + 1;$i++) {
                if($i == $quantity) {
                    $template = str_replace("<!-- Quantita -->", '<option value="'. $i . '", selected="true">' . $i . '</option>\n<!-- Quantita -->', $template);      
                } else {
                    $template = str_replace("<!-- Quantita -->", '<option value="'. $i . '">' . $i . '</option>\n<!-- Quantita -->', $template);   
                }
            }
            $template = $template . "<!-- Informazioni prodotto -->";
            $productList = str_replace("<!-- Informazioni prodotto -->", $template, $productList);
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
        $totalSummary = str_replace("<!-- Subtotale -->", $prezzo_totale, $totalSummary);
        $tasse = ($prezzo_totale * 22) / 100;
        $prezzo_totale = $prezzo_totale + $tasse + 4;
        $prezzo_totale = round($prezzo_totale, 2);
        $totalSummary = str_replace("<!-- Totale -->", $prezzo_totale, $totalSummary);
        $DOM = str_replace("<!-- Lista prodotti -->", $productList, $DOM);
        $DOM = str_replace("<!-- Vuoto -->", $totalSummary, $DOM);
    }

    echo ($DOM);

    include "php/template/footer.php";
?>