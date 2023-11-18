<?php

    $x = 1;

    if (isset($_GET['valor'])) {
        $valor = $_GET['valor'];

        echo "<br> <b>Valor pré-definido: $valor</b>";
        echo "<br>";
    }

    for ($i = 56898; $i > (56898 - 25); $i--) {

        echo "<br> Indice: $x";
        echo "<br><br> Id da Carteira: $i";
        echo "<br> <hr>";

        $x++; // Indice da Carteira
    }

?>