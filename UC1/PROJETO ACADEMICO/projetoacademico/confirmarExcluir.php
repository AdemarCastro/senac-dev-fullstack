<?php

    // 1 - Iniciando a sessão
    session_start();
    ob_start(); // Limpar o buffer de memória -> Limpe e pegue a sessão correta

    // 2 - Criar a mensagem de confirmação e exclusão
    $id = filter_input(INPUT_GET, "id", FILTER_SANITIZE_NUMBER_INT);

    echo "<p style='color: #f00;'>Tem certeza que deseja excluir esse registro?</p>";

    echo "<a href='excluir.php?id=$id'>Sim</a>";
    echo "<a href='listar.php'>Não</a>";
?>