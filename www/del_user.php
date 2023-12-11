<?php
    require_once("php/user.php");

    session_start();
    if(isset($_SESSION["username"])) {
        $pass_utente = get_password($_SESSION["username"]);
        if($_POST["delete_password"] === $pass_utente[0]["password"]) {
            delete_user($_SESSION["username"]);
            session_unset();
            session_destroy();
            header("Location: index.php");
        } else {
            $_SESSION["error-del-pass"] = "La password è sbagliata";
            header("Location: account.php");
        }
    }
?>