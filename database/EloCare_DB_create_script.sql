-- ============================================
-- EloCare - Sistema de Gestão de Clínicas
-- Estrutura do Banco de Dados SQLite
-- ============================================

-- Habilitar suporte a Foreign Keys (importante no SQLite)
PRAGMA foreign_keys = ON;

-- ============================================
-- TABELAS PRINCIPAIS
-- ============================================

-- Tabela de Usuários (base para todos os tipos)
DROP TABLE IF EXISTS usuarios;
CREATE TABLE usuarios (
    id_usuario INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    senha_hash TEXT NOT NULL,
    cpf TEXT NOT NULL UNIQUE,
    telefone TEXT,
    data_nascimento TEXT,
    tipo_usuario TEXT NOT NULL CHECK(tipo_usuario IN ('paciente', 'clinica', 'fornecedor', 'prof_saude')),
    status TEXT NOT NULL DEFAULT 'ativo' CHECK(status IN ('ativo', 'inativo', 'bloqueado')),
    data_cadastro TEXT NOT NULL DEFAULT (datetime('now', 'localtime')),
    ultimo_acesso TEXT
);

-- Índices para usuarios
CREATE INDEX idx_usuarios_email ON usuarios(email);
CREATE INDEX idx_usuarios_tipo ON usuarios(tipo_usuario);
CREATE INDEX idx_usuarios_status ON usuarios(status);

-- Tabela de Pacientes
DROP TABLE IF EXISTS pacientes;
CREATE TABLE pacientes (
    id_paciente INTEGER PRIMARY KEY AUTOINCREMENT,
    id_usuario INTEGER NOT NULL UNIQUE,
    endereco TEXT,
    cidade TEXT,
    estado TEXT,
    cep TEXT,
    convenio TEXT,
    numero_carteirinha TEXT,
    tipo_sanguineo TEXT,
    alergias TEXT,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE
);

-- Índices para pacientes
CREATE INDEX idx_pacientes_cidade ON pacientes(cidade);
CREATE INDEX idx_pacientes_estado ON pacientes(estado);

-- Tabela de Clínicas
DROP TABLE IF EXISTS clinicas;
CREATE TABLE clinicas (
    id_clinica INTEGER PRIMARY KEY AUTOINCREMENT,
    id_usuario INTEGER NOT NULL UNIQUE,
    cnpj TEXT NOT NULL UNIQUE,
    razao_social TEXT NOT NULL,
    nome_fantasia TEXT,
    endereco TEXT,
    cidade TEXT,
    estado TEXT,
    cep TEXT,
    telefone_comercial TEXT,
    especialidades TEXT,
    horario_funcionamento TEXT,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE
);

-- Índices para clinicas
CREATE INDEX idx_clinicas_cidade ON clinicas(cidade);
CREATE INDEX idx_clinicas_estado ON clinicas(estado);

-- Tabela de Profissionais de Saúde
DROP TABLE IF EXISTS profissionais_saude;
CREATE TABLE profissionais_saude (
    id_profissional INTEGER PRIMARY KEY AUTOINCREMENT,
    id_usuario INTEGER NOT NULL UNIQUE,
    id_clinica INTEGER,
    registro_profissional TEXT NOT NULL UNIQUE,
    especialidade TEXT,
    conselho TEXT,
    estado_registro TEXT,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE,
    FOREIGN KEY (id_clinica) REFERENCES clinicas(id_clinica) ON DELETE SET NULL
);

-- Índices para profissionais_saude
CREATE INDEX idx_profissionais_clinica ON profissionais_saude(id_clinica);
CREATE INDEX idx_profissionais_especialidade ON profissionais_saude(especialidade);

-- Tabela de Fornecedores
DROP TABLE IF EXISTS fornecedores;
CREATE TABLE fornecedores (
    id_fornecedor INTEGER PRIMARY KEY AUTOINCREMENT,
    id_usuario INTEGER NOT NULL UNIQUE,
    cnpj TEXT NOT NULL UNIQUE,
    razao_social TEXT NOT NULL,
    categoria TEXT,
    endereco TEXT,
    cidade TEXT,
    estado TEXT,
    cep TEXT,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE
);

-- Índices para fornecedores
CREATE INDEX idx_fornecedores_categoria ON fornecedores(categoria);

