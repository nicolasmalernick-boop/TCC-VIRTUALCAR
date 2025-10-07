<?php
/**
 * Arquivo: login_processa.php
 * v2.0 - Reintroduzido na arquitetura, usando redirecionamento JS.
 */

// 1. INICIALIZAÇÃO
require_once 'config/init.php';

// 2. VALIDAÇÃO DA REQUISIÇÃO
if ($_SERVER['REQUEST_METHOD'] !== 'POST' || empty($_POST['email']) || empty($_POST['senha'])) {
    redirecionarJS('login.php');
}

// 3. PROCESSAMENTO
$email = $_POST['email'];
$senha = $_POST['senha'];

if (realizarLogin($email, $senha)) {
    // SUCESSO
    definirFeedback('sucesso', 'Login realizado com sucesso. Boas-vindas!');
    redirecionarJS('painel/index.php');
} else {
    // FALHA
    definirFeedback('erro', 'Usuário ou senha inválidos. Por favor, tente novamente.');
    redirecionarJS('login.php');
}

?>