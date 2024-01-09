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
        ("SELECT d.nome AS nome, d.descrizione AS descrizione, d.disegno AS path, d.prezzo AS prezzo, s.total_quantity_sold
        FROM disegni d
        JOIN (
            SELECT disegno, SUM(quantita) as total_quantity_sold
            FROM acquisti
            GROUP BY disegno
            ORDER BY total_quantity_sold DESC
            LIMIT 4
        ) s ON d.nome = s.disegno");
    }

    function get_drawing($nome) {
        return db::run_query("SELECT * FROM disegni WHERE nome = ?", $nome);
    }

    function mod_drawing($nome, $prezzo, $immagine, $descrizione, $autore, $origine, $quantita) {
        return db::run_query("UPDATE disegni SET nome=?, disegno=?, descrizione=?, autore=?, prezzo=?, quantita=?
        WHERE nome=?", $nome, $immagine, $descrizione, $autore, $prezzo, $quantita, $origine);
    }

    function delete_drawing($nome) {
        return db::run_query("DELETE FROM disegni WHERE nome=?", $nome);
    }
    

    function add_drawing($nome, $prezzo, $immagine, $descrizione, $autore, $quantita) {
        return db::run_query("INSERT INTO `disegni` (`nome`, `prezzo`, `disegno`, `descrizione`, `autore`, `quantita`) 
        VALUES (?, ?, ?, ?, ?, ?)", $nome, $prezzo, $immagine, $descrizione, $autore, $quantita);    
    }
?>