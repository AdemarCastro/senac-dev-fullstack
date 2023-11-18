<?php

    if (isset($_GET['valor'])) {
        $valor = $_GET['valor'];

        echo "<br> <b>Valor inserido: $valor</b>";
        echo "<br>";
    }

    // Definindo o fuso horário
    date_default_timezone_set('America/Manaus');

    for ($i = $valor; $i <= ($valor + 50); $i++) {
        
        $dataHoraAtual = date('d-m-Y H:i:s');

        echo "<br><br> Data e hora atuais: " . $dataHoraAtual;
        echo "<br> Valor + 1: $i";
        echo "<br> <hr>";
    }

?>