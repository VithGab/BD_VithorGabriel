CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(15),
    email VARCHAR(150) UNIQUE NOT NULL
);

CREATE TABLE veiculo (
    id_veiculo SERIAL PRIMARY KEY,
    placa VARCHAR(8) UNIQUE NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    tipo_veiculo VARCHAR(10) CHECK (tipo_veiculo IN ('Carro', 'Moto')) NOT NULL
);

CREATE TABLE locacao (
    id_locacao SERIAL PRIMARY KEY,
    id_cliente INT NOT NULL,
	id_veiculo INT NOT NULL,
	data_locacao DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
	FOREIGN KEY (id_veiculo) REFERENCES veiculo(id_veiculo)
);

CREATE TABLE pagamentos (
    id_pagamento SERIAL PRIMARY KEY,
    id_locacao INT UNIQUE NOT NULL,
    data_pagamento DATE DEFAULT CURRENT_DATE,
    valor_total DECIMAL(10,2) NOT NULL,
    valor_pago DECIMAL(10,2) NOT NULL,
    valor_troco DECIMAL(10,2) NOT NULL,
    metodo_pagamento VARCHAR(50) NOT NULL,
    status_pagamento VARCHAR(20) CHECK (status_pagamento IN ('pendente', 'pago', 'cancelado')) NOT NULL,
    FOREIGN KEY (id_locacao) REFERENCES locacao(id_locacao) 
);

CREATE TABLE manutencoes (
    manutencao_id SERIAL PRIMARY KEY,
    id_veiculo INT NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE,
    descricao VARCHAR(200) NOT NULL,
    custo DECIMAL(10,2) NOT NULL,
    tipo_manutencao VARCHAR(20) CHECK (tipo_manutencao IN ('Preventiva', 'Corretiva', 'Acidente')) NOT NULL,
    status_manutencao VARCHAR(20) CHECK (status_manutencao IN ('Em andamento', 'Concluída')) NOT NULL,
    FOREIGN KEY (id_veiculo) REFERENCES veiculo(id_veiculo)
);

INSERT INTO clientes (nome, telefone, email) VALUES
('João Silva', '(86) 91234-5678', 'joao.silva@email.com'),
('Maria Oliveira', '(86) 92345-6789', 'maria.oliveira@email.com'),
('Carlos Souza', '(86) 93456-7890', 'carlos.souza@email.com'),
('Ana Pereira', '(86) 94567-8901', 'ana.pereira@email.com'),
('Pedro Costa', '(86) 95678-9012', 'pedro.costa@email.com'),
('Lucia Santos', '(86) 96789-0123', 'lucia.santos@email.com'),
('Marcos Rocha', '(86) 97890-1234', 'marcos.rocha@email.com'),
('Juliana Lima', '(86) 98901-2345', 'juliana.lima@email.com'),
('Fernando Alves', '(86) 99012-3456', 'fernando.alves@email.com'),
('Patricia Gomes', '(86) 90123-4567', 'patricia.gomes@email.com'),
('Ricardo Nunes', '(86) 91234-5678', 'ricardo.nunes@email.com'),
('Amanda Ferreira', '(86) 92345-6789', 'amanda.ferreira@email.com'),
('Roberto Martins', '(86) 93456-7890', 'roberto.martins@email.com'),
('Camila Ribeiro', '(86) 94567-8901', 'camila.ribeiro@email.com'),
('Lucas Cardoso', '(86) 95678-9012', 'lucas.cardoso@email.com');
SELECT * FROM clientes;

INSERT INTO veiculo (placa, modelo, marca, tipo_veiculo) VALUES
('ABC-1234', 'Gol', 'Volkswagen', 'Carro'),
('DEF-5678', 'Onix', 'Chevrolet', 'Carro'),
('GHI-9012', 'HB20', 'Hyundai', 'Carro'),
('JKL-3456', 'CG 160', 'Honda', 'Moto'),
('MNO-7890', 'Biz', 'Honda', 'Moto'),
('PQR-1234', 'Corolla', 'Toyota', 'Carro'),
('STU-5678', 'Compass', 'Jeep', 'Carro'),
('VWX-9012', 'Titan 160', 'Yamaha', 'Moto'),
('YZA-3456', 'Civic', 'Honda', 'Carro'),
('BCD-7890', 'NMAX', 'Yamaha', 'Moto'),
('EFG-1234', 'Uno', 'Fiat', 'Carro'),
('HIJ-5678', 'Fazer 250', 'Yamaha', 'Moto'),
('KLM-9012', 'Tracker', 'Chevrolet', 'Carro'),
('NOP-3456', 'Toro', 'Fiat', 'Carro'),
('QRS-7890', 'XRE 300', 'Honda', 'Moto'),
('TUV-1234', 'Renegade', 'Jeep', 'Carro'),
('WXY-5678', 'S10', 'Chevrolet', 'Carro'),
('ZAB-9012', 'CB 300', 'Honda', 'Moto'),
('CDE-3456', 'Argo', 'Fiat', 'Carro'),
('FGH-7890', 'CBR 500', 'Honda', 'Moto'),
('IJK-1234', 'Hilux', 'Toyota', 'Carro'),
('LMN-5678', 'MT-07', 'Yamaha', 'Moto'),
('OPQ-9012', 'Kicks', 'Nissan', 'Carro'),
('RST-3456', 'Factor 125', 'Yamaha', 'Moto'),
('UVW-7890', '208', 'Peugeot', 'Carro');
SELECT * FROM veiculo;

