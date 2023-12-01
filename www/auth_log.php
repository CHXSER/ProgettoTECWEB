<?php
    require_once("php/auth.php");
    session_start();
    if(!empty($_POST)) {
        $result = login();
        if($result === true) {
            $_SESSION['error-log'] = null;
            header('Location: index.php');
        } else {
            $_SESSION['error-log'] = $result;
            header('Location: login.php');
        }
    }
?>