-- ============================================
-- MÓDULO DE EQUIPAMENTOS
-- ============================================

-- Tabela de Equipamentos
DROP TABLE IF EXISTS equipamentos;
CREATE TABLE equipamentos (
    id_equipamento INTEGER PRIMARY KEY AUTOINCREMENT,
    id_fornecedor INTEGER,
    nome TEXT NOT NULL,
    descricao TEXT,
    categoria TEXT,
    marca TEXT,
    modelo TEXT,
    preco REAL,
    estoque INTEGER NOT NULL DEFAULT 0,
    status TEXT NOT NULL DEFAULT 'disponivel' CHECK(status IN ('disponivel', 'esgotado', 'descontinuado')),
    imagem_url TEXT,
    data_cadastro TEXT NOT NULL DEFAULT (datetime('now', 'localtime')),
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedores(id_fornecedor) ON DELETE SET NULL
);

-- Índices para equipamentos
CREATE INDEX idx_equipamentos_fornecedor ON equipamentos(id_fornecedor);
CREATE INDEX idx_equipamentos_categoria ON equipamentos(categoria);
CREATE INDEX idx_equipamentos_status ON equipamentos(status);
CREATE INDEX idx_equipamentos_nome ON equipamentos(nome);

-- Tabela de Compras de Equipamentos
DROP TABLE IF EXISTS compras_equipamentos;
CREATE TABLE compras_equipamentos (
    id_compra INTEGER PRIMARY KEY AUTOINCREMENT,
    id_clinica INTEGER NOT NULL,
    id_equipamento INTEGER NOT NULL,
    quantidade INTEGER NOT NULL,
    valor_unitario REAL NOT NULL,
    valor_total REAL NOT NULL,
    data_compra TEXT NOT NULL DEFAULT (datetime('now', 'localtime')),
    status TEXT NOT NULL DEFAULT 'pendente' CHECK(status IN ('pendente', 'pago', 'enviado', 'entregue', 'cancelado')),
    FOREIGN KEY (id_clinica) REFERENCES clinicas(id_clinica) ON DELETE CASCADE,
    FOREIGN KEY (id_equipamento) REFERENCES equipamentos(id_equipamento) ON DELETE RESTRICT
);

-- Índices para compras_equipamentos
CREATE INDEX idx_compras_clinica ON compras_equipamentos(id_clinica);
CREATE INDEX idx_compras_equipamento ON compras_equipamentos(id_equipamento);
CREATE INDEX idx_compras_status ON compras_equipamentos(status);
CREATE INDEX idx_compras_data ON compras_equipamentos(data_compra);

-- Tabela de Pagamentos
DROP TABLE IF EXISTS pagamentos;
CREATE TABLE pagamentos (
    id_pagamento INTEGER PRIMARY KEY AUTOINCREMENT,
    id_compra INTEGER NOT NULL,
    valor_pago REAL NOT NULL,
    forma_pagamento TEXT NOT NULL CHECK(forma_pagamento IN ('cartao_credito', 'cartao_debito', 'boleto', 'pix', 'transferencia')),
    data_pagamento TEXT NOT NULL DEFAULT (datetime('now', 'localtime')),
    status TEXT NOT NULL DEFAULT 'pendente' CHECK(status IN ('pendente', 'aprovado', 'recusado', 'estornado')),
    comprovante_url TEXT,
    FOREIGN KEY (id_compra) REFERENCES compras_equipamentos(id_compra) ON DELETE CASCADE
);

-- Índices para pagamentos
CREATE INDEX idx_pagamentos_compra ON pagamentos(id_compra);
CREATE INDEX idx_pagamentos_status ON pagamentos(status);
CREATE INDEX idx_pagamentos_data ON pagamentos(data_pagamento);

-- ============================================
-- MÓDULO DE EXAMES
-- ============================================

-- Tabela de Exames
DROP TABLE IF EXISTS exames;
CREATE TABLE exames (
    id_exame INTEGER PRIMARY KEY AUTOINCREMENT,
    id_paciente INTEGER NOT NULL,
    id_profissional INTEGER,
    id_clinica INTEGER NOT NULL,
    tipo_exame TEXT NOT NULL,
    data_solicitacao TEXT NOT NULL DEFAULT (datetime('now', 'localtime')),
    data_agendamento TEXT,
    data_realizacao TEXT,
    status TEXT NOT NULL DEFAULT 'solicitado' CHECK(status IN ('solicitado', 'agendado', 'realizado', 'cancelado')),
    resultado TEXT,
    observacoes TEXT,
    arquivo_resultado TEXT,
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE CASCADE,
    FOREIGN KEY (id_profissional) REFERENCES profissionais_saude(id_profissional) ON DELETE SET NULL,
    FOREIGN KEY (id_clinica) REFERENCES clinicas(id_clinica) ON DELETE CASCADE
);

