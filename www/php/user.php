<?php
    require_once("db.php");

    function get_by_username($user) {
        return db::run_query('SELECT * FROM utente WHERE username = ?', $user);
    }

    function get_by_email($email) {
        return db::run_query('SELECT * FROM utente WHERE email = ?',$email);
    }

    function add_user($username, $password, $email) {
        db::run_query('INSERT INTO `utente` (`username`, `password`, `email`) VALUES (?,?,?)', $username, $password, $email);
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

    function purchase($username, $disegno, $data, $quantita) {
        db::run_query("INSERT INTO acquisti (username, disegno, dataAcquisto, quantita) VALUES (?,?,?,?)", $username, $disegno, $data, $quantita);
    }

    function mod_username($username_old, $username_new) {
        db::run_query("UPDATE utente SET username = ? WHERE username = ?", $username_new, $username_old);
    }

    function mod_email($username, $email) {
        db::run_query("UPDATE utente SET email = ? WHERE username = ?", $email, $username);
    }

    function change_password($username, $password) {
        db::run_query("UPDATE utente SET password = ? WHERE username = ?", $password, $username);
    }

?>