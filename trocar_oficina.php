<?php
/**
 * Arquivo: trocar_oficina.php
 * -----------------------------------------------------------------------------
 * Responsabilidade: Processar a troca de oficina ativa do usuário na sessão.
 */

// 1. INICIALIZAÇÃO
require_once 'config/init.php';

// 2. SEGURANÇA BÁSICA
protegerPagina(); // Garante que apenas usuários logados possam trocar de oficina

// 3. PROCESSAMENTO
$novaOficinaId = isset($_GET['id_oficina']) ? (int)$_GET['id_oficina'] : 0;
$oficinasPermitidas = $_SESSION['user_oficinas_acesso'] ?? [];
$temPermissao = false;

// Validação de segurança: verifica se a oficina escolhida está na lista de permissões do usuário
foreach ($oficinasPermitidas as $oficina) {
    if ($oficina['id_oficina'] == $novaOficinaId) {
        $temPermissao = true;
        break;
    }
}

if ($novaOficinaId > 0 && $temPermissao) {
    // Se a permissão for válida, atualiza a oficina atual na sessão
    $_SESSION['user_oficina_atual_id'] = $novaOficinaId;
    
    // Registra a ação no log
    registrarLog(13, "Usuário trocou a visualização de oficina."); // Assumindo que 12 seja o ID para "Troca de Oficina" em tb_tipo_acao_log

} else {
    // Se a tentativa for inválida, define um feedback de erro
    definirFeedback('erro', 'Você não tem permissão para acessar a oficina selecionada.');
}

// Redireciona de volta para o dashboard para que a mudança tenha efeito
redirecionarJS('painel/index.php');

?>