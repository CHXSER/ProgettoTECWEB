<?php
    require_once("php/auth.php");
    require_once("php/drawing.php");
    $title = "Admin - BOHEMY";
    $page = "admin";
    $description = "Pagina per eliminare/modificare o aggiungere disegni";
    $keywords = "";
    include "php/template/header.php";
    $DOM = file_get_contents("html/admin.html");
    $riga_tabella = file_get_contents("html/template/admin_table.html");
    $template = "";
    $row = get_all_drawings();
    for($i=0; $i< count_drawings(); $i++) {
        //$template = str_replace("<td data-label=\"Id\">", "<td data-label=\"Id\">" . $row[$i]["id"], $riga_tabella);
        $template = str_replace("<td data-label=\"Nome\">", "<td data-label=\"Nome\">" . $row[$i]["nome"], $template);
        $template = str_replace("<td data-label=\"Immagine\">", "<td data-label=\"Immagine\">" . $row[$i]["disegno"], $template);
        $template = str_replace("<td data-label=\"Descrizione\">", "<td data-label=\"Descrizione\">" . $row[$i]["descrizione"], $template);
        $template = str_replace("<td data-label=\"Autore\">", "<td data-label=\"Autore\">" . $row[$i]["autore"], $template);
        $template = $template . "\n <!-- Collezione db -->";
        $DOM = str_replace("<!-- Collezione db -->", $template, $DOM);
        $template = $riga_tabella;
    }
    echo $DOM;
    include "php/template/footer.php";
?>