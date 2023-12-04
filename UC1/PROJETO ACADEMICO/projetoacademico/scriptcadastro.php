<?php

    // Inicializando as sessões
    session_start();

    // Criar conexão com o banco de dados
    include("conexao.php");
    $conexao = conectar();

    // Recuperar dados do formulário utilizando o método POST
    $mat = $_POST['mat'];
    $nome = $_POST['nome'];
    $email = $_POST['email'];
    $senha = MD5($_POST['senha']); // MD5 está criptografando a senha do usuário
    $estatus = $_POST['estatus'];
    $painel = $_POST['painel'];

    // Preparando o INSERT INTO com pseudo-nome para cadastrar no banco de dados

    // Sempre que for utilizar um método utilize a "->"
    $cadastro = $conexao -> prepare(
        "INSERT INTO usuarios(matricula, nome, email, senha, estatus, painel)
        VALUES (:matricula, :nome, :email, :senha, :estatus, :painel)"
    );

    // Passando os dados das variáveis para os pseudo-nomes através do método bindValue
    // Esse processo dificulta a invasão de informações
    $cadastro -> bindValue(":matricula", $mat);
    $cadastro -> bindValue(":nome", $nome);
    $cadastro -> bindValue(":email", $email);
    $cadastro -> bindValue(":senha", $senha);
    $cadastro -> bindValue(":estatus", $estatus);
    $cadastro -> bindValue(":painel", $painel);

    // Verificar se o e-mail do usuário já não está registrado no banco de dados
    $verificar = $conexao -> prepare(
        "SELECT * FROM usuarios WHERE email = ?"
    );

    $verificar -> execute(array($email));
    $consultaEmail = $verificar -> rowCount();

    if ($consultaEmail == 0):
        $cadastro -> execute();
        echo "Usuário cadastrado com sucesso!";
    else:
        echo "E-mail já cadastrado!";
    endif;

    // Criando as sessões "cadastrado" e "não_cadastrado"
    if ($result == 1) {
        $_SESSION['cadastrado'] = true;
        header('Location: cadastro.php');
        exit();
    } else {
        $_SESSION['nao_cadastrado'] = true;
        header('Location: cadastro.php');
        exit();
    }

?>