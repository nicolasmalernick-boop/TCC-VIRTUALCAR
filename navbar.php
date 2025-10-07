<head>
    <style>
        #logo-principal {
            height: 220px;
            /* <-- Ajuste esta altura como preferir */
            width: auto;
            /* Mantém a proporção correta da imagem */
        }
    </style>
</head>

<nav class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0">
    <a href="index.php" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
        <img src="./img/virtual_car_png.png" alt="" id="logo-principal" />
    </a>
    <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
        <div class="navbar-nav ms-auto p-4 p-lg-0">
            <a href="index.php" class="nav-item nav-link active">Home</a>
            <a href="#about" class="nav-item nav-link">Sobre</a>
            <a href="#servicos" class="nav-item nav-link">Serviços</a>
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                <div class="dropdown-menu fade-up m-0">
                    <a href="#booking" class="dropdown-item">Booking</a>
                    <a href="#equipe" class="dropdown-item">Equipe</a>
                    <a href="#testemunhos" class="dropdown-item">Testemunhos</a>
                    <a href="404.php" class="dropdown-item">404 Page</a>
                </div>
            </div>
            <a href="contact.php" class="nav-item nav-link">Contato</a>
        </div>
        <a href="login.php" class="btn btn-primary py-4 px-lg-5 d-none d-lg-block">Fazer Login<i
                class="fa fa-arrow-right ms-3"></i></a>
    </div>
</nav>