-- Índices para exames
CREATE INDEX idx_exames_paciente ON exames(id_paciente);
CREATE INDEX idx_exames_profissional ON exames(id_profissional);
CREATE INDEX idx_exames_clinica ON exames(id_clinica);
CREATE INDEX idx_exames_status ON exames(status);
CREATE INDEX idx_exames_data_agendamento ON exames(data_agendamento);

-- ============================================
-- MÓDULO DE CONSULTAS (TELEMEDICINA)
-- ============================================

-- Tabela de Consultas
DROP TABLE IF EXISTS consultas;
CREATE TABLE consultas (
    id_consulta INTEGER PRIMARY KEY AUTOINCREMENT,
    id_paciente INTEGER NOT NULL,
    id_profissional INTEGER NOT NULL,
    tipo_consulta TEXT NOT NULL CHECK(tipo_consulta IN ('presencial', 'telemedicina')),
    data_hora_agendada TEXT NOT NULL,
    data_hora_inicio TEXT,
    data_hora_fim TEXT,
    status TEXT NOT NULL DEFAULT 'agendada' CHECK(status IN ('agendada', 'em_andamento', 'concluida', 'cancelada')),
    link_video TEXT,
    motivo TEXT,
    diagnostico TEXT,
    prescricao TEXT,
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE CASCADE,
    FOREIGN KEY (id_profissional) REFERENCES profissionais_saude(id_profissional) ON DELETE CASCADE
);

-- Índices para consultas
CREATE INDEX idx_consultas_paciente ON consultas(id_paciente);
CREATE INDEX idx_consultas_profissional ON consultas(id_profissional);
CREATE INDEX idx_consultas_data ON consultas(data_hora_agendada);
CREATE INDEX idx_consultas_status ON consultas(status);
CREATE INDEX idx_consultas_tipo ON consultas(tipo_consulta);

-- ============================================
-- MÓDULO DE COMUNICAÇÃO
-- ============================================

-- Tabela de Notificações
DROP TABLE IF EXISTS notificacoes;
CREATE TABLE notificacoes (
    id_notificacao INTEGER PRIMARY KEY AUTOINCREMENT,
    id_usuario INTEGER NOT NULL,
    titulo TEXT NOT NULL,
    mensagem TEXT NOT NULL,
    tipo TEXT NOT NULL DEFAULT 'info' CHECK(tipo IN ('info', 'alerta', 'urgente')),
    lida INTEGER NOT NULL DEFAULT 0 CHECK(lida IN (0, 1)),
    data_criacao TEXT NOT NULL DEFAULT (datetime('now', 'localtime')),
    data_leitura TEXT,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE
);

-- Índices para notificacoes
CREATE INDEX idx_notificacoes_usuario ON notificacoes(id_usuario);
CREATE INDEX idx_notificacoes_lida ON notificacoes(lida);
CREATE INDEX idx_notificacoes_tipo ON notificacoes(tipo);
CREATE INDEX idx_notificacoes_data ON notificacoes(data_criacao);

-- Tabela de Recomendações
DROP TABLE IF EXISTS recomendacoes;
CREATE TABLE recomendacoes (
    id_recomendacao INTEGER PRIMARY KEY AUTOINCREMENT,
    id_paciente INTEGER NOT NULL,
    id_profissional INTEGER,
    titulo TEXT NOT NULL,
    descricao TEXT NOT NULL,
    categoria TEXT,
    data_criacao TEXT NOT NULL DEFAULT (datetime('now', 'localtime')),
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE CASCADE,
    FOREIGN KEY (id_profissional) REFERENCES profissionais_saude(id_profissional) ON DELETE SET NULL
);

-- Índices para recomendacoes
CREATE INDEX idx_recomendacoes_paciente ON recomendacoes(id_paciente);
CREATE INDEX idx_recomendacoes_profissional ON recomendacoes(id_profissional);
CREATE INDEX idx_recomendacoes_categoria ON recomendacoes(categoria);

