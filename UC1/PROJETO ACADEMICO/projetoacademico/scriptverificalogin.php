<?php
    // Verificando a sessão de usuário não existe
    // Caso seja verdadeiro, redirecionar para o login.php
    if (!$_SESSION['usuario']) {
        header("Location: login.php");
        exit();
    }

?>