<?php

    // Iniciando a sessão
    session_start();
    ob_start();

    // 1 - Conectar com o Banco de Dados
    include("conexao.php");
    $conexao = conectar();

    // 2 - Receber os registros selecionados para a exclusão
    $usuarios_id = filter_input_array(INPUT_POST, FILTER_DEFAULT);

    // 3 - Verificar se o usuário clicou no botão "Excluir usuários"
    if (empty($usuarios_id['delusuarios'])) {

        // Verificar se existe registros na variável $usuarios_id
        if (isset($usuarios_id['id'])) {

            // Considerando que é possível ter um vetor de id, precisamos de uma estrutura de repetição para percorrer o vetor
            // Foreach é a melhor estrutura de repetição para se trabalhar com vetores
            foreach ($usuarios_id['id'] as $id => $usuario) {

                // Criando, Preparando e Executando a query de exclusão
                $query_del_usuarios = "DELETE FROM usuarios WHERE id = $id LIMIT 1";
                $result_del_usuarios = $conexao -> prepare($query_del_usuarios);
                $result_del_usuarios -> execute();                
            }

            // Mensagem de confirmação de exclusão
            $_SESSION['msg'] = "<p style='text-align:center; color: f00;'>Usuário(s) excluído(s) com sucesso!</p>";
            header("Location: listar.php");

        } else {

            // Criar uma mensagem de erro
            $_SESSION['msg'] = "<p style='color: #f00;'>Usuário não encontrado!</p>";
            header("Location: listar.php");
        }

    } else {

        // Criar uma mensagem de erro
        $_SESSION['msg'] = "<p style='color: #f00;'>Usuário não encontrado!</p>";
        header("Location: listar.php");
    }

?>