<?php

    function register() {
        if(empty($_POST  || !isset($_POST["email"]) || !isset($_POST["password"]))) {
            // Compilare tutti i campi
        }

        $username = $_POST["email"];
        $password = $_POST["password"];
    }

    function server_error() {
        http_response_code(500);
        $relative_path = dirname(__FILE__) . '500.html';
        echo file_get_contents($relative_path);
        die();
    }
?>