<?php

    session_start();
    ob_clean(); // Limpar o buffer de memória -> Limpe e pegue a sessão correta

    // 1 - Conectando o Banco de Dados
    include("conexao.php");
    $conexao = conectar();

    // 2 - Receber ID do usuário através da URL que deseja excluir
    $id = filter_input(INPUT_GET, "id", FILTER_SANITIZE_NUMBER_INT);

    // 3 - Verificar se o id é diferente de vazio. Se vem um valor pela URL
    if (empty($id)) {

        $_SESSION['msg'] = "<p style='color: #f00;'>Erro: Usuário não existe</p>";
        header("Location: listar.php");
    }

    // 4 - Pesquisar no Banco de Dados pelo usuário para exclusão
    $query_usuario = "SELECT id FROM usuarios WHERE id = $id LIMIT 1";

    // 5 - Preparando a query
    $result_usuario = $conexao -> prepare($query_usuario);

    // 6 - Executando a query
    $result_usuario -> execute(); // Vem em formato de indice valor

    // 7 - Verificar se encontrou algum registro na consulta
    if ($result_usuario -> rowCount() != 0) {

        // Excluir o registro no banco de dados
        $query_del_usuario = "DELETE FROM usuarios WHERE id = $id";
        $result_del_usuario = $conexao -> prepare($query_del_usuario);
        
        // Execução
        if ($result_del_usuario -> execute()) {

            $_SESSION['msg'] = "<p style='color: #0f0;'>Usuário excluído com sucesso!</p>";
            header("Location: listar.php");
        }
    } else {
        $_SESSION['msg'] = "<p style='color: #f00;'>Usuário não encontrado!</p>";
        header("Location: listar.php");
    }

?>

