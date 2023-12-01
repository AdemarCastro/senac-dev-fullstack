<?php

    session_start(); // Iniciando uma sessão

?>

<!-- Mostrar o nome do usuário -->

<div align="right">
    <h2>Olá, <?php echo $_SESSION['usuario']; ?> </h2>
</div>

<!-- Link para encerrar a sessão do usuário -->
<nav align="right">
    <button><a style="color: black; text-decoration: none;" href="scriptlogout.php">Logout</a></button>
</nav>