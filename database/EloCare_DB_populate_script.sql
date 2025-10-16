-- ============================================
-- EloCare - Script de População COMPLETA
-- Dados de exemplo para TODAS as tabelas
-- ============================================

-- Habilitar suporte a Foreign Keys
PRAGMA foreign_keys = ON;

-- ============================================
-- POPULAÇÃO DE USUÁRIOS
-- ============================================

-- Pacientes (10 usuários)
INSERT INTO usuarios (nome, email, senha_hash, cpf, telefone, data_nascimento, tipo_usuario, status) VALUES
('Maria Silva Santos', 'maria.silva@email.com', '$2b$10$abcdefghijklmnopqrstuv', '123.456.789-01', '(11) 98765-4321', '1985-03-15', 'paciente', 'ativo'),
('João Pedro Oliveira', 'joao.pedro@email.com', '$2b$10$abcdefghijklmnopqrstuv', '234.567.890-12', '(11) 97654-3210', '1990-07-22', 'paciente', 'ativo'),
('Ana Carolina Costa', 'ana.costa@email.com', '$2b$10$abcdefghijklmnopqrstuv', '345.678.901-23', '(11) 96543-2109', '1978-11-30', 'paciente', 'ativo'),
('Carlos Eduardo Lima', 'carlos.lima@email.com', '$2b$10$abcdefghijklmnopqrstuv', '456.789.012-34', '(11) 95432-1098', '1995-01-10', 'paciente', 'ativo'),
('Juliana Fernandes', 'juliana.fernandes@email.com', '$2b$10$abcdefghijklmnopqrstuv', '567.890.123-45', '(11) 94321-0987', '1988-09-05', 'paciente', 'ativo'),
('Roberto Alves', 'roberto.alves@email.com', '$2b$10$abcdefghijklmnopqrstuv', '678.901.234-56', '(11) 93210-9876', '1972-04-18', 'paciente', 'ativo'),
('Patricia Souza', 'patricia.souza@email.com', '$2b$10$abcdefghijklmnopqrstuv', '789.012.345-67', '(11) 92109-8765', '1992-12-25', 'paciente', 'ativo'),
('Fernando Santos', 'fernando.santos@email.com', '$2b$10$abcdefghijklmnopqrstuv', '890.123.456-78', '(11) 91098-7654', '1980-06-14', 'paciente', 'ativo'),
('Camila Rodrigues', 'camila.rodrigues@email.com', '$2b$10$abcdefghijklmnopqrstuv', '901.234.567-89', '(11) 90987-6543', '1997-08-20', 'paciente', 'ativo'),
('Lucas Martins', 'lucas.martins@email.com', '$2b$10$abcdefghijklmnopqrstuv', '012.345.678-90', '(11) 89876-5432', '1986-02-28', 'paciente', 'ativo');

-- Clínicas (5 usuários)
INSERT INTO usuarios (nome, email, senha_hash, cpf, telefone, data_nascimento, tipo_usuario, status) VALUES
('Clínica Vida Saudável', 'contato@vidasaudavel.com', '$2b$10$abcdefghijklmnopqrstuv', '111.222.333-44', '(11) 3000-1000', '2010-01-01', 'clinica', 'ativo'),
('Centro Médico Esperança', 'atendimento@esperanca.com', '$2b$10$abcdefghijklmnopqrstuv', '222.333.444-55', '(11) 3000-2000', '2015-03-15', 'clinica', 'ativo'),
('Clínica Bem Estar', 'contato@bemestar.com', '$2b$10$abcdefghijklmnopqrstuv', '333.444.555-66', '(11) 3000-3000', '2012-06-20', 'clinica', 'ativo'),
('Policlínica Central', 'central@policlinica.com', '$2b$10$abcdefghijklmnopqrstuv', '444.555.666-77', '(11) 3000-4000', '2008-09-10', 'clinica', 'ativo'),
('Clínica Saúde Total', 'info@saudetotal.com', '$2b$10$abcdefghijklmnopqrstuv', '555.666.777-88', '(11) 3000-5000', '2018-11-05', 'clinica', 'ativo');

-- Profissionais de Saúde (8 usuários)
INSERT INTO usuarios (nome, email, senha_hash, cpf, telefone, data_nascimento, tipo_usuario, status) VALUES
('Dr. Ricardo Mendes', 'ricardo.mendes@medico.com', '$2b$10$abcdefghijklmnopqrstuv', '666.777.888-99', '(11) 99999-0001', '1975-05-10', 'prof_saude', 'ativo'),
('Dra. Mariana Campos', 'mariana.campos@medico.com', '$2b$10$abcdefghijklmnopqrstuv', '777.888.999-00', '(11) 99999-0002', '1982-08-22', 'prof_saude', 'ativo'),
('Dr. Paulo Henrique', 'paulo.henrique@medico.com', '$2b$10$abcdefghijklmnopqrstuv', '888.999.000-11', '(11) 99999-0003', '1979-12-15', 'prof_saude', 'ativo'),
('Dra. Beatriz Oliveira', 'beatriz.oliveira@medico.com', '$2b$10$abcdefghijklmnopqrstuv', '999.000.111-22', '(11) 99999-0004', '1987-03-30', 'prof_saude', 'ativo'),
('Dr. André Costa', 'andre.costa@medico.com', '$2b$10$abcdefghijklmnopqrstuv', '000.111.222-33', '(11) 99999-0005', '1984-07-18', 'prof_saude', 'ativo'),
('Dra. Fernanda Lima', 'fernanda.lima@medico.com', '$2b$10$abcdefghijklmnopqrstuv', '111.222.333-45', '(11) 99999-0006', '1991-10-05', 'prof_saude', 'ativo'),
('Dr. Gabriel Santos', 'gabriel.santos@medico.com', '$2b$10$abcdefghijklmnopqrstuv', '222.333.444-56', '(11) 99999-0007', '1976-01-25', 'prof_saude', 'ativo'),
('Dra. Carolina Reis', 'carolina.reis@medico.com', '$2b$10$abcdefghijklmnopqrstuv', '333.444.555-67', '(11) 99999-0008', '1989-04-12', 'prof_saude', 'ativo');

