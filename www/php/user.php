<?php
    require_once("db.php");

    function get_by_username($user) {
        return db::run_query('SELECT * FROM utente WHERE username = ?', $user);
    }

    function get_by_email($email) {
        return db::run_query('SELECT * FROM utente WHERE email = ?',$email);
    }

    function add_user($username, $nome, $cognome, $password, $email) {
        db::run_query('INSERT INTO `utente` (`username`, `nome`, `cognome`, `password`, `email`) VALUES (?,?,?,?,?)', $username, $nome, $cognome, $password, $email);
    }

    function get_password($username) {
        return db::run_query('SELECT password FROM utente WHERE username=?', $username);
    }

    function login_user($username, $password) {
        return db::run_query('SELECT * FROM utente WHERE username=?, password=?', $username, $password);
    }

    function delete_user($username) {
        db::run_query('DELETE FROM utente WHERE username=?', $username);
    }

?>