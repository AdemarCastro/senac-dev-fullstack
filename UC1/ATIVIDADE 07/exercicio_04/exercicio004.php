<?php

    if (isset($_GET['valor'])) {

        $valor = $_GET['valor'];

        echo "<br> <b>Valor pré-definido: $valor</b>";
    }

    for ($i = 1; $i <= 1000; $i++) {

        $numero_aleatorio = rand(0, 1000);

        if ($numero_aleatorio === 0) {
            echo "<br><br> Nº $i sorteado: $numero_aleatorio";
            echo "<hr>";
            echo "<br> O número ZERO foi sorteado, então o programa será <b>encerrado!</b>";

            break;
        }

        echo "<br><br> Nº $i sorteado: $numero_aleatorio";
    }

?>