-- Fornecedores (3 usuários)
INSERT INTO usuarios (nome, email, senha_hash, cpf, telefone, data_nascimento, tipo_usuario, status) VALUES
('MedEquip Distribuidora', 'vendas@medequip.com', '$2b$10$abcdefghijklmnopqrstuv', '444.555.666-78', '(11) 4000-1000', '2005-02-20', 'fornecedor', 'ativo'),
('HealthTech Suprimentos', 'contato@healthtech.com', '$2b$10$abcdefghijklmnopqrstuv', '555.666.777-89', '(11) 4000-2000', '2010-08-15', 'fornecedor', 'ativo'),
('BioMed Equipamentos', 'comercial@biomed.com', '$2b$10$abcdefghijklmnopqrstuv', '666.777.888-90', '(11) 4000-3000', '2012-12-01', 'fornecedor', 'ativo');

-- ============================================
-- POPULAÇÃO DE PACIENTES
-- ============================================

INSERT INTO pacientes (id_usuario, endereco, cidade, estado, cep, convenio, numero_carteirinha, tipo_sanguineo, alergias) VALUES
(1, 'Rua das Flores, 123', 'São Paulo', 'SP', '01234-567', 'Unimed', '123456789', 'A+', 'Penicilina'),
(2, 'Av. Paulista, 1000', 'São Paulo', 'SP', '01310-100', 'Bradesco Saúde', '987654321', 'O+', 'Nenhuma'),
(3, 'Rua Augusta, 500', 'São Paulo', 'SP', '01305-000', 'Amil', '456789123', 'B+', 'Dipirona'),
(4, 'Rua Oscar Freire, 200', 'São Paulo', 'SP', '01426-000', 'SulAmérica', '789123456', 'AB+', 'Nenhuma'),
(5, 'Av. Rebouças, 3000', 'São Paulo', 'SP', '05402-600', 'Porto Seguro', '321654987', 'A-', 'Látex'),
(6, 'Rua Haddock Lobo, 595', 'São Paulo', 'SP', '01414-001', 'Unimed', '654987321', 'O-', 'Nenhuma'),
(7, 'Av. Faria Lima, 1500', 'São Paulo', 'SP', '01452-000', 'Bradesco Saúde', '147258369', 'B-', 'Ácido acetilsalicílico'),
(8, 'Rua da Consolação, 1000', 'São Paulo', 'SP', '01302-000', 'Amil', '258369147', 'AB-', 'Nenhuma'),
(9, 'Av. Ibirapuera, 3103', 'São Paulo', 'SP', '04029-902', 'SulAmérica', '369147258', 'A+', 'Contraste iodado'),
(10, 'Rua Vergueiro, 2000', 'São Paulo', 'SP', '04102-000', 'Porto Seguro', '741852963', 'O+', 'Nenhuma');

-- ============================================
-- POPULAÇÃO DE CLÍNICAS
-- ============================================

INSERT INTO clinicas (id_usuario, cnpj, razao_social, nome_fantasia, endereco, cidade, estado, cep, telefone_comercial, especialidades, horario_funcionamento) VALUES
(11, '12.345.678/0001-90', 'Clínica Vida Saudável LTDA', 'Vida Saudável', 'Rua dos Médicos, 100', 'São Paulo', 'SP', '01234-000', '(11) 3000-1000', 'Clínica Geral, Cardiologia, Pediatria', 'Seg-Sex: 7h-19h, Sáb: 8h-13h'),
(12, '23.456.789/0001-01', 'Centro Médico Esperança SA', 'Esperança', 'Av. da Saúde, 500', 'São Paulo', 'SP', '01235-000', '(11) 3000-2000', 'Ortopedia, Neurologia, Dermatologia', 'Seg-Sex: 6h-20h'),
(13, '34.567.890/0001-12', 'Clínica Bem Estar EIRELI', 'Bem Estar', 'Rua do Bem, 250', 'São Paulo', 'SP', '01236-000', '(11) 3000-3000', 'Ginecologia, Obstetrícia, Urologia', 'Seg-Sex: 8h-18h, Sáb: 8h-12h'),
(14, '45.678.901/0001-23', 'Policlínica Central LTDA', 'Policlínica Central', 'Av. Central, 1000', 'São Paulo', 'SP', '01237-000', '(11) 3000-4000', 'Clínica Geral, Oftalmologia, Otorrinolaringologia', 'Seg-Sáb: 7h-21h'),
(15, '56.789.012/0001-34', 'Clínica Saúde Total ME', 'Saúde Total', 'Rua Total, 777', 'São Paulo', 'SP', '01238-000', '(11) 3000-5000', 'Endocrinologia, Gastroenterologia, Reumatologia', 'Seg-Sex: 7h-19h');

