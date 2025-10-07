-- =====================================================================
-- SCRIPT MODULAR, COMPLETO E POPULADO PARA O BANCO DE DADOS VIRTUALCAR
-- v8.1 - Versão Definitiva, Completa, Indentada e com AUTO_INCREMENT
-- =====================================================================

-- -----------------------------------------------------
-- Etapa 1: Criação do Banco de Dados
-- -----------------------------------------------------
DROP DATABASE IF EXISTS `db_virtualcar`;
CREATE DATABASE IF NOT EXISTS `db_virtualcar` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `db_virtualcar`;

-- =====================================================
-- MÓDULO 1: CONFIGURAÇÃO E DICIONÁRIOS
-- =====================================================
CREATE TABLE `tb_status_oficina` (
  `id_status_oficina` INT AUTO_INCREMENT PRIMARY KEY,
  `descricao_status` VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE `tb_status_usuario` (
  `id_status_usuario` INT AUTO_INCREMENT PRIMARY KEY,
  `descricao_status` VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE `tb_tipo_funcionario` (
  `id_tipo_funcionario` INT AUTO_INCREMENT PRIMARY KEY,
  `descricao_tipo` VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE `tb_status_cliente` (
  `id_status_cliente` INT AUTO_INCREMENT PRIMARY KEY,
  `descricao_status` VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE `tb_status_veiculo` (
  `id_status_veiculo` INT AUTO_INCREMENT PRIMARY KEY,
  `descricao_status` VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE `tb_status_servico` (
  `id_status_servico` INT AUTO_INCREMENT PRIMARY KEY,
  `descricao_status` VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE `tb_status_peca` (
  `id_status_peca` INT AUTO_INCREMENT PRIMARY KEY,
  `descricao_status` VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE `tb_status_agendamento` (
  `id_status_agendamento` INT AUTO_INCREMENT PRIMARY KEY,
  `descricao_status` VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE `tb_status_os` (
  `id_status_os` INT AUTO_INCREMENT PRIMARY KEY,
  `descricao_status` VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE `tb_status_transacao` (
  `id_status_transacao` INT AUTO_INCREMENT PRIMARY KEY,
  `descricao_status` VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE `tb_tipo_transacao` (
  `id_tipo_transacao` INT AUTO_INCREMENT PRIMARY KEY,
  `descricao_tipo` VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE `tb_metodo_pagamento` (
  `id_metodo_pagamento` INT AUTO_INCREMENT PRIMARY KEY,
  `descricao_pagamento` VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE `tb_tipo_movimentacao` (
  `id_tipo_movimentacao` INT AUTO_INCREMENT PRIMARY KEY,
  `descricao_tipo_movimentacao` VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE `tb_tipo_movimentacao_estoque` (
  `id_tipo_movimentacao_estoque` INT AUTO_INCREMENT PRIMARY KEY,
  `descricao_movimentacao` VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE `tb_tipo_acao_log` (
  `id_tipo_acao_log` INT AUTO_INCREMENT PRIMARY KEY,
  `descricao_tipo_acao_log` VARCHAR(100) NOT NULL
) ENGINE=InnoDB;


-- =====================================================
-- MÓDULO 2: OFICINAS, USUÁRIOS E PERMISSÕES
-- =====================================================
CREATE TABLE `tb_oficina` (
  `id_oficina` INT AUTO_INCREMENT PRIMARY KEY,
  `nm_oficina` VARCHAR(255) NOT NULL,
  `endereco_oficina` VARCHAR(255) NOT NULL,
  `cidade_oficina` VARCHAR(100) NOT NULL,
  `estado_oficina` CHAR(2) NOT NULL,
  `id_status_oficina` INT NOT NULL DEFAULT 1,
  FOREIGN KEY (`id_status_oficina`) REFERENCES `tb_status_oficina`(`id_status_oficina`)
) ENGINE=InnoDB;

CREATE TABLE `tb_usuario` (
  `id_usuario` INT AUTO_INCREMENT PRIMARY KEY,
  `nome_usuario` VARCHAR(255) NOT NULL,
  `cpf_usuario` CHAR(11) NOT NULL UNIQUE,
  `senha_usuario` VARCHAR(255) NOT NULL,
  `email_usuario` VARCHAR(255) NOT NULL UNIQUE,
  `data_cadastro` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_tipo_funcionario` INT NOT NULL,
  `id_oficina_principal` INT NOT NULL,
  `id_status_usuario` INT NOT NULL,
  FOREIGN KEY (`id_tipo_funcionario`) REFERENCES `tb_tipo_funcionario`(`id_tipo_funcionario`),
  FOREIGN KEY (`id_status_usuario`) REFERENCES `tb_status_usuario`(`id_status_usuario`),
  FOREIGN KEY (`id_oficina_principal`) REFERENCES `tb_oficina`(`id_oficina`)
) ENGINE=InnoDB;

CREATE TABLE `tb_usuario_oficina` (
  `id_usuario` INT NOT NULL,
  `id_oficina` INT NOT NULL,
  PRIMARY KEY (`id_usuario`, `id_oficina`),
  FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario`(`id_usuario`) ON DELETE CASCADE,
  FOREIGN KEY (`id_oficina`) REFERENCES `tb_oficina`(`id_oficina`) ON DELETE CASCADE
) ENGINE=InnoDB;

-- =====================================================
-- MÓDULO 3: CLIENTES E VEÍCULOS
-- =====================================================
CREATE TABLE `tb_cliente` (
  `id_cliente` INT AUTO_INCREMENT PRIMARY KEY,
  `nm_cliente` VARCHAR(255) NOT NULL,
  `telefone_cliente` VARCHAR(15),
  `email_cliente` VARCHAR(255) UNIQUE,
  `cpf_cliente` CHAR(11) UNIQUE,
  `data_cadastro` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_status_cliente` INT NOT NULL DEFAULT 1,
  FOREIGN KEY (`id_status_cliente`) REFERENCES `tb_status_cliente`(`id_status_cliente`)
) ENGINE=InnoDB;

CREATE TABLE `tb_veiculos` (
  `id_veiculo` INT AUTO_INCREMENT PRIMARY KEY,
  `placa_veiculo` CHAR(7) NOT NULL UNIQUE,
  `marca_veiculo` VARCHAR(100) NOT NULL,
  `modelo_veiculo` VARCHAR(100) NOT NULL,
  `ano_veiculo` YEAR,
  `cor_veiculo` VARCHAR(50),
  `quilometragem` INT UNSIGNED,
  `id_cliente` INT NOT NULL,
  `id_status_veiculo` INT NOT NULL DEFAULT 1,
  FOREIGN KEY (`id_cliente`) REFERENCES `tb_cliente`(`id_cliente`),
  FOREIGN KEY (`id_status_veiculo`) REFERENCES `tb_status_veiculo`(`id_status_veiculo`)
) ENGINE=InnoDB;

-- =====================================================
-- MÓDULO 4: CATÁLOGO DE PEÇAS E SERVIÇOS
-- =====================================================
CREATE TABLE `tb_servico` (
  `id_servico` INT AUTO_INCREMENT PRIMARY KEY,
  `nome_servico` VARCHAR(255) NOT NULL,
  `vlr_servico` DECIMAL(10,2) NOT NULL,
  `descricao_servico` TEXT,
  `id_oficina` INT NOT NULL,
  `id_status_servico` INT NOT NULL DEFAULT 1,
  FOREIGN KEY (`id_oficina`) REFERENCES `tb_oficina`(`id_oficina`),
  FOREIGN KEY (`id_status_servico`) REFERENCES `tb_status_servico`(`id_status_servico`)
) ENGINE=InnoDB;

CREATE TABLE `tb_peca` (
  `id_peca` INT AUTO_INCREMENT PRIMARY KEY,
  `nome_peca` VARCHAR(255) NOT NULL,
  `codigo_peca` VARCHAR(50),
  `descricao` TEXT,
  `quantidade_atual` INT UNSIGNED NOT NULL,
  `quantidade_minima` INT UNSIGNED NOT NULL,
  `valor_compra` DECIMAL(10,2) NOT NULL,
  `valor_venda` DECIMAL(10,2) NOT NULL,
  `localizacao_estoque` VARCHAR(100),
  `data_cadastro` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_oficina` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  `id_status_peca` INT NOT NULL DEFAULT 1,
  UNIQUE (`codigo_peca`, `id_oficina`),
  FOREIGN KEY (`id_oficina`) REFERENCES `tb_oficina`(`id_oficina`),
  FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario`(`id_usuario`),
  FOREIGN KEY (`id_status_peca`) REFERENCES `tb_status_peca`(`id_status_peca`)
) ENGINE=InnoDB;

-- =====================================================
-- MÓDULO 5: AGENDAMENTOS
-- =====================================================
CREATE TABLE `tb_agendamento` (
  `id_agendamento` INT AUTO_INCREMENT PRIMARY KEY,
  `dt_agendamento` DATETIME NOT NULL,
  `observacoes` TEXT,
  `id_cliente` INT NOT NULL,
  `id_veiculo` INT,
  `id_usuario` INT NOT NULL,
  `id_oficina` INT NOT NULL,
  `id_status_agendamento` INT NOT NULL,
  FOREIGN KEY (`id_cliente`) REFERENCES `tb_cliente`(`id_cliente`),
  FOREIGN KEY (`id_veiculo`) REFERENCES `tb_veiculos`(`id_veiculo`),
  FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario`(`id_usuario`),
  FOREIGN KEY (`id_oficina`) REFERENCES `tb_oficina`(`id_oficina`),
  FOREIGN KEY (`id_status_agendamento`) REFERENCES `tb_status_agendamento`(`id_status_agendamento`)
) ENGINE=InnoDB;

-- =====================================================
-- MÓDULO 6: ORDENS DE SERVIÇO (OS)
-- =====================================================
CREATE TABLE `tb_ordem_servico` (
  `id_ordem_servico` INT AUTO_INCREMENT PRIMARY KEY,
  `dt_abertura` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dt_fechamento` DATETIME,
  `observacoes` TEXT,
  `id_cliente` INT NOT NULL,
  `id_veiculo` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  `id_oficina` INT NOT NULL,
  `id_status_os` INT NOT NULL,
  FOREIGN KEY (`id_cliente`) REFERENCES `tb_cliente`(`id_cliente`),
  FOREIGN KEY (`id_veiculo`) REFERENCES `tb_veiculos`(`id_veiculo`),
  FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario`(`id_usuario`),
  FOREIGN KEY (`id_oficina`) REFERENCES `tb_oficina`(`id_oficina`),
  FOREIGN KEY (`id_status_os`) REFERENCES `tb_status_os`(`id_status_os`)
) ENGINE=InnoDB;

CREATE TABLE `tb_ordem_servico_peca` (
  `id_ordem_servico` INT NOT NULL,
  `id_peca` INT NOT NULL,
  `vlr_unitario` DECIMAL(10,2) NOT NULL,
  `descricao` TEXT,
  `quantidade` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_ordem_servico`, `id_peca`),
  FOREIGN KEY (`id_ordem_servico`) REFERENCES `tb_ordem_servico`(`id_ordem_servico`),
  FOREIGN KEY (`id_peca`) REFERENCES `tb_peca`(`id_peca`)
) ENGINE=InnoDB;

CREATE TABLE `tb_ordem_servico_servico` (
  `id_ordem_servico` INT NOT NULL,
  `id_servico` INT NOT NULL,
  `vlr_unitario` DECIMAL(10,2) NOT NULL,
  `quantidade` INT UNSIGNED NOT NULL,
  `observacoes` TEXT,
  PRIMARY KEY (`id_ordem_servico`, `id_servico`),
  FOREIGN KEY (`id_ordem_servico`) REFERENCES `tb_ordem_servico`(`id_ordem_servico`),
  FOREIGN KEY (`id_servico`) REFERENCES `tb_servico`(`id_servico`)
) ENGINE=InnoDB;

-- =====================================================
-- MÓDULO 7: FINANCEIRO E ESTOQUE
-- =====================================================
CREATE TABLE `tb_financeiro` (
  `id_transacao` INT AUTO_INCREMENT PRIMARY KEY,
  `dt_transacao` DATETIME NOT NULL,
  `descricao` TEXT,
  `valor` DECIMAL(10,2) NOT NULL,
  `observacao_transacao` VARCHAR(255),
  `id_ordem_servico` INT,
  `id_usuario` INT NOT NULL,
  `id_oficina` INT NOT NULL,
  `id_tipo_transacao` INT NOT NULL,
  `id_metodo_pagamento` INT NOT NULL,
  `id_tipo_movimentacao` INT NOT NULL,
  `id_status_transacao` INT NOT NULL DEFAULT 1,
  FOREIGN KEY (`id_ordem_servico`) REFERENCES `tb_ordem_servico`(`id_ordem_servico`),
  FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario`(`id_usuario`),
  FOREIGN KEY (`id_oficina`) REFERENCES `tb_oficina`(`id_oficina`),
  FOREIGN KEY (`id_tipo_transacao`) REFERENCES `tb_tipo_transacao`(`id_tipo_transacao`),
  FOREIGN KEY (`id_metodo_pagamento`) REFERENCES `tb_metodo_pagamento`(`id_metodo_pagamento`),
  FOREIGN KEY (`id_tipo_movimentacao`) REFERENCES `tb_tipo_movimentacao`(`id_tipo_movimentacao`),
  FOREIGN KEY (`id_status_transacao`) REFERENCES `tb_status_transacao`(`id_status_transacao`)
) ENGINE=InnoDB;

CREATE TABLE `tb_historico_estoque` (
  `id_historico` INT AUTO_INCREMENT PRIMARY KEY,
  `id_tipo_movimentacao_estoque` INT NOT NULL,
  `quantidade_movimentada` INT NOT NULL,
  `data_movimentacao` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `observacoes` TEXT,
  `id_peca` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  `id_oficina` INT NOT NULL,
  FOREIGN KEY (`id_tipo_movimentacao_estoque`) REFERENCES `tb_tipo_movimentacao_estoque`(`id_tipo_movimentacao_estoque`),
  FOREIGN KEY (`id_peca`) REFERENCES `tb_peca`(`id_peca`),
  FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario`(`id_usuario`),
  FOREIGN KEY (`id_oficina`) REFERENCES `tb_oficina`(`id_oficina`)
) ENGINE=InnoDB;

-- =====================================================
-- MÓDULO 8: LOGS DO SISTEMA
-- =====================================================
CREATE TABLE `tb_log` (
  `id_log` INT AUTO_INCREMENT PRIMARY KEY,
  `data_hora_log` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `detalhes_log` TEXT,
  `id_cliente` INT,
  `id_veiculo` INT,
  `id_ordem_servico` INT,
  `id_tipo_acao_log` INT NOT NULL,
  `id_usuario` INT,
  `id_oficina` INT,
  FOREIGN KEY (`id_cliente`) REFERENCES `tb_cliente`(`id_cliente`),
  FOREIGN KEY (`id_veiculo`) REFERENCES `tb_veiculos`(`id_veiculo`),
  FOREIGN KEY (`id_ordem_servico`) REFERENCES `tb_ordem_servico`(`id_ordem_servico`),
  FOREIGN KEY (`id_tipo_acao_log`) REFERENCES `tb_tipo_acao_log`(`id_tipo_acao_log`),
  FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario`(`id_usuario`),
  FOREIGN KEY (`id_oficina`) REFERENCES `tb_oficina`(`id_oficina`)
) ENGINE=InnoDB;

-- -------------------------------------------------------------------
-- ||||||||||||||||||| POPULANDO DADOS INICIAIS |||||||||||||||||||||
-- -------------------------------------------------------------------

-- MÓDULO 1: DADOS DE DICIONÁRIOS
INSERT INTO `tb_status_oficina` (`descricao_status`) VALUES ('Ativa'),('Inativa');
INSERT INTO `tb_status_usuario` (`descricao_status`) VALUES ('Ativo'),('Inativo');
INSERT INTO `tb_tipo_funcionario` (`descricao_tipo`) VALUES ('Administrador'),('Gerente'),('Mecânico'),('Atendente');
INSERT INTO `tb_status_cliente` (`descricao_status`) VALUES ('Ativo'),('Inativo');
INSERT INTO `tb_status_veiculo` (`descricao_status`) VALUES ('Ativo'),('Em Manutenção'),('Inativo');
INSERT INTO `tb_status_servico` (`descricao_status`) VALUES ('Ativo'),('Inativo');
INSERT INTO `tb_status_peca` (`descricao_status`) VALUES ('Ativo'),('Inativo');
INSERT INTO `tb_status_agendamento` (`descricao_status`) VALUES ('Agendado'),('Confirmado'),('Cancelado'),('Concluído');
INSERT INTO `tb_status_os` (`descricao_status`) VALUES ('Aberta'),('Aguardando Aprovação'),('Em Andamento'),('Aguardando Peça'),('Concluída'),('Cancelada');
INSERT INTO `tb_status_transacao` (`descricao_status`) VALUES ('Pendente'), ('Pago'), ('Cancelado');
INSERT INTO `tb_tipo_transacao` (`descricao_tipo`) VALUES ('Receita'), ('Despesa');
INSERT INTO `tb_metodo_pagamento` (`descricao_pagamento`) VALUES ('Dinheiro'), ('Cartão de Crédito'), ('Cartão de Débito'), ('PIX');
INSERT INTO `tb_tipo_movimentacao` (`descricao_tipo_movimentacao`) VALUES ('Entrada'), ('Saída');
INSERT INTO `tb_tipo_movimentacao_estoque` (`descricao_movimentacao`) VALUES ('Entrada por Compra'),('Saída por Venda'),('Ajuste de Inventário');
INSERT INTO `tb_tipo_acao_log` (`descricao_tipo_acao_log`) VALUES ('Login bem-sucedido'), ('Tentativa de login falha'), ('Logout'), ('Cliente Criado'), ('Cliente Editado'), ('OS Criada'), ('OS Status Alterado'), ('Usuário Criado'),('Usuário Editado');

-- DADOS MOCADOS (COM AUTO_INCREMENT E VARIÁVEIS)

-- Criando Oficinas e capturando seus IDs
INSERT INTO `tb_oficina` (`nm_oficina`, `endereco_oficina`, `cidade_oficina`, `estado_oficina`, `id_status_oficina`) VALUES ('VirtualCar - Matriz São Paulo', 'Avenida Paulista, 1000', 'São Paulo', 'SP', 1);
SET @id_oficina_sp = LAST_INSERT_ID();

INSERT INTO `tb_oficina` (`nm_oficina`, `endereco_oficina`, `cidade_oficina`, `estado_oficina`, `id_status_oficina`) VALUES ('VirtualCar - Filial Campinas', 'Rua Barão de Jaguara, 500', 'Campinas', 'SP', 1);
SET @id_oficina_campinas = LAST_INSERT_ID();

-- Criando Usuários e vinculando às oficinas (Senha para todos: "123456")
SET @senha_hash = '$2y$10$ifcAkXAO/eCetZXeTQBD9elWnEAVYz8vBxPyqMQHqewYv30.et.Iq';

INSERT INTO `tb_usuario` (`nome_usuario`, `cpf_usuario`, `senha_usuario`, `email_usuario`, `id_tipo_funcionario`, `id_oficina_principal`, `id_status_usuario`) VALUES ('Administrador Geral', '11111111111', @senha_hash, 'admin@virtualcar.com', 1, @id_oficina_sp, 1);
SET @id_user_admin = LAST_INSERT_ID();

INSERT INTO `tb_usuario` (`nome_usuario`, `cpf_usuario`, `senha_usuario`, `email_usuario`, `id_tipo_funcionario`, `id_oficina_principal`, `id_status_usuario`) VALUES ('José Gerente', '22222222222', @senha_hash, 'gerente@virtualcar.com', 2, @id_oficina_sp, 1);
SET @id_user_gerente = LAST_INSERT_ID();

INSERT INTO `tb_usuario` (`nome_usuario`, `cpf_usuario`, `senha_usuario`, `email_usuario`, `id_tipo_funcionario`, `id_oficina_principal`, `id_status_usuario`) VALUES ('Carlos Mecânico', '33333333333', @senha_hash, 'mecanico@virtualcar.com', 3, @id_oficina_campinas, 1);
SET @id_user_mecanico = LAST_INSERT_ID();

INSERT INTO `tb_usuario` (`nome_usuario`, `cpf_usuario`, `senha_usuario`, `email_usuario`, `id_tipo_funcionario`, `id_oficina_principal`, `id_status_usuario`) VALUES ('Ana Atendente', '44444444444', @senha_hash, 'atendente@virtualcar.com', 4, @id_oficina_sp, 1);
SET @id_user_atendente = LAST_INSERT_ID();

-- Vinculando permissões dos usuários nas oficinas
INSERT INTO `tb_usuario_oficina` (`id_usuario`, `id_oficina`) VALUES 
(@id_user_admin, @id_oficina_sp), 
(@id_user_admin, @id_oficina_campinas),
(@id_user_gerente, @id_oficina_sp),
(@id_user_mecanico, @id_oficina_campinas),
(@id_user_atendente, @id_oficina_sp);

-- Criando Clientes e Veículos
INSERT INTO `tb_cliente` (`nm_cliente`, `telefone_cliente`, `email_cliente`, `cpf_cliente`, `id_status_cliente`) VALUES ('Maria Silva', '11987654321', 'maria.silva@email.com', '12345678901', 1);
SET @id_cliente_maria = LAST_INSERT_ID();
INSERT INTO `tb_veiculos` (`placa_veiculo`, `marca_veiculo`, `modelo_veiculo`, `ano_veiculo`, `cor_veiculo`, `quilometragem`, `id_cliente`, `id_status_veiculo`) VALUES ('ABC1D23', 'Toyota', 'Corolla', 2022, 'Prata', 35000, @id_cliente_maria, 1);
SET @id_veiculo_corolla = LAST_INSERT_ID();

INSERT INTO `tb_cliente` (`nm_cliente`, `telefone_cliente`, `email_cliente`, `cpf_cliente`, `id_status_cliente`) VALUES ('João Pereira', '19912345678', 'joao.pereira@email.com', '98765432109', 1);
SET @id_cliente_joao = LAST_INSERT_ID();
INSERT INTO `tb_veiculos` (`placa_veiculo`, `marca_veiculo`, `modelo_veiculo`, `ano_veiculo`, `cor_veiculo`, `quilometragem`, `id_cliente`, `id_status_veiculo`) VALUES ('XYZ9H87', 'Honda', 'Civic', 2021, 'Preto', 55000, @id_cliente_joao, 1);

-- Criando Catálogo de Peças e Serviços
INSERT INTO `tb_servico` (`nome_servico`, `vlr_servico`, `descricao_servico`, `id_oficina`, `id_status_servico`) VALUES ('Troca de óleo e filtro', 250.00, 'Troca do óleo do motor (5L 5W-30) e filtro de óleo.', @id_oficina_sp, 1);
SET @id_servico_oleo = LAST_INSERT_ID();
INSERT INTO `tb_peca` (`nome_peca`, `codigo_peca`, `descricao`, `quantidade_atual`, `quantidade_minima`, `valor_compra`, `valor_venda`, `localizacao_estoque`, `id_oficina`, `id_usuario`, `id_status_peca`) VALUES ('Filtro de Óleo T-01', 'FO-TYT-01', 'Filtro de óleo para Toyota Corolla 2.0', 10, 2, 35.00, 55.00, 'Prateleira A-1', @id_oficina_sp, @id_user_admin, 1);
SET @id_peca_filtro = LAST_INSERT_ID();

-- Criando Agendamento, OS e Transação Financeira
INSERT INTO `tb_agendamento` (`dt_agendamento`, `observacoes`, `id_cliente`, `id_veiculo`, `id_usuario`, `id_oficina`, `id_status_agendamento`) VALUES ('2025-10-10 09:00:00', 'Revisão dos 40.000 km', @id_cliente_maria, @id_veiculo_corolla, @id_user_atendente, @id_oficina_sp, 1);
INSERT INTO `tb_ordem_servico` (`observacoes`, `id_cliente`, `id_veiculo`, `id_usuario`, `id_oficina`, `id_status_os`) VALUES ('Cliente relata barulho na suspensão. Realizar troca de óleo.', @id_cliente_maria, @id_veiculo_corolla, @id_user_mecanico, @id_oficina_sp, 1);
SET @id_os_1 = LAST_INSERT_ID();
INSERT INTO `tb_ordem_servico_servico` (`id_ordem_servico`, `id_servico`, `vlr_unitario`, `quantidade`) VALUES (@id_os_1, @id_servico_oleo, 250.00, 1);
INSERT INTO `tb_financeiro` (`dt_transacao`, `descricao`, `valor`, `id_ordem_servico`, `id_usuario`, `id_oficina`, `id_tipo_transacao`, `id_metodo_pagamento`, `id_tipo_movimentacao`, `id_status_transacao`) VALUES (NOW(), 'Receita da OS #1', 250.00, @id_os_1, @id_user_atendente, @id_oficina_sp, 1, 4, 1, 2);


--/seu_projeto/
|
|-- /config/                <-- Arquivos de configuração e inicialização
|   |-- connect.php         (Conexão com o banco de dados)
|   |-- init.php            (Nosso carregador/inicializador central)
|
|-- /functions/             <-- Nossas funções PHP reutilizáveis
|   |-- functions_gerais.php  (Funções de login, segurança, feedback, log)
|
|-- /includes/              <-- Componentes de layout reutilizáveis (HTML/PHP)
|   |-- _modal_feedback.php (O HTML, CSS e JS do nosso modal)
|   |-- header.php          (O cabeçalho padrão das páginas do painel)
|   |-- footer.php          (O rodapé padrão, que inclui a lógica do modal)
|
|-- /painel/                <-- TODAS as páginas restritas do sistema ficarão aqui
|   |-- index.php           (O dashboard principal após o login)
|
|-- login.php               <-- A tela de login (pública)
|-- login_processa.php      <-- O script que recebe os dados do login (sem HTML)
|-- logout.php              <-- O script que encerra a sessão (sem HTML)