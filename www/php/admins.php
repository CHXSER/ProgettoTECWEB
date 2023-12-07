<?php
    require_once("php/admins.php");

    function get_admin($username) {
        return db::run_query("SELECT * FROM admin WHERE username = ?", $username);
    }

    function get_admin_password($username) {
        return db::run_query("SELECT password FROM admin WHERE username = ?", $username);
    }
?>