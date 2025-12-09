USE vetallis_db_3_0;

-- Usuário
INSERT INTO usuario (usuario_senha, usuario_email,usuario_nome, usuario_cpf, usuario_cargo) VALUES
( '1234', 'teste@gmail.com', 'teste', '12345678910', 'gerente');

INSERT INTO usuario (usuario_senha, usuario_email,usuario_nome, usuario_cpf, usuario_cargo) VALUES
('5678', 'mariaeduardamartinscavallaro@gmail.com', 'Maria Eduarda Martins Cavallaro', '49089469818', 'delegada'),
('9102', 'enzobueno@gmail.com', 'Enzo', '49083719898', 'desempregado');

UPDATE usuario 
SET usuario_nome = 'Ana'
WHERE usuario_id = 1;

UPDATE usuario
SET usuario_cargo = 'professora'
WHERE usuario_id = 2;

UPDATE usuario
SET usuario_senha = '123a'
WHERE usuario_id = 3; -- WHERE não pode ser usado  com nome e sim com id

SELECT * FROM usuario;

SELECT usuario_nome
FROM usuario
WHERE usuario_id = 3;

SELECT usuario_cargo, usuario_email
FROM usuario
WHERE usuario_id = 2;

DELETE 
FROM usuario
WHERE usuario_id = 3;

DELETE 
FROM usuario
WHERE usuario_id = 2;

DELETE 
FROM usuario
WHERE usuario_id = 1;

-- Produto
INSERT INTO produto (produto_nome, produto_quantidade, produto_descricao, produto_lote, produto_cod_barra, produto_categoria) VALUES
('dipirona', 13, 'cura dor de cabeça', '12A', '1234567890123', 'vacina'),
('novalgina', 22, 'tira câncer', '11514B', '2345678901234', 'comprimido'),
('B12', 47, 'bomba muscular', '27200C', '3456789012345', 'xarope' );

UPDATE produto
SET produto_nome = 'febre amarela'
WHERE produto_id = 1;

UPDATE produto
SET produto_quantidade = 2
WHERE produto_id = 2;

UPDATE produto
SET produto_lote = '145L'
WHERE produto_id = 3; 

SELECT * FROM produto;

SELECT produto_nome
FROM produto
WHERE produto_quantidade > 10;

SELECT produto_lote, produto_descricao
FROM produto
WHERE produto_id = 2;

DELETE 
FROM produto
WHERE produto_id = 4;

DELETE 
FROM produto
WHERE produto_id = 5;

DELETE 
FROM produto
WHERE produto_id = 6;

-- Pedido de Saída
INSERT INTO pedido_saida (pedido_saida_lote, pedido_saida_nome, pedido_saida_categoria, pedido_saida_quantidade, usuario_usuario_id1, produto_produto_id) VALUES
('1540M', 'paracetamol', 'comprimido', 2, 4, 4),
('2000P', 'losartana', 'xarope', 80, 5, 5),
('13999LU', 'rivotril', 'vacina', 200, 6, 6);

UPDATE pedido_saida
SET pedido_saida_nome = 'aspirina'
WHERE produto_produto_id = 4;

UPDATE pedido_saida
SET pedido_saida_categoria = 'vacina'
WHERE produto_produto_id = 5;

UPDATE pedido_saida
SET pedido_saida_quantidade = 38
WHERE produto_produto_id = 6; 

SELECT * FROM pedido_saida;

SELECT pedido_saida_nome
FROM pedido_saida
WHERE usuario_usuario_id1 = 5;

SELECT pedido_saida_nome, pedido_saida_quantidade
FROM pedido_saida
WHERE usuario_usuario_id1 = 6;

DELETE 
FROM pedido_saida
WHERE pedido_saida_id = 7;

DELETE 
FROM pedido_saida
WHERE pedido_saida_id = 8;

DELETE 
FROM pedido_saida
WHERE pedido_saida_id = 9;

-- Pedido de entrada
INSERT INTO pedido_entrada (pedido_ent_lote, pedido_ent_nome, pedido_ent_categoria, pedido_ent_quantidade, pedido_ent_descricao, usuario_usuario_id1, produto_produto_id) VALUES
('1540M', 'paracetamol', 'comprimido', 2,'curar dor de cabeça', 4, 4),
('2000P', 'losartana', 'xarope', 80,'curar dor nas costas' ,5, 5),
('13999LU', 'rivotril', 'vacina', 200, 'passar vômito',6, 6);

UPDATE pedido_entrada
SET pedido_ent_nome = 'aspirina'
WHERE produto_produto_id = 4;

UPDATE pedido_entrada
SET pedido_ent_categoria = 'vacina'
WHERE produto_produto_id = 5;