-- ============================================
-- POPULAÇÃO DE PROFISSIONAIS DE SAÚDE
-- ============================================

INSERT INTO profissionais_saude (id_usuario, id_clinica, registro_profissional, especialidade, conselho, estado_registro) VALUES
(16, 1, 'CRM/SP 123456', 'Cardiologia', 'CRM', 'SP'),
(17, 1, 'CRM/SP 234567', 'Pediatria', 'CRM', 'SP'),
(18, 2, 'CRM/SP 345678', 'Ortopedia', 'CRM', 'SP'),
(19, 2, 'CRM/SP 456789', 'Neurologia', 'CRM', 'SP'),
(20, 3, 'CRM/SP 567890', 'Ginecologia', 'CRM', 'SP'),
(21, 4, 'CRM/SP 678901', 'Oftalmologia', 'CRM', 'SP'),
(22, 4, 'CRM/SP 789012', 'Clínica Geral', 'CRM', 'SP'),
(23, 5, 'CRM/SP 890123', 'Endocrinologia', 'CRM', 'SP');

-- ============================================
-- POPULAÇÃO DE FORNECEDORES
-- ============================================

INSERT INTO fornecedores (id_usuario, cnpj, razao_social, categoria, endereco, cidade, estado, cep) VALUES
(24, '11.222.333/0001-44', 'MedEquip Distribuidora LTDA', 'Equipamentos Médicos', 'Rua dos Fornecedores, 100', 'São Paulo', 'SP', '01240-000'),
(25, '22.333.444/0001-55', 'HealthTech Suprimentos SA', 'Tecnologia Médica', 'Av. dos Hospitais, 500', 'São Paulo', 'SP', '01241-000'),
(26, '33.444.555/0001-66', 'BioMed Equipamentos ME', 'Equipamentos Hospitalares', 'Rua da Saúde, 250', 'São Paulo', 'SP', '01242-000');

-- ============================================
-- POPULAÇÃO DE EQUIPAMENTOS
-- ============================================

INSERT INTO equipamentos (id_fornecedor, nome, descricao, categoria, marca, modelo, preco, estoque, status) VALUES
(1, 'Estetoscópio Profissional', 'Estetoscópio de alta qualidade para ausculta cardíaca e pulmonar', 'Diagnóstico', 'Littmann', '3M Classic III', 450.00, 50, 'disponivel'),
(1, 'Termômetro Digital', 'Termômetro digital infravermelho sem contato', 'Diagnóstico', 'G-Tech', 'Therm Pro', 120.00, 100, 'disponivel'),
(1, 'Oxímetro de Pulso', 'Medidor de saturação de oxigênio e frequência cardíaca', 'Monitoramento', 'Contec', 'CMS50D', 180.00, 75, 'disponivel'),
(2, 'Esfigmomanômetro Digital', 'Aparelho de pressão arterial automático', 'Diagnóstico', 'Omron', 'HEM-7130', 250.00, 60, 'disponivel'),
(2, 'Nebulizador Portátil', 'Nebulizador ultrassônico compacto', 'Terapêutico', 'NS', 'NB-80U', 350.00, 40, 'disponivel'),
(2, 'Maca Hospitalar', 'Maca dobrável com rodas para transporte', 'Mobiliário', 'Biotec', 'MH-2000', 1200.00, 20, 'disponivel'),
(3, 'Desfibrilador Externo', 'DEA automático com instruções de voz', 'Emergência', 'Philips', 'HeartStart', 8500.00, 10, 'disponivel'),
(3, 'Eletrocardiógrafo', 'ECG digital de 12 derivações', 'Diagnóstico', 'Bionet', 'CardioTouch 3000', 15000.00, 5, 'disponivel'),
(3, 'Monitor Multiparamétrico', 'Monitor de sinais vitais completo', 'Monitoramento', 'Mindray', 'BeneView T5', 12000.00, 8, 'disponivel'),
(1, 'Otoscópio LED', 'Otoscópio com iluminação LED para exame de ouvido', 'Diagnóstico', 'Welch Allyn', 'MacroView', 680.00, 35, 'disponivel'),
(2, 'Glicosímetro', 'Medidor de glicose sanguínea digital', 'Diagnóstico', 'Accu-Chek', 'Active', 95.00, 120, 'disponivel'),
(3, 'Autoclave Digital', 'Esterilizador a vapor automático 21L', 'Esterilização', 'Cristófoli', 'Vitale 21', 4500.00, 15, 'disponivel');

-- ============================================
-- POPULAÇÃO DE COMPRAS DE EQUIPAMENTOS
-- ============================================

