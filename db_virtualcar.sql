-- =====================================================================
-- SCRIPT FINAL E CONSOLIDADO PARA O BANCO DE DADOS VIRTUALCAR
-- v5.1 - Refatoração de Oficinas (adição de endereço)
-- =====================================================================

DROP DATABASE IF EXISTS `db_virtualcar`;
CREATE DATABASE IF NOT EXISTS `db_virtualcar` DEFAULT CHARACTER SET utf8mb4;
USE `db_virtualcar`;

-- -----------------------------------------------------\
-- MÓDULO 1: TABELAS DE CONFIGURAÇÃO (Dicionário de Dados)
-- -----------------------------------------------------\

CREATE TABLE IF NOT EXISTS `tb_status_oficina` (
  `id_status_oficina` INT NOT NULL AUTO_INCREMENT,
  `descricao_status` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_status_oficina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tb_oficina` (
  `id_oficina` INT NOT NULL AUTO_INCREMENT,
  `nm_oficina` VARCHAR(255) NOT NULL,
  `endereco_oficina` VARCHAR(255) NOT NULL,
  `cidade_oficina` VARCHAR(100) NOT NULL,
  `estado_oficina` CHAR(2) NOT NULL,
  `id_status_oficina` INT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_oficina`),
  CONSTRAINT `fk_oficina_status`
    FOREIGN KEY (`id_status_oficina`) REFERENCES `tb_status_oficina` (`id_status_oficina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tb_status_usuario` (
  `id_status_usuario` INT NOT NULL AUTO_INCREMENT,
  `descricao_status` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_status_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tb_tipo_funcionario` (
  `id_tipo_funcionario` INT NOT NULL AUTO_INCREMENT,
  `descricao_tipo` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_tipo_funcionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tb_status_cliente` (
  `id_status_cliente` INT NOT NULL AUTO_INCREMENT,
  `descricao_status` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_status_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tb_status_veiculo` (
  `id_status_veiculo` INT NOT NULL AUTO_INCREMENT,
  `descricao_status` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_status_veiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tb_status_servico` (
  `id_status_servico` INT NOT NULL AUTO_INCREMENT,
  `descricao_status` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_status_servico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tb_status_peca` (
  `id_status_peca` INT NOT NULL AUTO_INCREMENT,
  `descricao_status` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_status_peca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tb_status_agendamento` (
  `id_status_agendamento` INT NOT NULL AUTO_INCREMENT,
  `descricao_status` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_status_agendamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tb_status_os` (
  `id_status_os` INT NOT NULL AUTO_INCREMENT,
  `descricao_status` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_status_os`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tb_status_transacao` (
  `id_status_transacao` INT NOT NULL AUTO_INCREMENT,
  `descricao_status` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_status_transacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tb_tipo_transacao` (
  `id_tipo_transacao` INT NOT NULL AUTO_INCREMENT,
  `descricao_tipo` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_tipo_transacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tb_metodo_pagamento` (
  `id_metodo_pagamento` INT NOT NULL AUTO_INCREMENT,
  `descricao_pagamento` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_metodo_pagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tb_tipo_movimentacao` (
  `id_tipo_movimentacao` INT NOT NULL AUTO_INCREMENT,
  `descricao_tipo_movimentacao` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_tipo_movimentacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tb_tipo_movimentacao_estoque` (
  `id_tipo_movimentacao_estoque` INT NOT NULL AUTO_INCREMENT,
  `descricao_movimentacao` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_tipo_movimentacao_estoque`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tb_tipo_acao_log` (
  `id_tipo_acao_log` INT NOT NULL AUTO_INCREMENT,
  `descricao_tipo_acao_log` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_tipo_acao_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- -----------------------------------------------------\
-- MÓDULO 2: TABELAS DE USUÁRIOS E CLIENTES (ENTIDADES GLOBAIS)
-- -----------------------------------------------------\

CREATE TABLE IF NOT EXISTS `tb_usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nome_usuario` VARCHAR(255) NOT NULL,
  `cpf_usuario` CHAR(11) NOT NULL,
  `senha_usuario` VARCHAR(255) NOT NULL,
  `email_usuario` VARCHAR(255) NOT NULL,
  `data_cadastro` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_tipo_funcionario` INT NOT NULL,
  `id_oficina_principal` INT NULL DEFAULT NULL,
  `id_status_usuario` INT NOT NULL,
  PRIMARY KEY (`id_usuario`),
  CONSTRAINT `uq_email_usuario` UNIQUE (`email_usuario`),
  CONSTRAINT `uq_cpf_usuario` UNIQUE (`cpf_usuario`),
  CONSTRAINT `fk_usuario_status` FOREIGN KEY (`id_status_usuario`) REFERENCES `tb_status_usuario` (`id_status_usuario`),
  CONSTRAINT `fk_usuario_oficina_principal` FOREIGN KEY (`id_oficina_principal`) REFERENCES `tb_oficina` (`id_oficina`),
  CONSTRAINT `fk_usuario_tipo_funcionario` FOREIGN KEY (`id_tipo_funcionario`) REFERENCES `tb_tipo_funcionario` (`id_tipo_funcionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tb_usuario_oficina` (
  `id_usuario` INT NOT NULL,
  `id_oficina` INT NOT NULL,
  PRIMARY KEY (`id_usuario`, `id_oficina`),
  CONSTRAINT `fk_usuario_oficina_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario` (`id_usuario`),
  CONSTRAINT `fk_usuario_oficina_oficina` FOREIGN KEY (`id_oficina`) REFERENCES `tb_oficina` (`id_oficina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tb_cliente` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nm_cliente` VARCHAR(255) NOT NULL,
  `telefone_cliente` VARCHAR(15),
  `email_cliente` VARCHAR(255),
  `cpf_cliente` CHAR(11),
  `data_cadastro` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_status_cliente` INT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_cliente`),
  CONSTRAINT `uq_email_cliente` UNIQUE (`email_cliente`),
  CONSTRAINT `uq_cpf_cliente` UNIQUE (`cpf_cliente`),
  CONSTRAINT `fk_cliente_status` FOREIGN KEY (`id_status_cliente`) REFERENCES `tb_status_cliente`(`id_status_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tb_veiculos` (
  `id_veiculo` INT NOT NULL AUTO_INCREMENT,
  `placa_veiculo` CHAR(7) NOT NULL,
  `marca_veiculo` VARCHAR(100) NOT NULL,
  `modelo_veiculo` VARCHAR(100) NOT NULL,
  `ano_veiculo` YEAR,
  `cor_veiculo` VARCHAR(50),
  `quilometragem` INT UNSIGNED,
  `id_cliente` INT NOT NULL,
  `id_status_veiculo` INT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_veiculo`),
  CONSTRAINT `uq_placa_veiculo` UNIQUE (`placa_veiculo`),
  CONSTRAINT `fk_veiculos_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `tb_cliente` (`id_cliente`),
  CONSTRAINT `fk_veiculo_status` FOREIGN KEY (`id_status_veiculo`) REFERENCES `tb_status_veiculo` (`id_status_veiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- -----------------------------------------------------\
-- MÓDULO 3: AGENDAMENTOS E ORDENS DE SERVIÇO (OS)
-- -----------------------------------------------------\

CREATE TABLE IF NOT EXISTS `tb_servico` (
  `id_servico` INT NOT NULL AUTO_INCREMENT,
  `nome_servico` VARCHAR(255) NOT NULL,
  `vlr_servico` DECIMAL(10,2) NOT NULL,
  `descricao_servico` TEXT,
  `id_oficina` INT NOT NULL,
  `id_status_servico` INT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_servico`),
  CONSTRAINT `fk_servico_oficina` FOREIGN KEY (`id_oficina`) REFERENCES `tb_oficina` (`id_oficina`),
  CONSTRAINT `fk_servico_status` FOREIGN KEY (`id_status_servico`) REFERENCES `tb_status_servico` (`id_status_servico`),
  CONSTRAINT `chk_vlr_servico_positivo` CHECK (`vlr_servico` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tb_peca` (
  `id_peca` INT NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`id_peca`),
  CONSTRAINT `uq_codigo_peca_oficina` UNIQUE (`codigo_peca`, `id_oficina`),
  CONSTRAINT `fk_peca_oficina` FOREIGN KEY (`id_oficina`) REFERENCES `tb_oficina` (`id_oficina`),
  CONSTRAINT `fk_peca_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario` (`id_usuario`),
  CONSTRAINT `fk_peca_status` FOREIGN KEY (`id_status_peca`) REFERENCES `tb_status_peca` (`id_status_peca`),
  CONSTRAINT `chk_valores_peca_positivos` CHECK (`valor_compra` >= 0 AND `valor_venda` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tb_agendamento` (
  `id_agendamento` INT NOT NULL AUTO_INCREMENT,
  `dt_agendamento` DATETIME NOT NULL,
  `observacoes` TEXT,
  `id_cliente` INT NOT NULL,
  `id_veiculo` INT,
  `id_usuario` INT NOT NULL,
  `id_oficina` INT NOT NULL,
  `id_status_agendamento` INT NOT NULL,
  PRIMARY KEY (`id_agendamento`),
  CONSTRAINT `fk_agendamento_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `tb_cliente` (`id_cliente`),
  CONSTRAINT `fk_agendamento_veiculo` FOREIGN KEY (`id_veiculo`) REFERENCES `tb_veiculos` (`id_veiculo`),
  CONSTRAINT `fk_agendamento_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario` (`id_usuario`),
  CONSTRAINT `fk_agendamento_oficina` FOREIGN KEY (`id_oficina`) REFERENCES `tb_oficina` (`id_oficina`),
  CONSTRAINT `fk_agendamento_status` FOREIGN KEY (`id_status_agendamento`) REFERENCES `tb_status_agendamento` (`id_status_agendamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tb_ordem_servico` (
  `id_ordem_servico` INT NOT NULL AUTO_INCREMENT,
  `dt_abertura` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dt_fechamento` DATETIME,
  `observacoes` TEXT,
  `id_cliente` INT NOT NULL,
  `id_veiculo` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  `id_oficina` INT NOT NULL,
  `id_status_os` INT NOT NULL,
  PRIMARY KEY (`id_ordem_servico`),
  CONSTRAINT `fk_ordem_servico_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `tb_cliente` (`id_cliente`),
  CONSTRAINT `fk_ordem_servico_veiculo` FOREIGN KEY (`id_veiculo`) REFERENCES `tb_veiculos` (`id_veiculo`),
  CONSTRAINT `fk_ordem_servico_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario` (`id_usuario`),
  CONSTRAINT `fk_ordem_servico_oficina` FOREIGN KEY (`id_oficina`) REFERENCES `tb_oficina` (`id_oficina`),
  CONSTRAINT `fk_ordem_servico_status` FOREIGN KEY (`id_status_os`) REFERENCES `tb_status_os` (`id_status_os`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tb_ordem_servico_peca` (
  `id_ordem_servico` INT NOT NULL,
  `id_peca` INT NOT NULL,
  `vlr_unitario` DECIMAL(10,2) NOT NULL,
  `descricao` TEXT,
  `quantidade` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_ordem_servico`, `id_peca`),
  CONSTRAINT `fk_ordem_servico_peca_ordem_servico` FOREIGN KEY (`id_ordem_servico`) REFERENCES `tb_ordem_servico` (`id_ordem_servico`),
  CONSTRAINT `fk_ordem_servico_peca_peca` FOREIGN KEY (`id_peca`) REFERENCES `tb_peca` (`id_peca`),
  CONSTRAINT `chk_os_peca_valores_positivos` CHECK (`vlr_unitario` >= 0 AND `quantidade` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tb_ordem_servico_servico` (
  `id_ordem_servico` INT NOT NULL,
  `id_servico` INT NOT NULL,
  `vlr_unitario` DECIMAL(10,2) NOT NULL,
  `quantidade` INT UNSIGNED NOT NULL,
  `observacoes` TEXT,
  PRIMARY KEY (`id_ordem_servico`, `id_servico`),
  CONSTRAINT `fk_ordem_servico_servico_ordem_servico` FOREIGN KEY (`id_ordem_servico`) REFERENCES `tb_ordem_servico` (`id_ordem_servico`),
  CONSTRAINT `fk_ordem_servico_servico_servico` FOREIGN KEY (`id_servico`) REFERENCES `tb_servico` (`id_servico`),
  CONSTRAINT `chk_os_servico_valores_positivos` CHECK (`vlr_unitario` >= 0 AND `quantidade` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- -----------------------------------------------------\
-- MÓDULO 4: FINANCEIRO E ESTOQUE
-- -----------------------------------------------------\

CREATE TABLE IF NOT EXISTS `tb_financeiro` (
  `id_transacao` INT NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`id_transacao`),
  CONSTRAINT `fk_financeiro_ordem_servico` FOREIGN KEY (`id_ordem_servico`) REFERENCES `tb_ordem_servico` (`id_ordem_servico`),
  CONSTRAINT `fk_financeiro_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario` (`id_usuario`),
  CONSTRAINT `fk_financeiro_oficina` FOREIGN KEY (`id_oficina`) REFERENCES `tb_oficina` (`id_oficina`),
  CONSTRAINT `fk_financeiro_tipo_transacao` FOREIGN KEY (`id_tipo_transacao`) REFERENCES `tb_tipo_transacao` (`id_tipo_transacao`),
  CONSTRAINT `fk_financeiro_metodo_pagamento` FOREIGN KEY (`id_metodo_pagamento`) REFERENCES `tb_metodo_pagamento` (`id_metodo_pagamento`),
  CONSTRAINT `fk_financeiro_tipo_movimentacao` FOREIGN KEY (`id_tipo_movimentacao`) REFERENCES `tb_tipo_movimentacao` (`id_tipo_movimentacao`),
  CONSTRAINT `fk_financeiro_status` FOREIGN KEY (`id_status_transacao`) REFERENCES `tb_status_transacao`(`id_status_transacao`),
  CONSTRAINT `chk_valor_positivo` CHECK (`valor` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tb_historico_estoque` (
  `id_historico` INT NOT NULL AUTO_INCREMENT,
  `id_tipo_movimentacao_estoque` INT NOT NULL,
  `quantidade_movimentada` INT NOT NULL,
  `data_movimentacao` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `observacoes` TEXT,
  `id_peca` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  `id_oficina` INT NOT NULL,
  PRIMARY KEY (`id_historico`),
  CONSTRAINT `fk_historico_estoque_tipo` FOREIGN KEY (`id_tipo_movimentacao_estoque`) REFERENCES `tb_tipo_movimentacao_estoque` (`id_tipo_movimentacao_estoque`),
  CONSTRAINT `fk_historico_estoque_peca` FOREIGN KEY (`id_peca`) REFERENCES `tb_peca` (`id_peca`),
  CONSTRAINT `fk_historico_estoque_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario` (`id_usuario`),
  CONSTRAINT `fk_historico_estoque_oficina` FOREIGN KEY (`id_oficina`) REFERENCES `tb_oficina` (`id_oficina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- -----------------------------------------------------\
-- MÓDULO 5: LOGS DO SISTEMA
-- -----------------------------------------------------\

CREATE TABLE IF NOT EXISTS `tb_log` (
  `id_log` INT NOT NULL AUTO_INCREMENT,
  `data_hora_log` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `detalhes_log` TEXT,
  `id_cliente` INT,
  `id_veiculo` INT,
  `id_ordem_servico` INT,
  `id_tipo_acao_log` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  `id_oficina` INT NOT NULL,
  PRIMARY KEY (`id_log`),
  CONSTRAINT `fk_log_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `tb_cliente` (`id_cliente`),
  CONSTRAINT `fk_log_veiculos` FOREIGN KEY (`id_veiculo`) REFERENCES `tb_veiculos` (`id_veiculo`),
  CONSTRAINT `fk_log_ordem_servico` FOREIGN KEY (`id_ordem_servico`) REFERENCES `tb_ordem_servico` (`id_ordem_servico`),
  CONSTRAINT `fk_log_tipo_acao_log` FOREIGN KEY (`id_tipo_acao_log`) REFERENCES `tb_tipo_acao_log` (`id_tipo_acao_log`),
  CONSTRAINT `fk_log_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario` (`id_usuario`),
  CONSTRAINT `fk_log_oficina` FOREIGN KEY (`id_oficina`) REFERENCES `tb_oficina` (`id_oficina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- -----------------------------------------------------\
-- Adição de Índices para Performance
-- -----------------------------------------------------\
CREATE INDEX `idx_fk_usuario_status` ON `tb_usuario` (`id_status_usuario`);
CREATE INDEX `idx_fk_usuario_oficina_principal` ON `tb_usuario` (`id_oficina_principal`);
CREATE INDEX `idx_nm_cliente` ON `tb_cliente` (`nm_cliente`);
CREATE INDEX `idx_fk_veiculos_cliente` ON `tb_veiculos` (`id_cliente`);
CREATE INDEX `idx_fk_veiculo_status` ON `tb_veiculos` (`id_status_veiculo`);
CREATE INDEX `idx_dt_agendamento` ON `tb_agendamento` (`dt_agendamento`);
CREATE INDEX `idx_fk_agendamento_cliente` ON `tb_agendamento` (`id_cliente`);
CREATE INDEX `idx_fk_agendamento_veiculo` ON `tb_agendamento` (`id_veiculo`);
CREATE INDEX `idx_fk_agendamento_oficina` ON `tb_agendamento` (`id_oficina`);
CREATE INDEX `idx_dt_abertura` ON `tb_ordem_servico` (`dt_abertura`);
CREATE INDEX `idx_fk_ordem_servico_cliente` ON `tb_ordem_servico` (`id_cliente`);
CREATE INDEX `idx_fk_ordem_servico_veiculo` ON `tb_ordem_servico` (`id_veiculo`);
CREATE INDEX `idx_fk_ordem_servico_oficina` ON `tb_ordem_servico` (`id_oficina`);
CREATE INDEX `idx_dt_transacao` ON `tb_financeiro` (`dt_transacao`);
CREATE INDEX `idx_fk_financeiro_ordem_servico` ON `tb_financeiro` (`id_ordem_servico`);
CREATE INDEX `idx_nome_peca` ON `tb_peca` (`nome_peca`);
CREATE INDEX `idx_fk_peca_oficina` ON `tb_peca` (`id_oficina`);
CREATE INDEX `idx_fk_peca_status` ON `tb_peca` (`id_status_peca`);
CREATE INDEX `idx_nome_servico` ON `tb_servico` (`nome_servico`);
CREATE INDEX `idx_fk_servico_oficina` ON `tb_servico` (`id_oficina`);
CREATE INDEX `idx_fk_servico_status` ON `tb_servico` (`id_status_servico`);
CREATE INDEX `idx_fk_log_usuario` ON `tb_log` (`id_usuario`);
CREATE INDEX `idx_fk_log_oficina` ON `tb_log` (`id_oficina`);
CREATE INDEX `idx_fk_agendamento_status` ON `tb_agendamento` (`id_status_agendamento`);
CREATE INDEX `idx_fk_ordem_servico_status` ON `tb_ordem_servico` (`id_status_os`);

-- -----------------------------------------------------\
-- DADOS INICIAIS PARA TABELAS DE CONFIGURAÇÃO
-- -----------------------------------------------------\

INSERT INTO `tb_status_oficina` (`descricao_status`) VALUES ('Ativa'), ('Inativa');
INSERT INTO `tb_status_usuario` (`descricao_status`) VALUES ('Ativo'), ('Inativo');
INSERT INTO `tb_tipo_funcionario` (`descricao_tipo`) VALUES ('Administrador'), ('Gerente'), ('Mecânico'), ('Atendente');
INSERT INTO `tb_status_cliente` (`descricao_status`) VALUES ('Ativo'), ('Inativo'), ('Bloqueado');
INSERT INTO `tb_status_veiculo` (`descricao_status`) VALUES ('Ativo'), ('Inativo'), ('Em Manutenção');
INSERT INTO `tb_status_servico` (`descricao_status`) VALUES ('Ativo'), ('Inativo');
INSERT INTO `tb_status_peca` (`descricao_status`) VALUES ('Ativo'), ('Inativo'), ('Obsoleto');
INSERT INTO `tb_status_agendamento` (`descricao_status`) VALUES ('Agendado'), ('Confirmado'), ('Cancelado'), ('Concluído'), ('Não Compareceu');
INSERT INTO `tb_status_os` (`descricao_status`) VALUES ('Aberta'), ('Em Andamento'), ('Aguardando Peça'), ('Aguardando Aprovação'), ('Concluída'), ('Cancelada');
INSERT INTO `tb_status_transacao` (`descricao_status`) VALUES ('Pendente'), ('Pago'), ('Vencido'), ('Cancelado');
INSERT INTO `tb_tipo_movimentacao_estoque` (`descricao_movimentacao`) VALUES ('Entrada por Compra'), ('Saída por Venda'), ('Ajuste de Inventário');

INSERT INTO `tb_oficina` (`id_oficina`, `nm_oficina`, `endereco_oficina`, `cidade_oficina`, `estado_oficina`, `id_status_oficina`) VALUES
(1, 'VirtualCar - Matriz São Paulo', 'Avenida Paulista, 1000', 'São Paulo', 'SP', 1),
(2, 'VirtualCar - Filial Campinas', 'Rua Barão de Jaguara, 500', 'Campinas', 'SP', 1),
(3, 'VirtualCar - Filial Santos', 'Avenida Ana Costa, 200', 'Santos', 'SP', 1);

INSERT INTO `tb_tipo_acao_log` (`descricao_tipo_acao_log`) VALUES
('Login Bem-Sucedido'),
('Logout'),
('Troca de Oficina'),
('Criação de Usuário'),
('Edição de Dados de Usuário'),
('Edição de Vínculos de Usuário'),
('Desativação de Usuário'),
('Reativação de Usuário'),
('Criação de Oficina'),
('Edição de Oficina'),
('Desativação de Oficina'),
('Reativação de Oficina');

-- -----------------------------------------------------\
-- DADOS INICIAIS PARA USUÁRIOS
-- Senha para ambos é '123456'
-- -----------------------------------------------------\

-- Usuário Administrador (ID 1)
INSERT INTO `tb_usuario` (`id_usuario`, `nome_usuario`, `cpf_usuario`, `senha_usuario`, `email_usuario`, `id_tipo_funcionario`, `id_oficina_principal`, `id_status_usuario`) VALUES
(1, 'Administrador Geral', '11111111111', '$2y$10$ifcAkXAO/eCetZXeTQBD9elWnEAVYz8vBxPyqMQHqewYv30.et.Iq', 'admin@virtualcar.com', 1, 1, 1);

-- Usuário Mecânico (ID 2)
INSERT INTO `tb_usuario` (`id_usuario`, `nome_usuario`, `cpf_usuario`, `senha_usuario`, `email_usuario`, `id_tipo_funcionario`, `id_oficina_principal`, `id_status_usuario`) VALUES
(2, 'Carlos Mecânico', '22222222222', '$2y$10$ifcAkXAO/eCetZXeTQBD9elWnEAVYz8vBxPyqMQHqewYv30.et.Iq', 'mecanico@virtualcar.com', 3, 2, 1);

-- -----------------------------------------------------\
-- VÍNCULOS USUÁRIO-OFICINA
-- -----------------------------------------------------\

-- Administrador (ID 1) tem acesso a TODAS as oficinas (1, 2 e 3)
INSERT INTO `tb_usuario_oficina` (`id_usuario`, `id_oficina`) VALUES
(1, 1),
(1, 2),
(1, 3);

-- Mecânico (ID 2) tem acesso apenas à sua oficina principal (2)
INSERT INTO `tb_usuario_oficina` (`id_usuario`, `id_oficina`) VALUES
(2, 2);