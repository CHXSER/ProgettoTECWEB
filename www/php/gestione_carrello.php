<?php
    session_start();
    if(isset($_SESSION["username"])) {
        if(!isset($_SESSION["carrello"])) {
            $_SESSION["carrello"] = array();
        } 
    }

    function add_to_cart($product_name, $quantity) {
        $_SESSION["cart"][$product_name] = $quantity;
    }

    function remove_from_cart($product_name) {
        unset($_SESSION["cart"][$product_name]);
    }

?>