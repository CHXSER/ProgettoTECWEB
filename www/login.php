<?php   
    $title = "Login - BOHEMY";
    $page = "login";
    $description = "Accedi al tuo profilo per acquistare quadri";
    $keywords = "login, BOHEMY, account, accedi";

    $script = "validate";
    require "php/auth.php";

    session_start();
    if(isset($_SESSION["username"])) {
        header("location: account.php");
    }

    $template = (file_get_contents("html/login.html"));
    // Errori relativi alle credenziali login
    $err = isset($_SESSION["error-log"]) ? $_SESSION["error-log"] : null;

    session_write_close();
    session_abort();

    include "php/template/header.php";
    try {
        if(isset($err))
            $template = str_replace("<!-- errors -->", $err, $template);
        echo $template;
    } catch (Exception $e) {
        server_error();
    }
    include "php/template/footer.php";
?>