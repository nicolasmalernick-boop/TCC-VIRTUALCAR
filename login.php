<?php
/**
 * Arquivo: login.php
 * v4.0 - Versão simplificada, apenas para exibição do formulário.
 */

// Carrega o inicializador (que já inicia a sessão).
require_once 'config/init.php';

// Se o usuário já está logado, redireciona para o painel.
if (isset($_SESSION['user_id'])) {
    redirecionarJS('painel/index.php');
}
?>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="utf-8">
    <title>Login - VirtualCar</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <link href="<?php echo BASE_URL; ?>img/virtual_car_favicon.png" rel="icon">
    <link href="https://fonts.googleapis.com/css2?family=Barlow:wght@600;700&family=Ubuntu:wght@400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    <link href="<?php echo BASE_URL; ?>lib/animate/animate.min.css" rel="stylesheet">
    <link href="<?php echo BASE_URL; ?>lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="<?php echo BASE_URL; ?>lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
    <link href="<?php echo BASE_URL; ?>css/bootstrap.min.css" rel="stylesheet">
    <link href="<?php echo BASE_URL; ?>css/style.css" rel="stylesheet">
    <style>
        .login-image-section { background: url('<?php echo BASE_URL; ?>img/virtual_car_logo.png') no-repeat center center; background-size: cover; }
        @media (max-width: 991.98px) { .login-image-section { min-height: 40vh; } }
    </style>
</head>

<body>
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status"><span class="sr-only">Carregando...</span></div>
    </div>

    <div class="container-fluid p-0">
        <div class="row g-0 min-vh-100">
            <div class="col-lg-7 login-image-section wow fadeIn" data-wow-delay="0.1s"></div>
            <div class="col-lg-5 d-flex flex-column align-items-center justify-content-center wow fadeInRight" data-wow-delay="0.3s">
                <div class="p-5" style="width: 100%; max-width: 450px;">
                    <div class="text-center mb-4">
                        <a href="#" class="navbar-brand"><h1 class="m-0 text-primary"><i class="fa fa-car me-3"></i>VirtualCar</h1></a>
                        <h3 class="mt-4">Bem-vindo de volta!</h3>
                    </div>

                    <form action="login_processa.php" method="POST">
                        <div class="form-floating mb-3">
                            <input name="email" type="email" class="form-control" id="floatingInput" placeholder="seu@email.com" required>
                            <label for="floatingInput">Seu Email</label>
                        </div>
                        <div class="form-floating mb-4">
                            <input name="senha" type="password" class="form-control" id="floatingPassword" placeholder="Senha" required>
                            <label for="floatingPassword">Sua Senha</label>
                        </div>
                        <div class="d-grid mb-3">
                            <button type="submit" class="btn btn-primary py-3">Entrar</button>
                        </div>
                    </form>
                    <p class="text-center mt-4 text-muted"><a href="#">Esqueceu sua senha?</a></p>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="<?php echo BASE_URL; ?>lib/wow/wow.min.js"></script>
    <script src="<?php echo BASE_URL; ?>lib/easing/easing.min.js"></script>
    <script src="<?php echo BASE_URL; ?>lib/waypoints/waypoints.min.js"></script>
    <script src="<?php echo BASE_URL; ?>lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="<?php echo BASE_URL; ?>lib/tempusdominus/js/moment.min.js"></script>
    <script src="<?php echo BASE_URL; ?>lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="<?php echo BASE_URL; ?>lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
    <script src="<?php echo BASE_URL; ?>js/main.js"></script>
    
    <?php include 'includes/modal_feedback.php'; ?>
    <?php
    if (isset($_SESSION['feedback'])):
        $feedback = $_SESSION['feedback'];
        unset($_SESSION['feedback']);
    ?>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            abrirModal('<?php echo $feedback['tipo']; ?>', '<?php echo addslashes($feedback['mensagem']); ?>');
        });
    </script>
    <?php endif; ?>
</body>
</html>