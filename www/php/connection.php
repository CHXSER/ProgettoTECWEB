<?php
    class connection{
        private const HOST = 'localhost';
        private const USERNAME = 'root'; 
        private const PASSWORD = '';
        private const DATABASE = 'tecweb';
        private $connection;

        public function __construct() {
            $this->connection = mysqli_connect(connection::HOST,connection::USERNAME,
                connection::PASSWORD, connection::DATABASE);
        }
        
        public function getConnection() {
            return $this->connection;
        }

        public function closeConnection() {
            $this->connection->close();
        }

        public function isConnected() {
            if($this->connection->connect_errno){
                return false;
            }
            else{
                return true;
            }
        }
    }
?>