UPDATE pedido_entrada
SET pedido_ent_quantidade = 38
WHERE produto_produto_id = 6; 

SELECT * FROM pedido_entrada;

SELECT pedido_ent_nome
FROM pedido_entrada
WHERE usuario_usuario_id1 = 5;

SELECT pedido_ent_nome, pedido_ent_quantidade
FROM pedido_entrada
WHERE usuario_usuario_id1 = 6;

DELETE 
FROM pedido_entrada
WHERE pedido_ent_id = 4;

DELETE 
FROM pedido_entrada
WHERE pedido_ent_id = 5;

DELETE 
FROM pedido_entrada
WHERE pedido_ent_id = 6;

-- Lista de compra
ALTER TABLE lista_compra
ADD COLUMN lista_compra_status VARCHAR(45);

INSERT INTO lista_compra (lista_compra_nome, lista_compra_quantidade, lista_compra_valor, produto_produto_id, lista_compra_status) VALUES
('comprar dipirona', 12, 50.00, 4,'vencendo'),
('comprar losartana', 100, 200.50, 5,'esgotado'),
('comprar novalgina', 30, 100.60, 6, 'esgotando');

UPDATE lista_compra
SET lista_compra_nome = 'comprar aspirina'
WHERE produto_produto_id = 4;

UPDATE lista_compra
SET lista_compra_valor = 150.00
WHERE produto_produto_id = 5;

UPDATE lista_compra
SET lista_compra_status= 'venceu'
WHERE produto_produto_id = 6; 

SELECT * FROM lista_compra;

SELECT lista_compra_nome
FROM lista_compra
WHERE produto_produto_id = 5;

SELECT lista_compra_nome, lista_compra_valor
FROM lista_compra
WHERE produto_produto_id= 6;

DELETE 
FROM lista_compra
WHERE lista_compra_id = 1;

DELETE 
FROM lista_compra
WHERE lista_compra_id = 2;

DELETE 
FROM lista_compra
WHERE lista_compra_id = 3;

-- Controle Saída
INSERT INTO controle_saida (controle_saida_motivo, controle_saida_quantidade, controle_saida_nome, controle_saida_data, pedido_saida_pedido_saida_id1) VALUES
('dor de barriga', 2, 'dipirona','2025-12-04' ,7 ),
('verme', 5, 'vermifugo', '2025-12-05',8),
('cólica', 5, 'buscupam', '2025-12-06', 9);

UPDATE controle_saida
SET controle_saida_motivo = 'dor de cabeça'
WHERE pedido_saida_pedido_saida_id1 = 7;

UPDATE controle_saida
SET controle_saida_quantidade = 16
WHERE pedido_saida_pedido_saida_id1 = 8;

UPDATE controle_saida
SET controle_saida_data= '2025-12-03'
WHERE pedido_saida_pedido_saida_id1 = 9; 

SELECT * FROM controle_saida;

SELECT controle_saida_nome
FROM controle_saida
WHERE pedido_saida_pedido_saida_id1 = 8;

SELECT controle_saida_nome, controle_saida_data
FROM controle_saida
WHERE pedido_saida_pedido_saida_id1= 9;

DELETE 
FROM controle_saida
WHERE controle_saida_id = 4;

DELETE 
FROM controle_saida
WHERE controle_saida_id = 5;

DELETE 
FROM controle_saida
WHERE controle_saida_id = 6;

-- Controle Entrada
INSERT INTO controle_entrada (controle_entrada_quantidade, controle_entrada_nome, controle_entrada_descricao, controle_entrada_data, pedido_entrada_pedido_ent_id1) VALUES
( 20, 'dipirona', 'curar dor no corpo','2025-12-04' ,4),
( 50, 'vermifugo','curar verme', '2025-12-05',5),
(105, 'buscupam', 'curar colica','2025-12-06', 6);

UPDATE controle_entrada
SET controle_entrada_nome = 'buscofem'
WHERE pedido_entrada_pedido_ent_id1 =6;

UPDATE controle_entrada
SET controle_entrada_quantidade = 80 
WHERE pedido_entrada_pedido_ent_id1 = 5;

UPDATE controle_entrada
SET controle_entrada_data= '2025-12-03'
WHERE pedido_entrada_pedido_ent_id1 = 4; 

SELECT * FROM controle_entrada;

SELECT controle_entrada_nome
FROM controle_entrada
WHERE pedido_entrada_pedido_ent_id1 = 5;

SELECT controle_entrada_nome, controle_entrada_data
FROM controle_entrada
WHERE pedido_entrada_pedido_ent_id1= 6;

DELETE 
FROM controle_entrada
WHERE controle_entrada_id = 10;

DELETE 
FROM controle_entrada
WHERE controle_entrada_id = 11;

