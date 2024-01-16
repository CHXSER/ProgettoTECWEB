<?php
    require_once "php/auth.php";

    session_start();
    if(!empty($_POST)) {
        $result = register();
        if($result === True) {
            $_SESSION["error-reg"] = null;
            header("Location: login.php");
        } else {
            $_SESSION["error-reg"] = $result;
        }
    }
    header("Location: register.php");
?>