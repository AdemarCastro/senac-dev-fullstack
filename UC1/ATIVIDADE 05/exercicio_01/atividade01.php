<?php

    echo "------------------------ Exercício 01 ------------------------";

    // Recebendo o valor da pagina HTML
    if(isset($_GET['valor'])) {
        $valor = $_GET['valor'];
        echo "<br><br> O valor digitado foi: " . $valor;
        // Aqui você pode usar a variável $valor como desejar no restante do seu código PHP
    }

    // Verificando a exceção
    if ($valor > 10) {
        $resultado = $valor * 2;
    } else {
        $resultado = $valor * 3;
    }

    // Exibir Resultado
    echo "<br><br> Valor total de suas compras: R$ " . $resultado;
?>