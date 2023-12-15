<?php
session_start();
ob_start(); //limpar o buffer de memória

//1- Conectando o Banco de Dados
include("conexao.php");
$conn = conectar();

//2- Receber id do usuário através da URL que desejo excluir
$id = filter_input(INPUT_GET, "id", FILTER_SANITIZE_NUMBER_INT);

//3- Verificar se o id é diferente de vazio. Se vem um valor pela URL
if(empty($id)){
    $_SESSION['msg'] = "<p style='color: #f00;'>Erro: Usuário não encontrado</p>";
    header("Location: listar2.php");
}

//4- Pesquisar no banco de dados pelo usuário para exclusão
$query_usuario = "SELECT id FROM usuarios WHERE id=$id LIMIT 1";

//5- Preparar a query
$result_usuario = $conn->prepare($query_usuario);

//6- Executando a query
$result_usuario->execute();

//7- Verificar se encontrou algum registro na consulta
if($result_usuario->rowCount() != 0){
    //Excluir o registro no banco de dados
    $query_del_usuario = "DELETE FROM usuarios WHERE id=$id";
    $result_del_usuario = $conn->prepare($query_del_usuario);

    //Execução da query excluir
    if($result_del_usuario->execute()){

        $_SESSION['msg'] = "<p style='color: green; text-align: center;'>Usuário excluido com sucesso!</p>";
        header("Location: listar2.php");
    }else{
        $_SESSION['msg'] = "<p style='color: #f00;'>Erro: Usuário não excluido</p>";
        header("Location: listar2.php");
    }
}else{
    $_SESSION['msg'] = "<p style='color: #f00;'>Erro: Usuário não encontrado</p>";
    header("Location: listar2.php");
}
// O Script de excluir pode ser testado....
?>