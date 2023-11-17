<?php

echo "------------------------ Exercício 06 ------------------------";

if (isset($_GET['codigo'])) {
    $codigo = $_GET['codigo'];
    echo "<br><br> Código inserido: " . $codigo;
}

if ($codigo == "1") {
    echo "<br><br> Aguardando pagamento";
} else if ($codigo == "2") {
    echo "<br><br> Pagamento confirmado";
} else if ($codigo == "3") {
    echo "<br><br> Em transporte";
} else if ($codigo == "4") {
    echo "<br><br> Entregue";
}

?>