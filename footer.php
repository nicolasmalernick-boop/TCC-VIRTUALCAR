<head>
    <style>
        /* Estilo para o botão do WhatsApp no rodapé */
        .whatsapp-button {
            display: inline-flex;
            /* Alinha o ícone e o texto na mesma linha */
            align-items: center;
            /* Centraliza verticalmente o ícone e o texto */
            background-color: #25D366;
            /* Cor verde oficial do WhatsApp */
            color: #fff;
            /* Cor do texto e do ícone */
            padding: 8px 16px;
            /* Espaçamento interno (altura e largura) */
            border-radius: 50px;
            /* Deixa as bordas totalmente arredondadas */
            text-decoration: none;
            /* Remove o sublinhado padrão dos links */
            font-weight: 500;
            /* Deixa a fonte um pouco mais forte */
            transition: all 0.3s ease;
            /* Adiciona uma transição suave para o hover */
        }

        /* Efeito ao passar o mouse por cima */
        .whatsapp-button:hover {
            background-color: #128C7E;
            /* Um tom de verde mais escuro */
            color: #fff;
            /* Mantém a cor do texto branca */
            transform: scale(1.05);
            /* Aumenta levemente o tamanho do botão */
        }

        .whatsapp-button .fab {
            font-size: 1.2rem;
            /* Aumenta um pouco o tamanho do ícone */
        }
    </style>
</head>

<div class="container-fluid bg-dark text-light footer pt-5 mt-5 wow fadeIn" data-wow-delay="0.1s">
    <div class="container py-5">
        <div class="row g-5">
            <div class="col-lg-4 col-md-6">
                <h4 class="text-light mb-4">Contatos</h4>
                <div class="d-flex align-items-center mb-2">
                    <p class="mb-2">
                        <a href="https://wa.me/SEUNUMERO" class="whatsapp-button" target="_blank">
                            <i class="fab fa-whatsapp"></i>Fale Conosco
                        </a>
                    </p>
                </div>
                <div class="d-flex align-items-center">
                    <p class="mb-2"><i class="fa fa-envelope me-3"></i>info@example.com</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <h4 class="text-light mb-4">Links Rápidos</h4>
                <a href="" class="btn btn-link">Saiba Mais</a>
                <a href="" class="btn btn-link">Nossas Funcionalidades</a>
                 <a href="login.php" class="btn btn-link">Login</a>
            </div>
            <div class="col-lg-4 col-md-6">
                <h4 class="text-light mb-4">Redes Sociais</h4>
                <div class="d-flex pt-1 m-n1">
                    <a href="" class="btn btn-outline-light btn-social">
                        <i class="fab fa-twitter"></i>
                    </a>
                    <a href="" class="btn btn-lg-outline-light btn-social">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a href="" class="btn btn-lg-outline-light btn-social">
                        <i class="fab fa-youtube"></i>
                    </a>
                    <a href="" class="btn btn-lg-outline-light btn-social">
                        <i class="fab fa-linkedin-in"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="copyright">
            <div class="row">
                <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                    &copy; <a class="border-bottom" href="#">VirtualCar</a>, Todos os direitos reservados.


                    Desenvolvido por <a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a>
                    <br>Distributed By: <a class="border-bottom" href="https://themewagon.com"
                        target="_blank">ThemeWagon</a>
                </div>
                <div class="col-md-6 text-center text-md-end">
                    <div class="footer-menu">
                        <a href="">Home</a>
                        <a href="">Cookies</a>
                        <a href="">Help</a>
                        <a href="">FQAs</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>