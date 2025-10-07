<?php
/**
 * Arquivo: logout.php
 * -----------------------------------------------------------------------------
 * Responsabilidade: Encerrar a sessão do usuário de forma segura,
 * registrar o log de saída e redirecioná-lo para a página de login.
 */

// Carrega a base do sistema para termos acesso às funções e à sessão.
require_once 'config/init.php';

// Verifica se havia um usuário logado antes de destruir a sessão.
if (isset($_SESSION['user_id'])) {
    // Se sim, registra o log de logout bem-sucedido.
    // ID 3 = Logout (definido em nosso banco de dados)
    registrarLog(3, 'Logout bem-sucedido.');
}

// 1. Limpa todas as variáveis da sessão (ex: $_SESSION['user_id'] deixa de existir).
session_unset();

// 2. Destrói completamente a sessão no servidor.
session_destroy();

// 3. Inicia uma sessão nova e limpa, apenas para carregar a mensagem de feedback.
session_start();

// 4. Define uma mensagem de sucesso para o usuário ver na próxima página.
//definirFeedback('sucesso', 'Você saiu do sistema com segurança.');

// 5. Redireciona o usuário para a página de login.
// Usamos a versão JS que é mais robusta para o seu ambiente.
redirecionarJS('login.php');

?>