<?php

/*
Exemplo para derrubar o servidor:
Nunca vai chegar no 10.
O PHP não faz uma análise Inteligível
do código, ele faz uma análise sintática.

O servidor vai deixar executar o código
Por uns 60 segundos e ai vai dar erro de
TimeOut e depois de falta de memória
*/

for ($i = 0; $i < 10; $i--) {
    echo $i;
}

?>