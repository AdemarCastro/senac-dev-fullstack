<?php

echo "------------------------ Exercício 04 ------------------------";

if (isset($_GET['nota'])) {
    $nota = $_GET['nota'];
    echo "<br><br> Nota inserida: " . $nota;
}

if ($nota >= "7,0") {
    echo "<br><br>Aprovado.";
} else {
    echo "<br><br>Reprovado.";
}

?>