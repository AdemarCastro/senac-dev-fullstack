<?php

    echo "------------------------ Exercício 02 ------------------------";

    // Recebendo os valores da pagina HTML
    if(isset($_GET['sexo']) && isset($_GET['idade'])) {
        $sexo = $_GET['sexo'];
        $idade = $_GET['idade'];

        echo "<br><br> Sexo: " . $sexo;
        echo "<br><br> Idade: " . $idade;
    }

    // Verificando a exceção
    if ($sexo == "F" || $sexo == "f" && $idade >= 18 && $idade < 25) {
        echo "<br><br>ACEITA!";
    } else {
        echo "<br><br>NÃO ACEITA!";
    }
?>