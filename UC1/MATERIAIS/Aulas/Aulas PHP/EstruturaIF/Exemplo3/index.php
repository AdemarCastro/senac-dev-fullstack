<?php
//Estrutura Condicional Composta

$qualSuaIdade = 65;

$idadeCrianca = 12;
$idadeMaior = 18;
$idadeMelhor = 60;

if ($qualSuaIdade <= $idadeCrianca)
{
    echo "É uma criança";
}
else if($qualSuaIdade < $idadeMaior)
{
    echo "Você é um adolescente";
}
else if($qualSuaIdade < $idadeMelhor)
{
    echo "Você é um adulto";
}
else
{
    echo "Você é um idoso";
}
    



?>