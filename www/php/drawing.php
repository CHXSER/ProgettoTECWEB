<?php
    require_once("db.php");

    function get_all_drawings() {
        return db::run_query("SELECT * FROM disegni");
    }

    function count_drawings() {
        return count(db::run_query("SELECT * FROM disegni"));
    }
?>