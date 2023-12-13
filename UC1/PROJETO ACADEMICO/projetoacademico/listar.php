<?php

    session_start();
    ob_start(); // Limpando o Buffer da saída do redirecionamento

    // Realizando a conexão com o banco de dados
    include("conexao.php");
    $conexao = conectar();

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listar Registros</title>

    <style>
        /* Estilo para a linha */
        .linha-horizontal {
            border-bottom: 1px solid #000; /* Adapte o estilo conforme necessário */
            margin-bottom: 5px; /* Espaçamento entre os usuários */
            width: 200px;
        }
        
        a {
            text-decoration: none;
            color: black;
        }

        a:hover {
            color: #404040;
        }

        /* Estilo para a tabela */
        table {
            width: 100%;
            border-collapse: collapse;
            border-spacing: 0;
        }

        /* Estilo para o cabeçalho da tabela */
        th {
            background-color: #f2f2f2;
            font-weight: bold;
            padding: 8px;
            text-align: left;
        }

        /* Estilo para as células da tabela */
        td {
            border-bottom: 1px solid #ddd;
            padding: 8px;
        }

        /* Estilo para linhas alternadas (opcional) */
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
    <div style="width: 100%;">
        <h1 
            style="float: left;"
        >Listar Registros</h1>
        <h1 
            style="float: right;"
        ><a href="cadastro.php">Cadastrar</a></h1>
    </div>

    <?php

        // Verficando se a sessão MSG existe
        if (isset($_SESSION['msg'])) {
            echo $_SESSION['msg'];
        }

        // Destruindo a sessão
        unset($_SESSION['msg']);
    ?>

    <br><br><br><br>
    <hr>
    <br>

    <table>
        <thead>
            <tr>
                <th>Usuário Nº</th>
                <th>Id</th>
                <th>Matrícula</th>
                <th>Nome</th>
                <th>Email</th>
                <th>Estatus</th>
                <th>Data Cadastro</th>
                <th>Data Edição</th>
                <th>Gerenciador</th>
            </tr>
        </thead>
        <tbody>

        <?php

            /* -------------------------- PAGINAÇÃO - PARTE 1 - INÍCIO -------------------------- */
                // 1 - Criando uma variável para informar a página atual usando GET
                // http://localhost/projetoacademico/listar.php?page=1

                // 2 - Criando uma variável para receber o número da página atual para URL
                $pagina_atual = filter_input(INPUT_GET, "page", FILTER_SANITIZE_NUMBER_INT);

                // 3 - Verificar se a numeração não foi enviada através da URL
                $pagina = (!empty($pagina_atual)) ? $pagina_atual : 1;

                // 4 - Setar a quantidade de registros por página
                $limite_result = 2;

                // 5 - Calcular o início de visualização (precisamos identificaro número a partir de qual registro irá iniciar a próxima página)
                $inicio = ($limite_result * $pagina) - $limite_result;

            /* -------------------------- PAGINAÇÃO - PARTE 1 - FINAL -------------------------- */

            // 2 - Criando a consulta de registros de usuários
            $query_usuarios = $conexao -> prepare("SELECT id, matricula, nome, email, estatus, data_cadastro FROM usuarios ORDER BY data_cadastro DESC LIMIT $inicio, $limite_result");

            // 3 - Executando a consulta
            $query_usuarios -> execute();

            
            // 4 - Verificando se encontrou registro no banco de dados
            if ($query_usuarios -> rowCount() != 0) {
                $x = 1;

                // 5 - Transformando em um Array Associativo e Percorrendo com While
                while ($rowUsuarios = $query_usuarios -> fetch(PDO::FETCH_ASSOC)) {

                    extract($rowUsuarios);

                    echo "<tr>";
                    echo "<td>" . $x . "</td>";
                    echo "<td>" . $rowUsuarios['id'] . "</td>";
                    echo "<td>" . $rowUsuarios['matricula'] . "</td>";
                    echo "<td>" . $rowUsuarios['nome'] . "</td>";
                    echo "<td>" . $rowUsuarios['email'] . "</td>";
                    echo "<td>" . $rowUsuarios['estatus'] . "</td>";
                    echo "<td>" . date("d/m/Y H:i:s", strtotime($data_cadastro)) . "</td>";
                    echo "<td>" . date("d/m/Y H:i:s", strtotime($data_cadastro)) . "</td>";
                    echo "<td><a href='editar.php?id=$id'>[Editar]</a> <a href='#'>[Excluir]</a> </td>";
                    $x = $x + 1;
                }
            
            } else {

                echo "<p style='color: red;'>Erro: Usuário não encontrado </p>";
            }

        ?>

            
        </tbody>
    </table>

    <?php
        /* -------------------------- PAGINAÇÃO - PARTE 2 - INÍCIO -------------------------- */
            echo "<br><br><br>";
            // 6 - Contar quantidade de registros no meu banco de dados
            $query_qtd_registros = $conexao -> prepare("SELECT COUNT(id) AS num_result FROM usuarios");
            $query_qtd_registros -> execute();

            $row_qtd_registros = $query_qtd_registros -> fetch(PDO::FETCH_ASSOC);

            // 7 - Identificar a quantidade de páginas para exibir todos os registros (CEIL)
            $qtd_pagina = ceil($row_qtd_registros['num_result'] / $limite_result);

            // 8 - Criar uma variável para informar o máximo de links na página
            $maximo_link = 2;

            // 9 - Mostra o link da primeira página
            echo "<a href='listar.php?page=1'> << </a>";

            // 10 - Listar os links antes da página atual
            for ($pagina_anterior = $pagina - $maximo_link; $pagina_anterior <= $pagina - 1; $pagina_anterior++) {

                if ($pagina_anterior >= 1) {
                    echo "<a href='listar.php?page=$pagina_anterior'> $pagina_anterior </a>";
                }
            }

            // 11 - Mostrar a página atual
            echo "$pagina";

            // 12 - Listar os links posteriores
            for ($pagina_posterior = $pagina + 1; $pagina_posterior <= $pagina + $maximo_link; $pagina_posterior++) {

                if ($pagina_posterior <= $qtd_pagina) {
                    echo "<a href='listar.php?page=$pagina_posterior'> $pagina_posterior </a>";
                }
            }

            // Link da última página
            echo "<a href='listar.php?page=$qtd_pagina> >> </a>";

        /* -------------------------- PAGINAÇÃO - PARTE 2 - FINAL -------------------------- */
    ?>
</body>
</html>