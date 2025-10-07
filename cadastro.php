<?php require_once 'header.php'; ?>

<head>
    <style>
        /* Estilo para a imagem fixa à esquerda */
        .login-image-section {
            background: url("img/virtual_car_logo.png") no-repeat center center;
            background-size: cover;
            position: fixed;
            top: 0;
            left: 0;
            height: 100vh;
            /* Ocupa 100% da altura da tela */
            width: 58%;
            /* Corresponde à classe col-lg-7 do Bootstrap */
        }

        /* Estilo para a seção do formulário à direita com rolagem */
        .form-scroll-section {
            height: 100vh;
            /* Ocupa 100% da altura da tela */
            overflow-y: auto;
            /* Adiciona rolagem vertical apenas quando necessário */
            margin-left: 58.333333%;
            /* Empurra o formulário para a direita da imagem */
        }

        /* Ajustes para telas menores (responsividade) */
        @media (max-width: 991.98px) {
            .login-image-section {
                position: static;
                /* Remove a posição fixa */
                width: 100%;
                height: auto;
                min-height: 40vh;
                /* Altura mínima para a imagem */
            }

            .form-scroll-section {
                height: auto;
                /* Altura volta ao padrão */
                overflow-y: visible;
                /* Rolagem padrão da página */
                margin-left: 0;
                /* Remove a margem */
                width: 100%;
            }
        }
    </style>
</head>

<body>
    <div id="spinner"
        class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    <div class="container-fluid p-0">
        <div class="row g-0">
            <div class="col-lg-7 login-image-section wow fadeIn" data-wow-delay="0.1s"></div>

            <div class="col-lg-5 d-flex flex-column align-items-center justify-content-start py-5 wow fadeInRight form-scroll-section"
                data-wow-delay="0.3s">
                <div class="p-5" style="width: 100%; max-width: 450px">
                    <div class="text-center mb-4">
                        <a href="index.html" class="navbar-brand">
                            <h1 class="m-0 text-primary">
                                <i class="fa fa-car me-3"></i>VirtualCar
                            </h1>
                        </a>
                        <h3 class="mt-4">Crie sua conta</h3>
                    </div>
                    <hr />
                    <form>
                        <div class="mb-4">
                            <h4 class="mt-4">Dados da Oficina</h4>
                        </div>

                        <div class="form-floating mb-2">
                            <input type="text" class="form-control" id="nome_oficina" placeholder="Nome da Oficina"
                                required />
                            <label>Nome da Oficina</label>
                        </div>

                        <div class="form-floating mb-2">
                            <input type="text" class="form-control" id="cidade" placeholder="Cidade" required />
                            <label>Cidade</label>
                        </div>

                        <div class="form-floating mb-2">
                            <input type="text" class="form-control text-uppercase" id="estado" placeholder="Estado"
                                required />
                            <label>UF</label>
                        </div>

                        <div class="mb-4">
                            <h4 class="mt-4">Dados do Usuário</h4>
                        </div>

                        <div class="row g-2 mb-2">
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="firstName" placeholder="Seu Nome"
                                        required />
                                    <label for="firstName">Nome</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="lastName" placeholder="Seu Sobrenome"
                                        required />
                                    <label for="lastName">Sobrenome</label>
                                </div>
                            </div>
                        </div>

                        <div class="form-floating mb-2">
                            <input type="email" class="form-control" id="email" placeholder="seu@email.com" required />
                            <label for="email">Seu Email</label>
                        </div>

                        <div class="row g-2 mb-2">
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="password" class="form-control" id="password" placeholder="Senha"
                                        required />
                                    <label for="password">Senha</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="password" class="form-control" id="confirmPassword"
                                        placeholder="Confirme a Senha" required />
                                    <label for="confirmPassword">Confirmar Senha</label>
                                </div>
                            </div>
                        </div>

                        <div class="form-floating mb-2">
                            <input type="date" class="form-control" id="birthDate" placeholder="Data de Nascimento"
                                required />
                            <label for="birthDate">Data de Nascimento</label>
                        </div>

                        <div class="form-floating mb-3">
                            <select class="form-select" id="userType" aria-label="Tipo de Usuário" required>
                                <option disabled selected value="">Selecione um tipo</option>
                                <option value="admin">Administrador</option>
                                <option value="financeiro">Financeiro</option>
                                <option value="operador">Operador</option>
                            </select>
                            <label for="userType">Tipo de Usuário</label>
                        </div>

                        <div class="d-grid mb-2">
                            <input type="hidden" name="action" value="Cadastrar">
                            <input type="submit" class="btn btn-primary py-3" value="Cadastrar">
                        </div>
                    </form>

                    <p class="text-center mt-3 text-muted">
                        Já tem uma conta? <a href="login.php">Faça Login</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</body>

</html>