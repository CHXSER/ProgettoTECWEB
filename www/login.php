<?php   
    $title = "Login - BOHEMY";
    $page = "login";
    $description = "Login to use BOHEMY at its fullest";
    $keywords = "login, BOHEMY, account";

    $script = "validate";
    require "php/auth.php";

    session_start();
    // if(is_logged()) {}
    $template = (file_get_contents("html/login.html"));
    $err = isset($_SESSION["error-login"]) ? $_SESSION["error-login"] : null;
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