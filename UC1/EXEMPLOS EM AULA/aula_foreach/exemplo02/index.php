<?php

    // Mostrando a posição que o valor esta no array

    $meses = array ("Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro");

    // Utilizado para guardar a posição do array
    foreach ($meses as $index => $mes) {
        echo "O indice: $index <br>";
        echo "O mês é: $mes <br><br>";
    }

?>