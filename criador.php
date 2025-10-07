<?php

// A senha em texto puro que você quer criptografar.
$senha_pura = '123';

// Gera o hash de forma segura.
// PASSWORD_DEFAULT utiliza o algoritmo mais forte e atual disponível (atualmente, o Bcrypt).
$hash_final = password_hash($senha_pura, PASSWORD_DEFAULT);

// Exibe o hash gerado.
echo "O hash da senha '{$senha_pura}' é: " . $hash_final;

?>