<?php
    session_start();
    if(!isset($_SESSION["cart"])) {
        $_SESSION["cart"] = array();
    } 

    function add_to_cart($product_name, $quantity) {
        $_SESSION["cart"][$product_name] = $quantity;
    }

    function remove_from_cart($product_name) {
        unset($_SESSION["cart"][$product_name]);
    }

?>