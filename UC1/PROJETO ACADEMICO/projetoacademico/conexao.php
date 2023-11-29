<?php

    // Criando conexão com o Banco de Dados
    function conectar() {
        try {
        $conexao = new PDO("mysql:host=localhost; dbname=academico", "root", "");
        } catch(PDOException $e) {
            echo $e -> getMessage();
            echo $e -> getCode();
        }

        return $conexao;
    }

?>