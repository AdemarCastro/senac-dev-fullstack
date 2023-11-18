<?php

    if (isset($_GET['codigo'])) {
        $codigo = $_GET['codigo'];

        echo "<br> Código inserido: $codigo";
    }

    switch($codigo) {
        case 1:
            echo "<br><br> Aguardando pagamento";
        break;

        case 2:
            echo "<br><br> Pago";
        break;

        case 3:
            echo "<br><br> Em transporte";
        break;

        case 4:
            echo "<br><br> Entregue";
        break;
    }

?>