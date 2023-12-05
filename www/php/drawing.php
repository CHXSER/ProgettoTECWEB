<?php
    require_once("db.php");

    function get_all_drawings() {
        return db::run_query("SELECT * FROM disegni");
    }

    function count_drawings() {
        return count(db::run_query("SELECT * FROM disegni"));
    }

    function best_seller() {
        return db::run_query
        ("SELECT acquisti.disegno as nome, disegni.disegno as path, disegni.prezzo as prezzo, disegni.descrizione, COUNT(*) AS DisegniAcquistati
        FROM acquisti
        INNER JOIN disegni ON acquisti.disegno = disegni.nome
        GROUP BY acquisti.disegno
        ORDER BY DisegniAcquistati DESC
        LIMIT 4");
    }

    function get_drawing($nome) {
        return db::run_query("SELECT * FROM disegni WHERE nome = ?", $nome);
    }
?>