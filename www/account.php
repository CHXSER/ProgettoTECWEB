<?php
    $title = "Profilo - BOHEMY";
    $page = "account";
    $description = "Gestisci il tuo profilo di BOHEMY";
    $keywords = "account, profilo, login, registrati";

    require_once "php/user.php";
    session_start();

    include "php/template/header.php";
    $DOM = file_get_contents("html/account.html");
    $no_orders = file_get_contents("html/template/no_orders.html");
    $table = file_get_contents("html/template/purchase_table.html");
    $table_row = file_get_contents("html/template/purchase_row.html");

    if(isset($_SESSION["username"])) {
        $row = get_by_username($_SESSION["username"]);
        $DOM = str_replace("<!-- Username -->", $row[0]["username"], $DOM);
        $DOM = str_replace("<!-- Email -->", $row[0]["email"], $DOM);
        if(isset($_SESSION["error-mod-info"])) {
            $DOM = str_replace("<!-- Errore mod info -->", $_SESSION["error-mod-info"], $DOM);
            unset($_SESSION["error-mod-info"]);
        }
        if(isset($_SESSION["error-mod-pass"])) {
            $DOM = str_replace("<!-- Errore mod pass -->", $_SESSION["error-mod-pass"], $DOM);
            unset($_SESSION["error-mod-pass"]);
        }
        if(isset($_SESSION["error-del-pass"])) {
            $DOM = str_replace("<!-- Errore del pass -->", $_SESSION["error-del-pass"], $DOM);
            unset($_SESSION["error-del-pass"]);
        }

        $template = "";
        // Ordini
        $ordini = get_acquisti($_SESSION["username"]);
        //print_r($ordini);
        if(empty($ordini)) {
            $DOM = str_replace("<!-- No ordini -->", $no_orders, $DOM);
        } else {
            for($i=0;$i < count($ordini); $i++) {
                $template = $table_row;
                $disegno = $ordini[$i]["drawing_name"];
                $data = $ordini[$i]["dataAcquisto"];
                $quantita = $ordini[$i]["total_quantity"];
                $prezzo = $ordini[$i]["drawing_price"];

                $template = str_replace("<!-- Data -->", $data, $template);
                $template = str_replace("<!-- Disegni -->", $disegno, $template);
                $template = str_replace("<!-- Quantità -->", $quantita, $template);
                $template = str_replace("<!-- Spesa -->", $prezzo, $template);
                $table = str_replace("<!-- Ordini db -->", $template, $table);
            }
            $DOM = str_replace("<!-- No ordini -->", $table, $DOM);
        }

    }
    
    echo ($DOM);
    include "php/template/footer.php";
?>