<?php require_once 'header.php';?>

<div id="servicos" class="container-xxl service py-5">
        <div class="container">
            <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                <h6 class="text-primary text-uppercase">// Nossas Funcionalidades //</h6>
                <h1 class="mb-5">Explore nossas funcionalidades</h1>
            </div>
            <div class="row g-4 wow fadeInUp" data-wow-delay="0.3s">
                <div class="col-lg-4">
                    <div class="nav w-100 nav-pills me-4">
                        <button class="nav-link w-100 d-flex align-items-center text-start p-4 mb-4 active" data-bs-toggle="pill" data-bs-target="#tab-pane-1" type="button">
                            <i class="fa-solid fa-wrench fa-2x me-3"></i>
                            <h4 class="m-0">Gestão de serviços</h4>
                        </button>
                        <button class="nav-link w-100 d-flex align-items-center text-start p-4 mb-4" data-bs-toggle="pill" data-bs-target="#tab-pane-2" type="button">
                            <i class="fa-solid fa-clock-rotate-left fa-2x me-3"></i>
                            <h4 class="m-0">Histórico de serviços realizados</h4>
                        </button>
                        <button class="nav-link w-100 d-flex align-items-center text-start p-4 mb-4" data-bs-toggle="pill" data-bs-target="#tab-pane-3" type="button">
                            <i class="fa-solid fa-money-bill-wave fa-2x me-3"></i>
                            <h4 class="m-0">Gestão financeira</h4>
                        </button>
                        <button class="nav-link w-100 d-flex align-items-center text-start p-4 mb-0" data-bs-toggle="pill" data-bs-target="#tab-pane-4" type="button">
                            <i class="fa-solid fa-boxes-stacked fa-2x me-3"></i>
                            <h4 class="m-0">Controle de estoque</h4>
                        </button>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="tab-content w-100">
                        <div class="tab-pane fade show active" id="tab-pane-1">
                            <div class="row g-4">
                                <div class="col-md-6" style="min-height: 350px;">
                                    <div class="position-relative h-100">
                                        <img class="position-absolute img-fluid w-100 h-100" src="img/service-1.jpg"
                                            style="object-fit: cover;" alt="">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <h3 class="mb-3">Melhore a gestão do seu negócio</h3>
                                    <p class="mb-4">Automatiza processos e reduz erros, permitindo que sua oficina funcione de maneira mais ágil e organizada</p>
                                    <p><i class="fa fa-check text-success me-3"></i>Cadastro de serviços</p>
                                    <p><i class="fa fa-check text-success me-3"></i>Acompanhamento em tempo real</p>
                                    <p><i class="fa fa-check text-success me-3"></i>Geração de Ordem de Serviço</p>
                                    <!-- <a href="" class="btn btn-primary py-3 px-5 mt-3">Read More<i class="fa fa-arrow-right ms-3"></i></a> -->
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="tab-pane-2">
                            <div class="row g-4">
                                <div class="col-md-6" style="min-height: 350px;">
                                    <div class="position-relative h-100">
                                        <img class="position-absolute img-fluid w-100 h-100" src="img/service-2.jpg"
                                            style="object-fit: cover;" alt="">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <h3 class="mb-3">Todos os seus serviços em um só lugar</h3>
                                    <p class="mb-4">O histórico de serviços permite acompanhar todas as manutenções já realizadas, garantindo precisão e continuidade no atendimento.</p>
                                    <p><i class="fa fa-check text-success me-3"></i>Maior agilidade nos diagnósticos</p>
                                    <p><i class="fa fa-check text-success me-3"></i>Redução de erros e retrabalhos</p>
                                    <p><i class="fa fa-check text-success me-3"></i>Fidelização de Clientes</p>
                                    <!-- <a href="" class="btn btn-primary py-3 px-5 mt-3">Read More<i class="fa fa-arrow-right ms-3"></i></a> -->
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="tab-pane-3">
                            <div class="row g-4">
                                <div class="col-md-6" style="min-height: 350px;">
                                    <div class="position-relative h-100">
                                        <img class="position-absolute img-fluid w-100 h-100" src="img/service-3.jpg"
                                            style="object-fit: cover;" alt="">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <h3 class="mb-3">Relatórios de faturamento</h3>
                                    <p class="mb-4">A gestão financeira integrada permite controlar receitas e despesas em tempo real, garantindo equilíbrio e maior segurança nos resultados.</p>
                                    <p><i class="fa fa-check text-success me-3"></i>Controle de fluxo de caixa</p>
                                    <p><i class="fa fa-check text-success me-3"></i>Planejamento de investimentos</p>
                                    <p><i class="fa fa-check text-success me-3"></i>Redução de falhas contabéis</p>
                                    <!-- <a href="" class="btn btn-primary py-3 px-5 mt-3">Read More<i class="fa fa-arrow-right ms-3"></i></a> -->
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="tab-pane-4">
                            <div class="row g-4">
                                <div class="col-md-6" style="min-height: 350px;">
                                    <div class="position-relative h-100">
                                        <img class="position-absolute img-fluid w-100 h-100" src="img/service-4.jpg"
                                            style="object-fit: cover;" alt="">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <h3 class="mb-3">Gerencie melhor o seu estoque</h3>
                                    <p class="mb-4">O sistema de estoque integrado permite reduzir perdas e otimizar o fluxo de serviços, aumentando a produtividade da equipe.</p>
                                    <p><i class="fa fa-check text-success me-3"></i>Disponibilidade de peças</p>
                                    <p><i class="fa fa-check text-success me-3"></i>Redução de perdas</p>
                                    <p><i class="fa fa-check text-success me-3"></i>Planejamento de compras eficiente</p>
                                    <!-- <a href="" class="btn btn-primary py-3 px-5 mt-3">Read More<i class="fa fa-arrow-right ms-3"></i></a> -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>