DELETE 
FROM controle_entrada
WHERE controle_entrada_id = 12;

-- Histórico Entrada
INSERT INTO historico_entrada (historico_entrada_quantidade, historico_entrada_data, controle_entrada_controle_entrada_id) VALUES
( 20,'2025-12-04',10),
( 50,'2025-12-05',11),
(105, '2025-12-06', 12);

UPDATE historico_entrada
SET historico_entrada_data = '2026-01-05'
WHERE controle_entrada_controle_entrada_id =10;

UPDATE historico_entrada
SET historico_entrada_quantidade = 280 
WHERE controle_entrada_controle_entrada_id = 12;

UPDATE historico_entrada
SET historico_entrada_data= '2025-12-06'
WHERE controle_entrada_controle_entrada_id = 11; 

SELECT * FROM historico_entrada;

SELECT historico_entrada_data
FROM historico_entrada
WHERE controle_entrada_controle_entrada_id = 10;

SELECT historico_entrada_quantidade, historico_entrada_data
FROM historico_entrada
WHERE controle_entrada_controle_entrada_id= 12;

DELETE 
FROM historico_entrada
WHERE historico_entrada_id = 1;

DELETE 
FROM historico_entrada
WHERE historico_entrada_id = 2;

DELETE 
FROM historico_entrada
WHERE historico_entrada_id = 3;

-- Histórico Saida
INSERT INTO historico_saida (historico_saida_quantidade, historico_saida_data, controle_saida_controle_saida_id) VALUES 
(7, '2025-09-13', 4),
(9, '2025-09-01', 5),
(12, '2025-12-03', 6);

UPDATE historico_saida
SET historico_saida_quantidade = 16
WHERE controle_saida_controle_saida_id= 6;

UPDATE historico_saida
SET historico_saida_data = '2025-09-01'
WHERE controle_saida_controle_saida_id= 13;

UPDATE historico_saida
SET historico_saida_data = '2025-11-13'
WHERE controle_saida_controle_saida_id= 5;

SELECT * FROM historico_saida;

SELECT historico_saida_quantidade FROM historico_saida
WHERE  historico_saida_quantidade >10;


DELETE FROM historico_saida
WHERE controle_saida_controle_saida_id=4;

DELETE FROM historico_saida
WHERE controle_saida_controle_saida_id=5;

DELETE FROM historico_saida
WHERE controle_saida_controle_saida_id =6;


-- Dados sensor
INSERT INTO  dados_sensor(dados_sensor_nome, dados_sensor_tipo, dados_sensor_local, dados_sensor_status, dados_sensor_data_install) VALUES
('DHT11','umidade', 'cant parede sul', 'funcionando','2025-12-10'),
('RC522','rfid', 'cant parede norte', 'delay','2025-12-15'),
('lcd','display', 'cant parede oeste', 'quebrado','2025-12-20');

UPDATE dados_sensor
SET dados_sensor_nome = 'dht49'
WHERE dados_sensor_id = 1;

UPDATE dados_sensor
SET dados_sensor_tipo = 'calor'
WHERE dados_sensor_id = 2;

UPDATE dados_sensor
SET dados_sensor_local = 'parede norte'
WHERE dados_sensor_id = 3;

SELECT *
FROM dados_sensor;

SELECT dados_sensor_nome
FROM dados_sensor
WHERE dados_sensor_id = 2;

SELECT dados_sensor_nome, dados_sensor_tipo
FROM dados_sensor
WHERE dados_sensor_id = 3;

DELETE 
FROM dados_sensor
WHERE dados_sensor_id = 1;

DELETE 
FROM dados_sensor
WHERE dados_sensor_id = 2;

DELETE 
FROM dados_sensor
WHERE dados_sensor_id = 3;

-- Historico sensor
insert into historico_sensor (historico_sensor_dados, dados_sensor_dados_sensor_id) values
("sensor parado",1),
("sensor quebrado",2),
("sensor funcionando",3);

update historico_sensor
set historico_sensor_dados = 'funcionando'
where dados_sensor_dados_sensor_id = 1;
update historico_sensor
set historico_sensor_dados = 'parado'
where dados_sensor_dados_sensor_id = 2;
update historico_sensor
set historico_sensor_dados = 'quebrado'
where dados_sensor_dados_sensor_id = 3;

select *
from historico_sensor;
select historico_sensor_dados
from historico_sensor
where dados_sensor_dados_sensor_id = 1;
select historico_sensor_dados
from historico_sensor
where dados_sensor_dados_sensor_id = 2;

delete 
from historico_sensor
where dados_sensor_dados_sensor_id = 1;
delete 
from historico_sensor
where dados_sensor_dados_sensor_id = 2;
delete 
from historico_sensor
where dados_sensor_dados_sensor_id = 3;