<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Método POST</title>

    <style>
        .container{
            width: 400px;
            margin-left: auto;
            margin-right: auto;
            background-color: #d3d3d3;
            text-align: center;
            border: 2px solid;
            border-radius: 5px;
            box-shadow: 5px 5px gray;
        }

        input{
            width: 70%;
        }

    </style>
</head>
<body>
    <header><!--Cabeçalho-->
        <h1 style="text-align: center;">Método POST</h1>
    </header>

    <main><!--Conteúdo principal-->
        <br>
        <br>
        <div class="container">
            <h2>Cadastro de Usuários</h2>

            <form action="processa.php" method="post">
                Nome*: <input type="text" name="usuario" placeholder="Digite seu nome" required><br><br>

                E-mail*: <input type="email" name="email" placeholder="Digite o seu melhor e-mail" required><br><br>

                Senha*: <input type="password" name="senha" placeholder="Cadastre uma senha forte de 6 dígitos" required><br><br><br><br>

                <input type="submit" value="Cadastrar">

            </form>
            <br>
        </div>
    </main>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>

    <footer><!--Rodapé-->
        <h5 style="text-align: center;">&copy; Todos os direitos reservados</h5>
    </footer>
</body>
</html>