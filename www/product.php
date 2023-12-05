<?php
    $title = "Produc - BOHEMY";
    $page = "product";
    $description = "Visualizza il prodotto in dettaglio";
    $keywords = "";

    include "./php/template/header.php";
    $DOM = file_get_contents('./html/product.html');
    echo ($DOM);
    include "./php/template/footer.php";
?>