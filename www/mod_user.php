<?php
    require_once("php/user.php");
    require_once("php/auth.php");

    if(isset($_SESSION["username"])) {
        switch($_POST["type"]) {
            case "info":
                if(check_username($_POST["name"]) && check_email($_POST["email"])) {
                    if(empty(get_by_username($_POST["name"]))) {
                        mod_username($_SESSION["username"], $_POST["name"]);
                        $_SESSION["username"] = $_POST["name"];
                    } else {
                        $_SESSION["error-mod-info"] = "Nome utente non disponibile";
                    }
                    mod_email($_SESSION["username"], $_POST["email"]);

                } else {
                    $_SESSION["error-mod-info"] = "Username o email non validi";
                }
                break;
            case "password":
                if($_POST["new_password"] === $_POST["confirm_password"]) {
                    change_password($_SESSION["username"], $_POST["new_password"]);
                } else {
                    $_SESSION["error-mod-pass"] = "Le password non corrispondono";
                }
                break;
        }
        header("Location: account.php");
    }

?>