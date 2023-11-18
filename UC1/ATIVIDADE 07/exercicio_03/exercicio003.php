<?php

    if (isset($_GET['valor'])) {
        $valor = $_GET['valor'];

        echo "<br> <b>Valor pré-definido: $valor</b>";
    }

    for ($i = $valor; $i > 0; $i--) {

        // Números reservados
        if($i <= 200 && $i >= 100) continue;

        echo "<br><br> Ficha nº: $i";
    }

    // continue => Pula para o próximo ciclo for
    // break => Interrompe o ciclo for e encerra o bloco

?>