-- ============================================
-- MÓDULO DE HISTÓRICO
-- ============================================

-- Tabela de Histórico Médico
DROP TABLE IF EXISTS historico_medico;
CREATE TABLE historico_medico (
    id_historico INTEGER PRIMARY KEY AUTOINCREMENT,
    id_paciente INTEGER NOT NULL,
    id_consulta INTEGER,
    id_exame INTEGER,
    tipo_registro TEXT NOT NULL CHECK(tipo_registro IN ('consulta', 'exame', 'procedimento', 'internacao', 'outros')),
    data_registro TEXT NOT NULL DEFAULT (datetime('now', 'localtime')),
    descricao TEXT NOT NULL,
    arquivos TEXT,
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE CASCADE,
    FOREIGN KEY (id_consulta) REFERENCES consultas(id_consulta) ON DELETE SET NULL,
    FOREIGN KEY (id_exame) REFERENCES exames(id_exame) ON DELETE SET NULL
);

-- Índices para historico_medico
CREATE INDEX idx_historico_paciente ON historico_medico(id_paciente);
CREATE INDEX idx_historico_consulta ON historico_medico(id_consulta);
CREATE INDEX idx_historico_exame ON historico_medico(id_exame);
CREATE INDEX idx_historico_tipo ON historico_medico(tipo_registro);
CREATE INDEX idx_historico_data ON historico_medico(data_registro);

-- ============================================
-- TABELA DE RELACIONAMENTO
-- ============================================

-- Tabela de Relacionamento Paciente-Clínica
DROP TABLE IF EXISTS paciente_clinica;
CREATE TABLE paciente_clinica (
    id_relacao INTEGER PRIMARY KEY AUTOINCREMENT,
    id_paciente INTEGER NOT NULL,
    id_clinica INTEGER NOT NULL,
    data_vinculo TEXT NOT NULL DEFAULT (datetime('now', 'localtime')),
    status TEXT NOT NULL DEFAULT 'ativo' CHECK(status IN ('ativo', 'inativo')),
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE CASCADE,
    FOREIGN KEY (id_clinica) REFERENCES clinicas(id_clinica) ON DELETE CASCADE,
    UNIQUE(id_paciente, id_clinica)
);

-- Índices para paciente_clinica
CREATE INDEX idx_paciente_clinica_paciente ON paciente_clinica(id_paciente);
CREATE INDEX idx_paciente_clinica_clinica ON paciente_clinica(id_clinica);
CREATE INDEX idx_paciente_clinica_status ON paciente_clinica(status);

-- ============================================
-- VIEWS ÚTEIS
-- ============================================

-- View para listar pacientes com informações do usuário
DROP VIEW IF EXISTS vw_pacientes_completo;
CREATE VIEW vw_pacientes_completo AS
SELECT 
    p.id_paciente,
    u.id_usuario,
    u.nome,
    u.email,
    u.cpf,
    u.telefone,
    u.data_nascimento,
    p.endereco,
    p.cidade,
    p.estado,
    p.cep,
    p.convenio,
    p.numero_carteirinha,
    p.tipo_sanguineo,
    p.alergias,
    u.status,
    u.data_cadastro
FROM pacientes p
INNER JOIN usuarios u ON p.id_usuario = u.id_usuario;

-- View para listar profissionais com informações do usuário e clínica
DROP VIEW IF EXISTS vw_profissionais_completo;
CREATE VIEW vw_profissionais_completo AS
SELECT 
    ps.id_profissional,
    u.id_usuario,
    u.nome,
    u.email,
    u.telefone,
    ps.registro_profissional,
    ps.especialidade,
    ps.conselho,
    ps.estado_registro,
    c.nome_fantasia as clinica_nome,
    c.id_clinica,
    u.status
FROM profissionais_saude ps
INNER JOIN usuarios u ON ps.id_usuario = u.id_usuario
LEFT JOIN clinicas c ON ps.id_clinica = c.id_clinica;

