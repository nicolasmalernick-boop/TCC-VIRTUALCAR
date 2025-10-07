<?php
// validar.php

// Inicia a sessão no topo do arquivo.
session_start();

// Inclui o arquivo de funções.
require_once 'function.php';

// Verifica se os dados do formulário foram enviados via POST.
if ($_SERVER["REQUEST_METHOD"] === "POST") {

    // Pega o valor da ação do formulário.
    $action = $_POST['action'] ?? '';

    // Limpa a sessão antes de qualquer processamento, para evitar a mistura de dados.
    session_unset();
    session_destroy();
    session_start(); // Inicia uma nova sessão limpa.

    switch ($action) {
        case 'login':
            $email = isset($_POST['email_usuario']) ? trim($_POST['email_usuario']) : '';
            $senha = isset($_POST['senha_usuario']) ? $_POST['senha_usuario'] : '';
            $id_tipo_funcionario = isset($_POST['id_tipo_funcionario']) ? intval($_POST['id_tipo_funcionario']) : 0;
            
            $usuario_autenticado = validarLogin($email, $senha, $id_tipo_funcionario);

            if ($usuario_autenticado) {
                // Login bem-sucedido: Armazena dados na sessão e redireciona.
                $_SESSION['usuario'] = $usuario_autenticado;
                $_SESSION['id_oficina_atual'] = $usuario_autenticado['id_oficina_principal'];
                $_SESSION['modal_tipo'] = 'sucesso';
                $_SESSION['modal_mensagem'] = 'Login bem-sucedido!';

                // --- INÍCIO DA LÓGICA DE LOG ---
                // ID 1 para o tipo de ação 'Login' na tabela tb_tipo_acao_log.
                $id_tipo_acao_log_sucesso = 1; 

                // Registra a ação de login no log.
                registrarLog(
                    'Login bem-sucedido', 
                    $usuario_autenticado['id_usuario'], 
                    $usuario_autenticado['id_oficina_principal'], 
                    $id_tipo_acao_log_sucesso
                );
                // --- FIM DA LÓGICA DE LOG ---

                header('Location: painel/index.php');
                exit;
            } else {
                // Login falhou: Armazena a mensagem de erro e redireciona.
                $_SESSION['modal_tipo'] = 'erro';
                $_SESSION['modal_mensagem'] = 'E-mail, senha ou tipo de funcionário incorretos.';
                header('Location: login.php');
                exit;
            }
            break;

        default:
            $_SESSION['modal_tipo'] = 'erro';
            $_SESSION['modal_mensagem'] = 'Ação de formulário inválida.';
            header('Location: login.php');
            exit;
    }
} else {
    header('Location: login.php');
    exit;
}
?>