<?php

    echo "------------------------ Exercício 001 ------------------------";

    // Recebendo os valores da pagina HTML
    if (isset($_GET['salario']) && isset($_GET['codigo'])) {
        $salario = $_GET['salario'];
        $codigo = $_GET['codigo'];

        echo "<br><br> Salário: R$ " . $salario;
        echo "<br><br> Código: " . $codigo;
    }

    switch($codigo) {
        case 1:
            echo "<br><br> Seu cargo é: Escriturário";
            echo "<br><br> Seu aumento: 50%";

            // Cálculo do aumento
            $resultado = $salario * 1.50;

            echo "<br><br> Remuneração após o acréscimo: R$ $resultado";
        break;
        
        case 2:
            echo "<br><br> Seu cargo é: Secretário";
            echo "<br><br> Seu aumento: 35%";

            // Cálculo do aumento
            $resultado = $salario * 1.35;

            echo "<br><br> Remuneração após o acréscimo: R$ $resultado";
        break;

        case 3:
            echo "<br><br> Seu cargo é: Caixa";
            echo "<br><br> Seu aumento: 20%";

            // Cálculo do aumento
            $resultado = $salario * 1.20;

            echo "<br><br> Remuneração após o acréscimo: R$ $resultado";
        break;

        case 4:
            echo "<br><br> Seu cargo é: Gerente";
            echo "<br><br> Seu aumento: 10%";

            // Cálculo do aumento
            $resultado = $salario * 1.10;

            echo "<br><br> Remuneração após o acréscimo: R$ $resultado";
        break;

        case 5:
            echo "<br><br> Seu cargo é: Diretor";
            echo "<br><br> Seu aumento: 05%";

            // Cálculo do aumento
            $resultado = $salario * 1.05;

            echo "<br><br> Remuneração após o acréscimo: R$ $resultado";
        break;
    }
?>