-- View para consultas com dados do paciente e profissional
DROP VIEW IF EXISTS vw_consultas_completo;
CREATE VIEW vw_consultas_completo AS
SELECT 
    c.id_consulta,
    c.tipo_consulta,
    c.data_hora_agendada,
    c.status,
    u_pac.nome as paciente_nome,
    u_pac.telefone as paciente_telefone,
    u_prof.nome as profissional_nome,
    ps.especialidade as profissional_especialidade,
    c.motivo,
    c.link_video
FROM consultas c
INNER JOIN pacientes p ON c.id_paciente = p.id_paciente
INNER JOIN usuarios u_pac ON p.id_usuario = u_pac.id_usuario
INNER JOIN profissionais_saude ps ON c.id_profissional = ps.id_profissional
INNER JOIN usuarios u_prof ON ps.id_usuario = u_prof.id_usuario;

-- View para exames com dados do paciente e clínica
DROP VIEW IF EXISTS vw_exames_completo;
CREATE VIEW vw_exames_completo AS
SELECT 
    e.id_exame,
    e.tipo_exame,
    e.data_solicitacao,
    e.data_agendamento,
    e.data_realizacao,
    e.status,
    u_pac.nome as paciente_nome,
    u_pac.telefone as paciente_telefone,
    cli_user.nome as clinica_nome,
    cli.telefone_comercial as clinica_telefone,
    e.observacoes
FROM exames e
INNER JOIN pacientes p ON e.id_paciente = p.id_paciente
INNER JOIN usuarios u_pac ON p.id_usuario = u_pac.id_usuario
INNER JOIN clinicas cli ON e.id_clinica = cli.id_clinica
INNER JOIN usuarios cli_user ON cli.id_usuario = cli_user.id_usuario;

-- ============================================
-- TRIGGERS ÚTEIS
-- ============================================

-- Trigger para atualizar ultimo_acesso ao fazer login
DROP TRIGGER IF EXISTS trg_atualiza_ultimo_acesso;
CREATE TRIGGER trg_atualiza_ultimo_acesso
AFTER UPDATE OF senha_hash ON usuarios
FOR EACH ROW
BEGIN
    UPDATE usuarios 
    SET ultimo_acesso = datetime('now', 'localtime')
    WHERE id_usuario = NEW.id_usuario;
END;

-- Trigger para marcar data de leitura de notificações
DROP TRIGGER IF EXISTS trg_marca_leitura_notificacao;
CREATE TRIGGER trg_marca_leitura_notificacao
AFTER UPDATE OF lida ON notificacoes
FOR EACH ROW
WHEN NEW.lida = 1 AND OLD.lida = 0
BEGIN
    UPDATE notificacoes 
    SET data_leitura = datetime('now', 'localtime')
    WHERE id_notificacao = NEW.id_notificacao;
END;

-- Trigger para validar estoque ao realizar compra
DROP TRIGGER IF EXISTS trg_valida_estoque_compra;
CREATE TRIGGER trg_valida_estoque_compra
BEFORE INSERT ON compras_equipamentos
FOR EACH ROW
BEGIN
    SELECT CASE
        WHEN (SELECT estoque FROM equipamentos WHERE id_equipamento = NEW.id_equipamento) < NEW.quantidade
        THEN RAISE(ABORT, 'Estoque insuficiente para realizar a compra')
    END;
END;

-- Trigger para atualizar estoque após compra entregue
DROP TRIGGER IF EXISTS trg_atualiza_estoque_entrega;
CREATE TRIGGER trg_atualiza_estoque_entrega
AFTER UPDATE OF status ON compras_equipamentos
FOR EACH ROW
WHEN NEW.status = 'entregue' AND OLD.status != 'entregue'
BEGIN
    UPDATE equipamentos 
    SET estoque = estoque - NEW.quantidade
    WHERE id_equipamento = NEW.id_equipamento;
END;

-- ============================================
-- DADOS DE EXEMPLO (OPCIONAL)
-- ============================================

-- Inserir usuário administrador de exemplo
INSERT INTO usuarios (nome, email, senha_hash, cpf, tipo_usuario, status)
VALUES ('Admin Sistema', 'admin@elocare.com', 'hash_senha_aqui', '000.000.000-00', 'prof_saude', 'ativo');

-- ============================================
-- FIM DO SCRIPT
-- ============================================

-- Verificar se foreign keys estão habilitadas
PRAGMA foreign_keys;

-- Listar todas as tabelas criadas
SELECT name FROM sqlite_master WHERE type='table' ORDER BY name;