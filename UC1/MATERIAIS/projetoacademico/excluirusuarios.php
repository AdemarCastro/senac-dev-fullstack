<?php
session_start();
ob_start();

//1- Conectar o Banco o Dados
include("conexao.php");
$conn = conectar();

//2 - Receber os registros selecionados para exclusão
$usuarios_id = filter_input_array(INPUT_POST, FILTER_DEFAULT);

//3- Verificar se o usuário clicou no botão "Excluir usuários selecionados" [delusuarios]
if(!empty($usuarios_id['delusuarios'])){

    //Verificar se existe registros na variável $usuarios_id
    if(isset($usuarios_id['id'])){

        /*Considerando que é possível ter um vetor de id,
        precisamos de uma estrutura de repetição para
        percorrer o vetor. */
        foreach ($usuarios_id['id'] as $id => $usuario){

            //Criando, Preparando e Executando a Query de Exclusão
            $query_del_usuarios = "DELETE FROM usuarios WHERE id=$id LIMIT 1";
            $result_del_usuarios = $conn->prepare($query_del_usuarios);
            $result_del_usuarios->execute();
        }

        //Mensagem de confirmação de exclusão
        $_SESSION['msg'] = "<p style='color: green; text-align: center;'>Usuário excluido com sucesso!</p>";
        header("Location: listar2.php");

    }else{//Criar a mensagem de erro.
        $_SESSION['msg'] = "<p style='color: #f00;'>Erro: Usuário não encontrado</p>";
        header("Location: listar2.php");

    }

}else{//Criar a mensagem de erro.
    $_SESSION['msg'] = "<p style='color: #f00;'>Erro: Usuário não encontrado</p>";
    header("Location: listar2.php");
}

?>