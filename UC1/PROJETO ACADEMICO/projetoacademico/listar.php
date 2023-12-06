<?php

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
        ><a href="cadastrar.php">Cadastrar</a></h1>
    </div>

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
            </tr>
        </thead>
        <tbody>
        <?php

            // 2 - Criando a consulta de registros de usuários
            $query_usuarios = $conexao -> prepare("SELECT id, matricula, nome, email, estatus, data_cadastro FROM usuarios");

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
                    echo "<td>" . $rowUsuarios['data_cadastro'] . "</td>";

                    $x = $x + 1;
                }

            } else {

                echo "<p style='color: red;'>Erro: Usuário não encontrado </p>";
            }
            ?>
        </tbody>
    </table>
</body>
</html>