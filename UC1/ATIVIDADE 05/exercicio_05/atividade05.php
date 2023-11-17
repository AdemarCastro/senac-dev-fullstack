<?php

echo "------------------------ Exercício 05 ------------------------";

if (isset($_GET['nota'])) {
    $nota = $_GET['nota'];
    echo "<br><br> Nota inserida: " . $nota;
}

if ($nota >= "8" && $nota = "10") {
    echo "<br><br>CONCEITO: A";
} if else ($nota >= "7" && $nota = "7,9") {
    echo "<br><br>CONCEITO: B";
} if else ($nota >= "6" && $nota = "6,9") {
    echo "<br><br>CONCEITO: C";
} if else ($nota >= "5" && $nota = "5,9") {
    echo "<br><br>CONCEITO: D";
} if else ($nota >= "0" && $nota = "4,9") {
    echo "<br><br>CONCEITO: E";
}

?>