INSERT INTO compras_equipamentos (id_clinica, id_equipamento, quantidade, valor_unitario, valor_total, data_compra, status) VALUES
(1, 1, 5, 450.00, 2250.00, '2025-09-15 10:30:00', 'entregue'),
(1, 2, 10, 120.00, 1200.00, '2025-09-15 10:30:00', 'entregue'),
(2, 4, 3, 250.00, 750.00, '2025-09-20 14:00:00', 'entregue'),
(2, 8, 1, 15000.00, 15000.00, '2025-09-22 09:00:00', 'enviado'),
(3, 5, 4, 350.00, 1400.00, '2025-10-01 11:15:00', 'pago'),
(3, 6, 2, 1200.00, 2400.00, '2025-10-01 11:15:00', 'pago'),
(4, 7, 1, 8500.00, 8500.00, '2025-10-05 15:45:00', 'pago'),
(4, 10, 3, 680.00, 2040.00, '2025-10-08 10:00:00', 'enviado'),
(5, 9, 2, 12000.00, 24000.00, '2025-10-10 13:30:00', 'pendente'),
(1, 3, 8, 180.00, 1440.00, '2025-10-12 09:20:00', 'pendente');

-- ============================================
-- POPULAÇÃO DE PAGAMENTOS
-- ============================================

INSERT INTO pagamentos (id_compra, valor_pago, forma_pagamento, data_pagamento, status, comprovante_url) VALUES
(1, 2250.00, 'cartao_credito', '2025-09-15 10:35:00', 'aprovado', 'https://elocare.com/comprovantes/PAG001.pdf'),
(2, 750.00, 'pix', '2025-09-20 14:05:00', 'aprovado', 'https://elocare.com/comprovantes/PAG002.pdf'),
(3, 15000.00, 'boleto', '2025-09-23 16:00:00', 'aprovado', 'https://elocare.com/comprovantes/PAG003.pdf'),
(4, 1400.00, 'cartao_debito', '2025-10-01 11:20:00', 'aprovado', 'https://elocare.com/comprovantes/PAG004.pdf'),
(5, 2400.00, 'cartao_credito', '2025-10-01 11:20:00', 'aprovado', 'https://elocare.com/comprovantes/PAG005.pdf'),
(6, 8500.00, 'transferencia', '2025-10-05 16:00:00', 'aprovado', 'https://elocare.com/comprovantes/PAG006.pdf'),
(7, 2040.00, 'pix', '2025-10-08 10:10:00', 'aprovado', 'https://elocare.com/comprovantes/PAG007.pdf'),
(8, 24000.00, 'boleto', '2025-10-10 14:00:00', 'pendente', NULL),
(9, 1440.00, 'cartao_credito', '2025-10-12 09:30:00', 'pendente', NULL);

-- ============================================
-- POPULAÇÃO DE CONSULTAS
-- ============================================

INSERT INTO consultas (id_paciente, id_profissional, tipo_consulta, data_hora_agendada, data_hora_inicio, data_hora_fim, status, link_video, motivo, diagnostico, prescricao) VALUES
(1, 1, 'presencial', '2025-10-20 09:00:00', NULL, NULL, 'agendada', NULL, 'Dor no peito e falta de ar', NULL, NULL),
(2, 2, 'telemedicina', '2025-10-20 10:30:00', NULL, NULL, 'agendada', 'https://meet.elocare.com/consulta-abc123', 'Febre e tosse em criança', NULL, NULL),
(3, 3, 'presencial', '2025-10-21 14:00:00', NULL, NULL, 'agendada', NULL, 'Dor no joelho após exercício', NULL, NULL),
(4, 4, 'telemedicina', '2025-10-21 15:30:00', NULL, NULL, 'agendada', 'https://meet.elocare.com/consulta-def456', 'Dor de cabeça persistente', NULL, NULL),
(5, 5, 'presencial', '2025-10-22 11:00:00', NULL, NULL, 'agendada', NULL, 'Consulta pré-natal de rotina', NULL, NULL),
(6, 6, 'presencial', '2025-10-18 08:30:00', '2025-10-18 08:35:00', '2025-10-18 09:15:00', 'concluida', NULL, 'Exame de vista para óculos', 'Miopia leve', 'Óculos com grau -1.0 em ambos os olhos'),
(7, 7, 'telemedicina', '2025-10-18 16:00:00', '2025-10-18 16:05:00', '2025-10-18 16:30:00', 'concluida', 'https://meet.elocare.com/consulta-ghi789', 'Resfriado comum', 'Resfriado viral', 'Repouso, hidratação e paracetamol 500mg 8/8h'),
(8, 8, 'presencial', '2025-10-19 10:00:00', '2025-10-19 10:10:00', '2025-10-19 10:50:00', 'concluida', NULL, 'Avaliação de diabetes', 'Diabetes tipo 2 controlado', 'Manter metformina 850mg 2x/dia'),
(9, 1, 'presencial', '2025-10-19 13:30:00', '2025-10-19 13:35:00', '2025-10-19 14:10:00', 'concluida', NULL, 'Seguimento cardiológico', 'Hipertensão controlada', 'Losartana 50mg 1x/dia'),
(10, 2, 'telemedicina', '2025-10-19 17:00:00', '2025-10-19 17:05:00', '2025-10-19 17:25:00', 'concluida', 'https://meet.elocare.com/consulta-jkl012', 'Orientação sobre vacinas', 'Calendário vacinal em dia', 'Agendar próximas vacinas aos 12 meses'),
(1, 7, 'presencial', '2025-10-23 09:30:00', NULL, NULL, 'agendada', NULL, 'Check-up geral anual', NULL, NULL),
(3, 5, 'presencial', '2025-10-23 14:30:00', NULL, NULL, 'agendada', NULL, 'Consulta ginecológica de rotina', NULL, NULL),
(4, 8, 'telemedicina', '2025-10-24 10:00:00', NULL, NULL, 'agendada', 'https://meet.elocare.com/consulta-mno345', 'Acompanhamento de tratamento', NULL, NULL),
(7, 4, 'presencial', '2025-10-24 15:00:00', NULL, NULL, 'agendada', NULL, 'Enxaqueca crônica', NULL, NULL),
(9, 3, 'presencial', '2025-10-25 11:30:00', NULL, NULL, 'agendada', NULL, 'Dor lombar', NULL, NULL);

