<?php
    function aggiorna_value_carrello() {
        if(isset($_SESSION["cart"])) {
            $numCarrello = count($_SESSION["cart"]);
            if($numCarrello == 0) {
                $DOM = str_replace('data-badge=""', "", $DOM);
            } else {
                $DOM = str_replace('data-badge=""', 'data-badge="' . $numCarrello . '"', $DOM);
            }
        } else {
            $_SESSION["cart"] = array();
            $DOM = str_replace('data-badge=""', "", $DOM);
        }
    }
?>