<?php

// Como criar uma faixa de exceção para não imprimir de 200 até 800

for ($i = 0; $i <= 1000; $i += 5) {

    if ($i >= 200 && $i <= 800) continue;

    echo $i . "<br>";
}   

?>