-- ============================================
-- POPULAÇÃO DE EXAMES
-- ============================================

INSERT INTO exames (id_paciente, id_profissional, id_clinica, tipo_exame, data_solicitacao, data_agendamento, data_realizacao, status, resultado, observacoes, arquivo_resultado) VALUES
(1, 1, 1, 'Eletrocardiograma', '2025-10-15 09:00:00', '2025-10-22 08:00:00', NULL, 'agendado', NULL, 'Paciente com histórico familiar de problemas cardíacos', NULL),
(1, 1, 1, 'Ecocardiograma', '2025-10-15 09:00:00', '2025-10-23 09:00:00', NULL, 'agendado', NULL, 'Avaliar função cardíaca', NULL),
(2, 2, 1, 'Hemograma Completo', '2025-10-16 10:30:00', '2025-10-20 07:30:00', NULL, 'agendado', NULL, 'Verificar quadro infeccioso', NULL),
(3, 3, 2, 'Radiografia de Joelho', '2025-10-16 14:00:00', '2025-10-21 10:00:00', NULL, 'agendado', NULL, 'Avaliar possível lesão ligamentar', NULL),
(4, 4, 2, 'Ressonância Magnética Cerebral', '2025-10-17 15:30:00', '2025-10-25 14:00:00', NULL, 'agendado', NULL, 'Investigar causa de cefaleia', NULL),
(5, 5, 3, 'Ultrassom Obstétrico', '2025-10-17 11:00:00', '2025-10-24 11:00:00', NULL, 'agendado', NULL, 'Acompanhamento gestacional', NULL),
(6, 6, 4, 'Exame de Fundo de Olho', '2025-10-12 08:30:00', '2025-10-18 08:30:00', '2025-10-18 08:45:00', 'realizado', 'Retina normal, sem alterações', 'Avaliação da retina - resultado normal', 'https://elocare.com/exames/EXM001.pdf'),
(7, 7, 4, 'Teste Rápido COVID-19', '2025-10-13 16:00:00', '2025-10-18 16:00:00', '2025-10-18 16:15:00', 'realizado', 'Negativo para SARS-CoV-2', 'Resultado negativo', 'https://elocare.com/exames/EXM002.pdf'),
(8, 8, 5, 'Glicemia em Jejum', '2025-10-14 10:00:00', '2025-10-19 07:00:00', '2025-10-19 07:15:00', 'realizado', '105 mg/dL', 'Resultado: 105 mg/dL - Dentro da normalidade', 'https://elocare.com/exames/EXM003.pdf'),
(8, 8, 5, 'Hemoglobina Glicada', '2025-10-14 10:00:00', '2025-10-19 07:00:00', '2025-10-19 07:15:00', 'realizado', '6.2%', 'Resultado: 6.2% - Bom controle glicêmico', 'https://elocare.com/exames/EXM004.pdf'),
(9, 1, 1, 'Teste Ergométrico', '2025-10-14 13:30:00', '2025-10-26 08:00:00', NULL, 'agendado', NULL, 'Avaliar capacidade cardiovascular', NULL),
(10, 2, 1, 'Sorologia para Rubéola', '2025-10-14 17:00:00', '2025-10-21 07:30:00', NULL, 'agendado', NULL, 'Verificar imunização', NULL),
(3, 5, 3, 'Papanicolau', '2025-10-15 14:30:00', '2025-10-23 09:00:00', NULL, 'agendado', NULL, 'Exame preventivo anual', NULL),
(4, 8, 5, 'Perfil Lipídico', '2025-10-16 10:00:00', '2025-10-22 07:00:00', NULL, 'agendado', NULL, 'Avaliar colesterol e triglicerídeos', NULL),
(7, 4, 2, 'Tomografia Computadorizada', '2025-10-16 15:00:00', '2025-10-28 10:00:00', NULL, 'agendado', NULL, 'Complementar investigação neurológica', NULL);

-- ============================================
-- POPULAÇÃO DE NOTIFICAÇÕES
-- ============================================

