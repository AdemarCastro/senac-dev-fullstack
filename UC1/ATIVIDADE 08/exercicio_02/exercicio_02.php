<?php

    $opnioes = array("S", "S", "S", "N", "S", "N", "N", "S", "S", "S", "S", "N", "S", "S", "N", "S", "S", "S");

    $s = 0;
    $n = 0;

    // S = Sim e N = Não

    foreach ($opnioes as $opniao) {

        if ($opniao === "S") {
            $s++;
        } else {
            $n++;
        }
    }

    echo "<br> Nº pessoas que responderam SIM: $s";
    echo "<br><br> Nº pessoas que responderam NÃO: $n";
?>