INSERT INTO locacao (id_cliente, id_veiculo, data_locacao) VALUES
(1, 1, '2023-01-05'),
(2, 4, '2023-01-10'),
(3, 2, '2023-01-15'),
(4, 5, '2023-01-20'),
(5, 3, '2023-02-01'),
(6, 6, '2023-02-10'),
(7, 7, '2023-02-15'),
(8, 8, '2023-02-20'),
(9, 9, '2023-03-01'),
(10, 10, '2023-03-05'),
(11, 11, '2023-03-10'),
(12, 12, '2023-03-15'),
(13, 13, '2023-03-20'),
(14, 14, '2023-04-01'),
(15, 15, '2023-04-05'),
(1, 16, '2023-04-10'),
(2, 17, '2023-04-15'),
(3, 18, '2023-04-20'),
(4, 19, '2023-05-01'),
(5, 20, '2023-05-05');
SELECT * FROM locacao;

INSERT INTO pagamentos (id_locacao, data_pagamento, valor_total, valor_pago, valor_troco, metodo_pagamento, status_pagamento) VALUES
(1, '2023-01-05', 750.00, 750.00, 0.00, 'Cartão de Crédito', 'pago'),
(2, '2023-01-10', 400.00, 400.00, 0.00, 'PIX', 'pago'),
(3, '2023-01-15', 900.00, 900.00, 0.00, 'Cartão de Débito', 'pago'),
(4, '2023-01-20', 350.00, 350.00, 0.00, 'Dinheiro', 'pago'),
(5, '2023-02-01', 850.00, 1000.00, 150.00, 'Dinheiro', 'pago'),
(6, '2023-02-10', 1250.00, 1250.00, 0.00, 'Cartão de Crédito', 'pago'),
(7, '2023-02-15', 1500.00, 1500.00, 0.00, 'Cartão de Crédito', 'pago'),
(8, '2023-02-20', 450.00, 500.00, 50.00, 'Dinheiro', 'pago'),
(9, '2023-03-01', 1400.00, 1400.00, 0.00, 'Cartão de Débito', 'pago'),
(10, '2023-03-05', 500.00, 500.00, 0.00, 'PIX', 'pago'),
(11, '2023-03-10', 600.00, 600.00, 0.00, 'Cartão de Crédito', 'pago'),
(12, '2023-03-15', 700.00, 700.00, 0.00, 'Cartão de Débito', 'pago'),
(13, '2023-03-20', 800.00, 800.00, 0.00, 'PIX', 'pago'),
(14, '2023-04-01', 950.00, 1000.00, 50.00, 'Dinheiro', 'pago'),
(15, '2023-04-05', 1100.00, 1100.00, 0.00, 'Cartão de Crédito', 'pago');
SELECT * FROM pagamentos;

INSERT INTO manutencoes (id_veiculo, data_inicio, data_fim, descricao, custo, tipo_manutencao, status_manutencao) VALUES
(1, '2023-01-11', '2023-01-12', 'Troca de óleo e filtros', 250.00, 'Preventiva', 'Concluída'),
(4, '2023-01-16', '2023-01-18', 'Reparo no sistema de freios', 180.00, 'Corretiva', 'Concluída'),
(2, '2023-01-21', '2023-01-22', 'Alinhamento e balanceamento', 120.00, 'Preventiva', 'Concluída'),
(5, '2023-02-06', '2023-02-07', 'Troca de pneus', 600.00, 'Preventiva', 'Concluída'),
(3, '2023-02-11', '2023-02-12', 'Revisão geral', 350.00, 'Preventiva', 'Concluída'),
(6, '2023-02-16', '2023-02-20', 'Reparo na lataria após colisão', 7000.00, 'Acidente', 'Concluída'),
(7, '2023-02-21', '2023-02-22', 'Troca de bateria', 350.00, 'Corretiva', 'Concluída'),
(8, '2023-03-06', '2023-03-07', 'Reparo no sistema elétrico', 200.00, 'Corretiva', 'Concluída'),
(9, '2023-03-11', '2023-03-12', 'Revisão geral', 400.00, 'Preventiva', 'Concluída'),
(10, '2023-03-16', '2023-03-17', 'Troca de óleo e filtros', 120.00, 'Preventiva', 'Concluída'),
(11, '2023-03-21', '2023-03-22', 'Alinhamento e balanceamento', 120.00, 'Preventiva', 'Concluída'),
(12, '2023-04-06', '2023-04-07', 'Troca de corrente e coroa', 280.00, 'Preventiva', 'Concluída'),
(13, '2023-04-11', '2023-04-12', 'Revisão geral', 450.00, 'Preventiva', 'Concluída'),
(14, '2023-04-16', '2023-04-18', 'Reparo no sistema de ar condicionado', 600.00, 'Corretiva', 'Concluída'),
(15, '2023-04-21', '2023-04-22', 'Troca de pneus', 800.00, 'Preventiva', 'Concluída');
SELECT * FROM manutencoes;

INSERT INTO clientes (nome, telefone, email) VALUES
('Maria Aparecida', '(86) 98765-4321', 'cida@email.com'),
('Vithor Oliveira', '(86) 97654-3210', 'Vithoroli@email.com'),
('Fernanda Torres', '(86) 96543-2109', 'torresfernanda@email.com');

INSERT INTO veiculo (placa, modelo, marca, tipo_veiculo) VALUES
('ABC-5678', 'T-Cross', 'Volkswagen', 'Carro'),
('MOT-5678', 'Factor 150', 'Yamaha', 'Moto');
