<?php

    session_start();

    // 1 - Conectar com o Banco de Dados
    include("conexao.php");
    $conexao = conectar();

    // 2 - Verificar se os campos estão vazios
    if (empty($_POST['email']) || empty($_POST['senha'])) { // empty é uma função que verifica se o campo está vazio
        header("Location:login.php"); // Redirecionando para a página de login

        exit();
    }

    // 3 - Recuperando os dados do formulário
    $email = $_POST['email'];
    $senha = md5($_POST['senha']);

    // 4 - Criar uma Query com o Banco de Dados para validar os dados cadastrados utilizando SQL
    // método de segurança do PDO -> Variáveis falsas com o uso de ":e"
    $query = $conexao -> prepare(
        "SELECT id FROM usuarios
        WHERE email = :e AND senha = :s"
    );

    // 5 - Validar os dados do usuário através de um método chamado bindValue
    $query -> bindValue(":e", $email);
    $query -> bindValue(":s", $senha);

    // 6 - Executando a consulta com o método execute() - runCount() conta quantas linhas de consulta foi retornada
    $query -> execute();

    // 7 - Armazenando o resultado da consulta em uma variável
    $row = $query -> rowCount();

    // 8 - Sistema de Login Simples com uma única seção
    if ($row == 1) {
        $_SESSION['usuario'] = $email;
        header('Location: painel.php');
        exit();
    } else {
        $_SESSION['nao_autenticado'] = true;
        header('Location: login.php');
        exit();
    }
    // echo $row;
?>