INSERT INTO notificacoes (id_usuario, titulo, mensagem, tipo, lida, data_criacao, data_leitura) VALUES
(1, 'Consulta Agendada', 'Sua consulta com Dr. Ricardo Mendes está agendada para 20/10/2025 às 09:00', 'info', 1, '2025-10-15 09:05:00', '2025-10-15 10:30:00'),
(1, 'Exame Agendado', 'Seu eletrocardiograma está agendado para 22/10/2025 às 08:00', 'info', 1, '2025-10-15 09:10:00', '2025-10-15 10:30:00'),
(1, 'Lembrete de Consulta', 'Lembre-se: consulta amanhã às 09:00 com Dr. Ricardo Mendes', 'alerta', 0, '2025-10-19 18:00:00', NULL),
(2, 'Telemedicina Agendada', 'Sua consulta online com Dra. Mariana Campos será em 20/10/2025 às 10:30. Link será enviado 15min antes.', 'info', 1, '2025-10-16 10:35:00', '2025-10-16 14:20:00'),
(2, 'Resultado de Exame', 'O resultado do hemograma completo está disponível', 'info', 0, '2025-10-19 14:00:00', NULL),
(3, 'Consulta Confirmada', 'Consulta com Dr. Paulo Henrique confirmada para 21/10/2025 às 14:00', 'info', 1, '2025-10-16 14:05:00', '2025-10-17 08:00:00'),
(4, 'Link de Telemedicina', 'Acesse sua consulta online através do link no painel de consultas', 'alerta', 0, '2025-10-21 15:15:00', NULL),
(5, 'Exame Pré-Natal', 'Ultrassom obstétrico agendado para 24/10/2025 às 11:00', 'info', 1, '2025-10-17 11:10:00', '2025-10-17 16:45:00'),
(6, 'Resultado Disponível', 'Resultado do exame de fundo de olho disponível para visualização', 'info', 1, '2025-10-18 09:30:00', '2025-10-18 10:15:00'),
(7, 'Prescrição Médica', 'Nova prescrição médica disponível. Verifique na seção de consultas.', 'alerta', 1, '2025-10-18 16:35:00', '2025-10-18 18:00:00'),
(8, 'Acompanhamento Diabetes', 'Resultados dos exames de glicemia disponíveis', 'info', 1, '2025-10-19 10:55:00', '2025-10-19 11:30:00'),
(9, 'Consulta Concluída', 'Consulta cardiológica concluída. Prescrição e orientações disponíveis.', 'info', 1, '2025-10-19 14:15:00', '2025-10-19 15:00:00'),
(10, 'Calendário Vacinal', 'Orientações sobre vacinação disponíveis no histórico', 'info', 1, '2025-10-19 17:30:00', '2025-10-19 19:00:00'),
(1, 'Check-up Anual', 'Lembre-se do check-up geral em 23/10/2025 às 09:30', 'info', 0, '2025-10-15 08:00:00', NULL),
(3, 'Exame Preventivo', 'Exame de papanicolau agendado para 23/10/2025', 'info', 0, '2025-10-15 14:35:00', NULL),
(11, 'Nova Compra Recebida', 'Pedido #001 - Estetoscópios e Termômetros - Total: R$ 3.450,00', 'info', 1, '2025-09-15 10:35:00', '2025-09-15 11:00:00'),
(12, 'Equipamento em Trânsito', 'Pedido #004 - Eletrocardiógrafo enviado. Previsão de entrega: 5 dias', 'alerta', 0, '2025-09-23 09:30:00', NULL),
(14, 'Pagamento Aprovado', 'Pagamento de R$ 8.500,00 aprovado para compra do Desfibrilador', 'info', 1, '2025-10-05 16:05:00', '2025-10-05 16:30:00'),
(16, 'Novo Paciente', 'Maria Silva Santos foi vinculada à sua clínica', 'info', 1, '2025-09-01 10:00:00', '2025-09-01 10:30:00'),
(17, 'Consulta Realizada', 'Consulta com João Pedro Oliveira concluída com sucesso', 'info', 1, '2025-10-19 17:30:00', '2025-10-19 18:00:00'),
(20, 'Exame Solicitado', 'Novo exame de ultrassom obstétrico solicitado para Juliana Fernandes', 'info', 0, '2025-10-17 11:10:00', NULL);

-- ============================================
-- POPULAÇÃO DE RECOMENDAÇÕES
-- ============================================

