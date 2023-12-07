<?php   
    $title = "Login - BOHEMY";
    $page = "login";
    $description = "Accedi al tuo profilo per acquistare quadri";
    $keywords = "login, BOHEMY, account, accedi";

    $script = "validate";
    require "php/auth.php";

    session_start();
    if(isset($_SESSION["username"])) {
        if(is_admin($_SESSION["username"])) {
            header("Location: admin.php");
        } else {
            header("Location: account.php");
        }
    }

    $template = (file_get_contents("html/login.html"));
    // Errori relativi alle credenziali login
    $err = isset($_SESSION["error-log"]) ? $_SESSION["error-log"] : null;

    include "php/template/header.php";
    try {
        if(isset($err))
            $template = str_replace("<!-- errors -->", $err, $template);
        echo $template;
        session_unset();
        session_destroy();
    } catch (Exception $e) {
        server_error();
    }
    include "php/template/footer.php";
?>