<?php

    $notas = array(9,8,5,7,8,9,10,9,10,8,7,10,9);
    $somaNota = 0;

    echo "<br> <b>Notas</b>: ";

    foreach ($notas as $i => $nota) {

        echo "$nota";

        // Calcular média
        $somaNota += $nota;

        if ($i === array_key_last($notas)) {
            echo ".";
        } else {
            echo ", ";
        }
    }

    // Calcular a média
    $media = $somaNota / count($notas);

    echo "<hr>";

    echo "<b>Média</b>: " . number_format($media, 2);
?>