INSERT INTO recomendacoes (id_paciente, id_profissional, titulo, descricao, categoria, data_criacao) VALUES
(1, 1, 'Atividade Física Regular', 'Recomendo caminhadas de 30 minutos, 5 vezes por semana, para melhorar a saúde cardiovascular.', 'Exercícios', '2025-10-19 14:15:00'),
(1, 1, 'Dieta com Baixo Sódio', 'Evitar alimentos processados e reduzir o sal nas refeições para controle da pressão arterial.', 'Alimentação', '2025-10-19 14:15:00'),
(2, 2, 'Hidratação Adequada', 'Manter a criança bem hidratada, oferecendo água e sucos naturais ao longo do dia.', 'Cuidados Gerais', '2025-10-19 17:25:00'),
(2, 2, 'Calendário de Vacinação', 'Acompanhar o calendário de vacinação e agendar as próximas doses conforme orientação.', 'Prevenção', '2025-10-19 17:25:00'),
(5, 5, 'Suplementação Pré-Natal', 'Continuar com ácido fólico e ferro conforme prescrito durante toda a gestação.', 'Gestação', '2025-10-17 11:15:00'),
(5, 5, 'Exercícios para Gestantes', 'Praticar yoga ou pilates para gestantes, 2-3 vezes por semana, com acompanhamento.', 'Exercícios', '2025-10-17 11:15:00'),
(6, 6, 'Uso Correto dos Óculos', 'Utilizar os óculos durante todo o dia, especialmente para leitura e uso de telas.', 'Cuidados Gerais', '2025-10-18 09:15:00'),
(7, 7, 'Repouso e Recuperação', 'Descansar adequadamente por 3-5 dias e evitar ambientes fechados com aglomeração.', 'Cuidados Gerais', '2025-10-18 16:30:00'),
(8, 8, 'Controle Glicêmico', 'Monitorar a glicemia em jejum semanalmente e registrar os valores para acompanhamento.', 'Monitoramento', '2025-10-19 10:50:00'),
(8, 8, 'Alimentação Balanceada', 'Preferir alimentos integrais, verduras e proteínas magras. Evitar açúcares refinados.', 'Alimentação', '2025-10-19 10:50:00'),
(9, 1, 'Medicação Regular', 'Tomar a medicação anti-hipertensiva sempre no mesmo horário, pela manhã.', 'Medicamentos', '2025-10-19 14:10:00'),
(9, 1, 'Monitoramento Pressórico', 'Medir a pressão arterial 2 vezes por semana e anotar os valores.', 'Monitoramento', '2025-10-19 14:10:00');

-- ============================================
-- POPULAÇÃO DE HISTÓRICO MÉDICO
-- ============================================

INSERT INTO historico_medico (id_paciente, id_consulta, id_exame, tipo_registro, data_registro, descricao, arquivos) VALUES
(6, 6, 7, 'consulta', '2025-10-18 09:15:00', 'Consulta oftalmológica - Miopia leve diagnosticada. Prescrição de óculos com grau -1.0 em ambos os olhos.', 'https://elocare.com/historico/HIST001.pdf'),
(6, NULL, 7, 'exame', '2025-10-18 08:45:00', 'Exame de fundo de olho - Retina normal, sem alterações detectadas.', 'https://elocare.com/exames/EXM001.pdf'),
(7, 7, 8, 'consulta', '2025-10-18 16:30:00', 'Telemedicina - Resfriado viral. Orientação para repouso, hidratação e uso de paracetamol.', 'https://elocare.com/historico/HIST002.pdf'),
(7, NULL, 8, 'exame', '2025-10-18 16:15:00', 'Teste rápido COVID-19 - Resultado negativo.', 'https://elocare.com/exames/EXM002.pdf'),
(8, 8, 9, 'consulta', '2025-10-19 10:50:00', 'Avaliação de diabetes tipo 2. Paciente com bom controle glicêmico. Manutenção do tratamento atual.', 'https://elocare.com/historico/HIST003.pdf'),
(8, NULL, 9, 'exame', '2025-10-19 07:15:00', 'Glicemia em jejum - 105 mg/dL (normal). Hemoglobina glicada - 6.2% (bom controle).', 'https://elocare.com/exames/EXM003.pdf,https://elocare.com/exames/EXM004.pdf'),
(9, 9, NULL, 'consulta', '2025-10-19 14:10:00', 'Seguimento cardiológico - Hipertensão arterial controlada com losartana 50mg/dia.', 'https://elocare.com/historico/HIST004.pdf'),
(10, 10, NULL, 'consulta', '2025-10-19 17:25:00', 'Orientação pediátrica sobre calendário vacinal. Criança com desenvolvimento adequado.', 'https://elocare.com/historico/HIST005.pdf'),
(1, NULL, NULL, 'procedimento', '2025-08-15 14:30:00', 'Cateterismo cardíaco - Procedimento realizado sem intercorrências. Artérias coronárias sem obstruções significativas.', 'https://elocare.com/historico/HIST006.pdf'),
(3, NULL, NULL, 'internacao', '2025-07-20 10:00:00', 'Internação para tratamento de pneumonia. Alta após 5 dias com melhora clínica completa.', 'https://elocare.com/historico/HIST007.pdf'),
(5, NULL, NULL, 'outros', '2025-09-10 08:00:00', 'Primeira consulta pré-natal. IG: 8 semanas. Solicitados exames de rotina.', 'https://elocare.com/historico/HIST008.pdf'),
(6, NULL, NULL, 'outros', '2025-09-05 15:00:00', 'Avaliação oftalmológica anterior - Acuidade visual reduzida, investigação para miopia.', 'https://elocare.com/historico/HIST009.pdf');

-- ============================================
-- POPULAÇÃO DE RELACIONAMENTO PACIENTE-CLÍNICA
-- ============================================

