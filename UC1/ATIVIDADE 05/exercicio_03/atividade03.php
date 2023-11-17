<?php

    echo "------------------------ Exercício 03 ------------------------";

    // Recebendo os valores da pagina HTML
    if (isset($_GET['salario']) && isset($_GET['codigo'])) {
        $salario = $_GET['salario'];
        $codigo = $_GET['codigo'];

        echo "<br><br> Salário: R$" . $salario;
        echo "<br><br> Código: " . $codigo;
    }

    // Verificando a exceção
    if ($codigo == "91") {
        echo "<br><br>Seu Cargo: Gerente";
        
        $resultado = $salario * 1.10;

        echo "<br>Percentual usado no aumento: 10%";
        echo "<br>Salário com o aumento: " . $resultado;
    } else  if ($codigo == "92") {
        echo "<br><br>Seu Cargo: Analista";
        
        $resultado = $salario * 1.20;

        echo "<br>Percentual usado no aumento: 20%";
        echo "<br>Salário com o aumento: " . $resultado;
    } else if ($codigo == "93") {
        echo "<br><br>Seu Cargo: Técnico";
        
        $resultado = $salario * 1.30;

        echo "<br>Percentual usado no aumento: 30%";
        echo "<br>Salário com o aumento: " . $resultado;
    } else {
        echo "<br><br>Seu Cargo: Indefinido";
        
        $resultado = $salario * 1.35;

        echo "<br>Percentual usado no aumento: 35%";
        echo "<br>Salário com o aumento: " . $resultado;
    }
?>