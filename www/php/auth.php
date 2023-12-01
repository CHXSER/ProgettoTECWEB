<?php

    require_once("php/user.php");

    function check_username($username) {
        $pattern = '/^[\w]{1,30}$/';
        if (!preg_match($pattern, $username))
            return '<span lang=\"en\">Username</span> può contenere solo lettere, numeri e <span lang=\"en\">underscore e deve essere lungo al massimo 30 caratteri';
        return True;
    }

    function check_email($email) {
        if(strlen($email) > 30)
            return 'La <span lang="\en"\>mail</span> può essere lunga al massimo 30 caratteri';
        if(!filter_var($email, FILTER_VALIDATE_EMAIL))
            return '<span lang=\"en\"';

        return True;
    }

    function register() {
        if(empty($_POST)  || !isset($_POST["username"]) || !isset($_POST["password"]) || !isset($_POST["email"])) {
            return "Non sono stati compilati tutti i campi";
        }

        $username = $_POST["username"];
        $password = $_POST["password"];
        $conferma_ps = $_POST["confirm-password"];
        $email = $_POST["email"];

        if(check_username($username) !== True) {
            return check_username($username);
        }
        if(check_email($email) !== True) {
            return check_email($email);
        }
        if($conferma_ps != $password) {
            return "Le <span lang\"en\">password</span> non sono uguali";
        }

        $email = filter_var($email, FILTER_SANITIZE_EMAIL);
        $result = get_by_email($email);
        if ($result && count($result) > 0) {
            return "Esista già un utente con questa <span lang=\"en\">email</span> associata ad esso";
        }

        $user_check = get_by_username($username);
        if ($user_check && count($user_check)) {
            return "Questo <span lang=\"en\">username</span> è già in uso";
        }

        add_user($username, "Wow", "Rudy", $password, $email);
        return True;
        
    }

    function login() {
        if (empty($_POST) || !isset($_POST["username"]) || !isset($_POST["password"]))
            return "Completa tutti i campi";
        
        $username = $_POST["username"];
        $password = $_POST["password"];

        if(check_username($username) !== True) {
            return check_username($username);
        }

        $username = filter_var($username, FILTER_UNSAFE_RAW);
        $utente = get_password($username);

        if(empty($utente))
            return "Utente non registrato";

        if($password === $utente[0]["password"]) {
            $_SESSION["username"] = $username;
            return True;
        }
        return "Errore nell'accesso";
    }

    function server_error() {
        http_response_code(500);
        file_get_contents("500.php");
        die();
    }
?>