INSERT INTO paciente_clinica (id_paciente, id_clinica, data_vinculo, status) VALUES
(1, 1, '2025-09-01 10:00:00', 'ativo'),
(2, 1, '2025-09-05 11:30:00', 'ativo'),
(3, 2, '2025-09-08 14:00:00', 'ativo'),
(3, 3, '2025-09-10 09:00:00', 'ativo'),
(4, 2, '2025-09-12 15:30:00', 'ativo'),
(4, 5, '2025-09-15 10:15:00', 'ativo'),
(5, 3, '2025-09-18 11:00:00', 'ativo'),
(6, 4, '2025-09-20 08:30:00', 'ativo'),
(7, 4, '2025-09-22 16:00:00', 'ativo'),
(8, 5, '2025-09-25 10:00:00', 'ativo'),
(9, 1, '2025-09-28 13:30:00', 'ativo'),
(10, 1, '2025-10-01 17:00:00', 'ativo'),
(1, 4, '2025-10-05 09:00:00', 'ativo'),
(2, 3, '2025-10-08 14:30:00', 'ativo'),
(7, 2, '2025-10-10 11:00:00', 'ativo');

-- ============================================
-- VERIFICAÇÃO DOS DADOS INSERIDOS
-- ============================================

-- Contar registros por tabela
SELECT 'RESUMO DA POPULAÇÃO DE DADOS' as info, '' as detalhes
UNION ALL
SELECT '================================', ''
UNION ALL
SELECT 'Usuários', CAST(COUNT(*) AS TEXT) || ' registros' FROM usuarios
UNION ALL
SELECT 'Pacientes', CAST(COUNT(*) AS TEXT) || ' registros' FROM pacientes
UNION ALL
SELECT 'Clínicas', CAST(COUNT(*) AS TEXT) || ' registros' FROM clinicas
UNION ALL
SELECT 'Profissionais de Saúde', CAST(COUNT(*) AS TEXT) || ' registros' FROM profissionais_saude
UNION ALL
SELECT 'Fornecedores', CAST(COUNT(*) AS TEXT) || ' registros' FROM fornecedores
UNION ALL
SELECT 'Equipamentos', CAST(COUNT(*) AS TEXT) || ' registros' FROM equipamentos
UNION ALL
SELECT 'Compras de Equipamentos', CAST(COUNT(*) AS TEXT) || ' registros' FROM compras_equipamentos
UNION ALL
SELECT 'Pagamentos', CAST(COUNT(*) AS TEXT) || ' registros' FROM pagamentos
UNION ALL
SELECT 'Consultas', CAST(COUNT(*) AS TEXT) || ' registros' FROM consultas
UNION ALL
SELECT 'Exames', CAST(COUNT(*) AS TEXT) || ' registros' FROM exames
UNION ALL
SELECT 'Notificações', CAST(COUNT(*) AS TEXT) || ' registros' FROM notificacoes
UNION ALL
SELECT 'Recomendações', CAST(COUNT(*) AS TEXT) || ' registros' FROM recomendacoes
UNION ALL
SELECT 'Histórico Médico', CAST(COUNT(*) AS TEXT) || ' registros' FROM historico_medico
UNION ALL
SELECT 'Relacionamentos Paciente-Clínica', CAST(COUNT(*) AS TEXT) || ' registros' FROM paciente_clinica
UNION ALL
SELECT '================================', ''
UNION ALL
SELECT 'TOTAL DE REGISTROS', CAST((
    (SELECT COUNT(*) FROM usuarios) +
    (SELECT COUNT(*) FROM pacientes) +
    (SELECT COUNT(*) FROM clinicas) +
    (SELECT COUNT(*) FROM profissionais_saude) +
    (SELECT COUNT(*) FROM fornecedores) +
    (SELECT COUNT(*) FROM equipamentos) +
    (SELECT COUNT(*) FROM compras_equipamentos) +
    (SELECT COUNT(*) FROM pagamentos) +
    (SELECT COUNT(*) FROM consultas) +
    (SELECT COUNT(*) FROM exames) +
    (SELECT COUNT(*) FROM notificacoes) +
    (SELECT COUNT(*) FROM recomendacoes) +
    (SELECT COUNT(*) FROM historico_medico) +
    (SELECT COUNT(*) FROM paciente_clinica)
) AS TEXT) || ' registros';

-- ============================================
-- CONSULTAS DE VERIFICAÇÃO ÚTEIS
-- ============================================

-- Verificar distribuição de usuários por tipo
SELECT '
DISTRIBUIÇÃO DE USUÁRIOS POR TIPO:' as info;
SELECT tipo_usuario, COUNT(*) as quantidade 
FROM usuarios 
GROUP BY tipo_usuario;

-- Verificar consultas por status
SELECT '
CONSULTAS POR STATUS:' as info;
SELECT status, COUNT(*) as quantidade 
FROM consultas 
GROUP BY status;

-- Verificar exames por status
SELECT '
EXAMES POR STATUS:' as info;
SELECT status, COUNT(*) as quantidade 
FROM exames 
GROUP BY status;

-- Verificar compras por status
SELECT '
COMPRAS POR STATUS:' as info;
SELECT status, COUNT(*) as quantidade 
FROM compras_equipamentos 
GROUP BY status;

-- ============================================
-- FIM DO SCRIPT DE POPULAÇÃO COMPLETA
-- ============================================