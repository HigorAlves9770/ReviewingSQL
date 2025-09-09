-- Criar banco
CREATE DATABASE hospital_db;
USE hospital_db;


-- Tabela de pacientes
CREATE TABLE pacientes (
    paciente_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    sobrenome VARCHAR(50),
    data_nascimento DATE,
    sexo ENUM('M','F'),
    telefone VARCHAR(15),
    email VARCHAR(50)
);

-- Tabela de especialidades médicas
CREATE TABLE especialidades (
    especialidade_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50)
);

-- Tabela de médicos
CREATE TABLE medicos (
    medico_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    sobrenome VARCHAR(50),
    especialidade_id INT,
    telefone VARCHAR(15),
    email VARCHAR(50),
    FOREIGN KEY (especialidade_id) REFERENCES especialidades(especialidade_id)
);


-- Tabela de consultas
CREATE TABLE consultas (
    consulta_id INT AUTO_INCREMENT PRIMARY KEY,
    paciente_id INT,
    medico_id INT,
    data_consulta DATETIME,
    motivo VARCHAR(100),
    FOREIGN KEY (paciente_id) REFERENCES pacientes(paciente_id),
    FOREIGN KEY (medico_id) REFERENCES medicos(medico_id)
);

-- Tabela de exames
CREATE TABLE exames (
    exame_id INT AUTO_INCREMENT PRIMARY KEY,
    paciente_id INT,
    tipo VARCHAR(50),
    resultado VARCHAR(100),
    data_exame DATE,
    FOREIGN KEY (paciente_id) REFERENCES pacientes(paciente_id)
);

-- Tabela de medicamentos
CREATE TABLE medicamentos (
    medicamento_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    descricao VARCHAR(100)
);

-- Tabela de prescrições
CREATE TABLE prescricoes (
    prescricao_id INT AUTO_INCREMENT PRIMARY KEY,
    paciente_id INT,
    medicamento_id INT,
    dosagem VARCHAR(50),
    data_prescricao DATE,
    FOREIGN KEY (paciente_id) REFERENCES pacientes(paciente_id),
    FOREIGN KEY (medicamento_id) REFERENCES medicamentos(medicamento_id)
);

-- Tabela de internações
CREATE TABLE internacoes (
    internacao_id INT AUTO_INCREMENT PRIMARY KEY,
    paciente_id INT,
    data_entrada DATE,
    data_saida DATE,
    motivo VARCHAR(100),
    quarto VARCHAR(10),
    FOREIGN KEY (paciente_id) REFERENCES pacientes(paciente_id)
);

-- Tabela pacientes
INSERT INTO pacientes (nome, sobrenome, data_nascimento, sexo, telefone, email) VALUES
('Ana','Silva','1985-02-15','F','81999990001','ana.silva@email.com'),
('Bruno','Costa','1990-07-22','M','81999990002','bruno.costa@email.com'),
('Carla','Santos','1975-05-10','F','81999990003','carla.santos@email.com'),
('Daniel','Oliveira','2000-12-01','M','81999990004','daniel.oliveira@email.com'),
('Elisa','Pereira','1988-03-18','F','81999990005','elisa.pereira@email.com'),
('Fernando','Rodrigues','1992-09-07','M','81999990006','fernando.rodrigues@email.com'),
('Gabriela','Almeida','1980-11-11','F','81999990007','gabriela.almeida@email.com'),
('Henrique','Barros','1978-04-22','M','81999990008','henrique.barros@email.com'),
('Isabela','Lima','1995-06-30','F','81999990009','isabela.lima@email.com'),
('João','Martins','1982-01-25','M','81999990010','joao.martins@email.com'),
('Karen','Teixeira','1983-08-19','F','81999990011','karen.teixeira@email.com'),
('Lucas','Gomes','1991-10-02','M','81999990012','lucas.gomes@email.com'),
('Mariana','Ribeiro','1987-02-12','F','81999990013','mariana.ribeiro@email.com'),
('Nelson','Cardoso','1969-07-20','M','81999990014','nelson.cardoso@email.com'),
('Olívia','Moura','1994-11-03','F','81999990015','olivia.moura@email.com'),
('Paulo','Farias','1986-05-16','M','81999990016','paulo.farias@email.com'),
('Quintina','Siqueira','1977-09-25','F','81999990017','quintina.siqueira@email.com'),
('Rafael','Cunha','1993-12-19','M','81999990018','rafael.cunha@email.com'),
('Sofia','Nunes','1989-03-28','F','81999990019','sofia.nunes@email.com'),
('Tiago','Pinto','1984-06-05','M','81999990020','tiago.pinto@email.com');

-- Tabela especialidades
INSERT INTO especialidades (nome) VALUES
('Cardiologia'),('Neurologia'),('Pediatria'),('Ortopedia'),
('Dermatologia'),('Ginecologia'),('Oftalmologia'),('Endocrinologia'),
('Psiquiatria'),('Urologia'),('Gastroenterologia'),('Reumatologia'),
('Oncologia'),('Otorrinolaringologia'),('Nefrologia'),('Hematologia'),
('Cirurgia Geral'),('Cirurgia Plástica'),('Anestesiologia'),('Radiologia');

-- Tabela médicos
INSERT INTO medicos (nome,sobrenome,especialidade_id,telefone,email) VALUES
('Carlos','Machado',1,'81988880001','carlos.machado@email.com'),
('Patrícia','Azevedo',2,'81988880002','patricia.azevedo@email.com'),
('Roberto','Melo',3,'81988880003','roberto.melo@email.com'),
('Fernanda','Vieira',4,'81988880004','fernanda.vieira@email.com'),
('Marcos','Ramos',5,'81988880005','marcos.ramos@email.com'),
('Juliana','Ferreira',6,'81988880006','juliana.ferreira@email.com'),
('André','Cavalcante',7,'81988880007','andre.cavalcante@email.com'),
('Renata','Gomes',8,'81988880008','renata.gomes@email.com'),
('Fábio','Barbosa',9,'81988880009','fabio.barbosa@email.com'),
('Letícia','Costa',10,'81988880010','leticia.costa@email.com'),
('Gustavo','Almeida',11,'81988880011','gustavo.almeida@email.com'),
('Aline','Souza',12,'81988880012','aline.souza@email.com'),
('Ricardo','Lima',13,'81988880013','ricardo.lima@email.com'),
('Camila','Pinto',14,'81988880014','camila.pinto@email.com'),
('Eduardo','Nunes',15,'81988880015','eduardo.nunes@email.com'),
('Vanessa','Carvalho',16,'81988880016','vanessa.carvalho@email.com'),
('Vitor','Rocha',17,'81988880017','vitor.rocha@email.com'),
('Tatiane','Santos',18,'81988880018','tatiane.santos@email.com'),
('Leandro','Moraes',19,'81988880019','leandro.moraes@email.com'),
('Bianca','Teixeira',20,'81988880020','bianca.teixeira@email.com');

-- Tabela consultas
INSERT INTO consultas (paciente_id, medico_id, data_consulta, motivo) VALUES
(1,1,'2025-09-01 10:00:00','Check-up'),
(2,2,'2025-09-02 11:00:00','Dor de cabeça'),
(3,3,'2025-09-03 09:00:00','Febre alta'),
(4,4,'2025-09-04 14:00:00','Fratura no braço'),
(5,5,'2025-09-05 15:30:00','Manchas na pele'),
(6,6,'2025-09-06 08:30:00','Consulta ginecológica'),
(7,7,'2025-09-07 13:00:00','Problema de visão'),
(8,8,'2025-09-08 12:00:00','Desequilíbrio hormonal'),
(9,9,'2025-09-09 16:00:00','Transtorno de ansiedade'),
(10,10,'2025-09-10 10:30:00','Infecção urinária'),
(11,11,'2025-09-11 09:30:00','Dor abdominal'),
(12,12,'2025-09-12 11:15:00','Artrite'),
(13,13,'2025-09-13 14:45:00','Exame de câncer'),
(14,14,'2025-09-14 10:00:00','Problema auditivo'),
(15,15,'2025-09-15 15:00:00','Problema renal'),
(16,16,'2025-09-16 13:30:00','Hemorragia'),
(17,17,'2025-09-17 09:00:00','Cirurgia geral'),
(18,18,'2025-09-18 10:45:00','Cirurgia estética'),
(19,19,'2025-09-19 08:00:00','Anestesia pré-operatória'),
(20,20,'2025-09-20 14:00:00','Exame de imagem');

-- Tabela exames
INSERT INTO exames (paciente_id,tipo,resultado,data_exame) VALUES
(1,'Sangue','Normal','2025-08-01'),
(2,'Tomografia','Alterado','2025-08-02'),
(3,'Raio-X','Normal','2025-08-03'),
(4,'Ultrassom','Alterado','2025-08-04'),
(5,'Colesterol','Alto','2025-08-05'),
(6,'HIV','Negativo','2025-08-06'),
(7,'Glicemia','Normal','2025-08-07'),
(8,'Hormonal','Alterado','2025-08-08'),
(9,'Psiquiátrico','Normal','2025-08-09'),
(10,'Urinálise','Alterado','2025-08-10'),
(11,'Endoscopia','Normal','2025-08-11'),
(12,'Ressonância','Alterado','2025-08-12'),
(13,'Biopsia','Normal','2025-08-13'),
(14,'Audiometria','Alterado','2025-08-14'),
(15,'Ultrassom','Normal','2025-08-15'),
(16,'Hemograma','Alterado','2025-08-16'),
(17,'Cirurgia','Bem sucedida','2025-08-17'),
(18,'Plástica','Ok','2025-08-18'),
(19,'Pré-anestesia','Aprovado','2025-08-19'),
(20,'Imagem','Normal','2025-08-20');

-- Tabela medicamentos
INSERT INTO medicamentos (nome,descricao) VALUES
('Paracetamol','Analgésico e antipirético'),
('Ibuprofeno','Anti-inflamatório'),
('Amoxicilina','Antibiótico'),
('Omeprazol','Reduz ácido estomacal'),
('Losartana','Hipertensão'),
('Metformina','Diabetes'),
('Dipirona','Febre e dor'),
('Captopril','Hipertensão'),
('Clonazepam','Ansiedade'),
('Fluoxetina','Depressão'),
('Vitamina C','Suplemento'),
('Furosemida','Diurético'),
('Prednisona','Anti-inflamatório'),
('Ranitidina','Estômago'),
('Cetoprofeno','Inflamação'),
('Salbutamol','Asma'),
('Atorvastatina','Colesterol'),
('Levotiroxina','Hipotireoidismo'),
('Omeprazol','Gastrite'),
('Azitromicina','Antibiótico');

-- Tabela prescricoes
INSERT INTO prescricoes (paciente_id,medicamento_id,dosagem,data_prescricao) VALUES
(1,1,'500mg 8/8h','2025-09-01'),
(2,2,'400mg 12/12h','2025-09-02'),
(3,3,'500mg 12/12h','2025-09-03'),
(4,4,'20mg 1x/dia','2025-09-04'),
(5,5,'50mg 1x/dia','2025-09-05'),
(6,6,'500mg 2x/dia','2025-09-06'),
(7,7,'500mg 8/8h','2025-09-07'),
(8,8,'10mg 1x/dia','2025-09-08'),
(9,9,'0,5mg 1x/dia','2025-09-09'),
(10,10,'20mg 1x/dia','2025-09-10'),
(11,11,'500mg 2x/dia','2025-09-11'),
(12,12,'20mg 1x/dia','2025-09-12'),
(13,13,'1mg 1x/dia','2025-09-13'),
(14,14,'10mg 1x/dia','2025-09-14'),
(15,15,'20mg 1x/dia','2025-09-15'),
(16,16,'500mg 2x/dia','2025-09-16'),
(17,17,'10mg 1x/dia','2025-09-17'),
(18,18,'50mg 1x/dia','2025-09-18'),
(19,19,'100mg 1x/dia','2025-09-19'),
(20,20,'500mg 1x/dia','2025-09-20');

-- Tabela internações
INSERT INTO internacoes (paciente_id,data_entrada,data_saida,motivo,quarto) VALUES
(1,'2025-08-01','2025-08-05','Cirurgia','101A'),
(2,'2025-08-02','2025-08-04','Fratura','102B'),
(3,'2025-08-03','2025-08-06','Infecção','103C'),
(4,'2025-08-04','2025-08-08','Doença crônica','104D'),
(5,'2025-08-05','2025-08-07','Exame','105E'),
(6,'2025-08-06','2025-08-10','Cirurgia','106F'),
(7,'2025-08-07','2025-08-09','Internação clínica','107G'),
(8,'2025-08-08','2025-08-12','Exame','108H'),
(9,'2025-08-09','2025-08-11','Cirurgia','109I'),
(10,'2025-08-10','2025-08-15','Doença crônica','110J'),
(11,'2025-08-11','2025-08-14','Infecção','111K'),
(12,'2025-08-12','2025-08-16','Cirurgia','112L'),
(13,'2025-08-13','2025-08-18','Exame','113M'),
(14,'2025-08-14','2025-08-19','Internação clínica','114N'),
(15,'2025-08-15','2025-08-20','Cirurgia','115O'),
(16,'2025-08-16','2025-08-21','Doença crônica','116P'),
(17,'2025-08-17','2025-08-22','Cirurgia','117Q'),
(18,'2025-08-18','2025-08-23','Exame','118R'),
(19,'2025-08-19','2025-08-24','Internação clínica','119S'),
(20,'2025-08-20','2025-08-25','Cirurgia','120T');

-- 1 CONSULTAS BÁSICAS

-- 1. Liste todos os pacientes com nome “Ana”.

SELECT * FROM pacientes 
	WHERE nome = 'Ana';

-- 2. Mostre todos os médicos do banco de dados.

SELECT * FROM medicos;

-- 3. Liste todas as especialidades médicas.

SELECT nome FROM especialidades;

-- 4. Encontre todos os pacientes do sexo feminino.

SELECT * FROM pacientes
	WHERE sexo = 'F';

-- 5. Mostre todos os medicamentos.

SELECT nome, descricao FROM medicamentos;

-- 6. Liste as consultas agendadas para o dia '2025-09-01'.

SELECT * FROM consultas
	WHERE data_consulta = '2025-09-01 10:00:00';

-- 7. Mostre os nomes dos pacientes e suas datas de nascimento.

SELECT pacientes.nome, pacientes.data_nascimento
	FROM pacientes;

-- 8. Liste os exames realizados no dia '2025-08-05'.

SELECT * FROM exames
	WHERE data_exame = '2025-08-01';

-- 9. Encontre todos os pacientes que possuem prescrição de “Paracetamol”.
            
SELECT pacientes.nome, pacientes.sobrenome, medicamentos.nome
	FROM pacientes 
		INNER JOIN prescricoes ON pacientes.paciente_id = prescricoes.paciente_id
        INNER JOIN medicamentos ON prescricoes.medicamento_id = medicamentos.medicamento_id
			WHERE medicamentos.nome = 'Paracetamol';
            
SELECT pacientes.nome, pacientes.sobrenome, medicamentos.nome
	FROM medicamentos
		INNER JOIN prescricoes ON medicamentos.medicamento_id = prescricoes.medicamento_id
        INNER JOIN pacientes ON prescricoes.paciente_id = pacientes.paciente_id
			WHERE medicamentos.nome = 'Paracetamol';
            
SELECT pacientes.nome, pacientes.sobrenome, medicamentos.nome
	FROM prescricoes
		INNER JOIN pacientes ON prescricoes.paciente_id = pacientes.paciente_id
        INNER JOIN medicamentos ON prescricoes.medicamento_id = medicamentos.medicamento_id
			WHERE medicamentos.nome = 'Paracetamol';
            
-- 10. Mostre todos os quartos de internação disponíveis.

SELECT paciente_id, data_entrada, data_saida, quarto
	FROM internacoes
		WHERE data_saida IS NOT NULL;

-- 2 CONSULTAS MEDIANA 

-- 11. Liste os pacientes que fizeram consultas com médicos da especialidade “Cardiologia”.

SELECT pacientes.nome, pacientes.sobrenome, medicos.nome, especialidades.nome
	FROM pacientes
		INNER JOIN consultas ON pacientes.paciente_id = consultas.paciente_id
        INNER JOIN medicos ON consultas.medico_id = medicos.medico_id
        INNER JOIN especialidades ON medicos.especialidade_id = especialidades.especialidade_id
			WHERE especialidades.nome = 'Cardiologia';
	
SELECT pacientes.nome, pacientes.sobrenome, medicos.nome, especialidades.nome
	FROM consultas
		INNER JOIN pacientes ON consultas.paciente_id = pacientes.paciente_id
        INNER JOIN medicos ON consultas.medico_id = medicos.medico_id
        INNER JOIN especialidades ON medicos.especialidade_id = especialidades.especialidade_id
			WHERE especialidades.nome = 'Cardiologia';
            
SELECT pacientes.nome, pacientes.sobrenome, medicos.nome, especialidades.nome
	FROM medicos
		INNER JOIN consultas ON medicos.medico_id = consultas.medico_id
        INNER JOIN pacientes ON consultas.paciente_id = pacientes.paciente_id
        INNER JOIN especialidades ON medicos.especialidade_id = especialidades.especialidade_id
			WHERE especialidades.nome = 'Cardiologia';
		
-- 12. Mostre a quantidade de consultas realizadas por cada médico.

SELECT medicos.nome, COUNT(consultas.consulta_id) as TotalConsultas
	FROM consultas
		JOIN medicos ON consultas.medico_id = medicos.medico_id
			GROUP BY medicos.nome;

-- 13. Liste os pacientes que têm mais de 30 anos.

SELECT pacientes.nome, pacientes.data_nascimento
	FROM pacientes 
		WHERE TIMESTAMPDIFF (YEAR, pacientes.data_nascimento, CURDATE()) > 30;


-- 14. Mostre todas as prescrições com o nome do paciente e o nome do medicamento.

SELECT prescricao_id, pacientes.nome, medicamentos.nome, prescricoes.dosagem, prescricoes.data_prescricao
	FROM prescricoes
		INNER JOIN medicamentos ON prescricoes.medicamento_id = medicamentos.medicamento_id
        INNER JOIN pacientes ON prescricoes.paciente_id = pacientes.paciente_id;
        
SELECT prescricao_id, pacientes.nome, medicamentos.nome, prescricoes.dosagem, prescricoes.data_prescricao
	FROM pacientes
		INNER JOIN prescricoes ON pacientes.paciente_id = prescricoes.paciente_id
        INNER JOIN medicamentos ON prescricoes.medicamento_id = medicamentos.medicamento_id;
        
-- 15. Liste os médicos que não possuem nenhuma consulta agendada.

SELECT medicos.nome, medicos.sobrenome, consultas.consulta_id, consultas.data_consulta
	FROM medicos
		LEFT JOIN consultas ON medicos.medico_id = consultas.medico_id;
	

-- 16. Liste todos os pacientes que não possuem exames realizados.

SELECT pacientes.nome, pacientes.sobrenome, exames.tipo, exames.resultado, exames.data_exame
	FROM pacientes
		LEFT JOIN exames ON pacientes.paciente_id = exames.paciente_id;

-- 17. Encontre o total de pacientes por sexo.

SELECT sexo, COUNT(*) as Total FROM pacientes GROUP BY sexo;
    
-- 18. Liste as consultas de um paciente específico (por exemplo, paciente_id = 5) em ordem crescente de data.

SELECT pacientes.nome, pacientes.sobrenome, consultas.data_consulta
	FROM pacientes
		LEFT JOIN consultas ON pacientes.paciente_id = consultas.paciente_id
			WHERE pacientes.paciente_id = 5
				ORDER BY consultas.data_consulta ASC;

-- 19. Liste os medicamentos que foram prescritos mais de 2 vezes.

SELECT medicamentos.nome, count(medicamentos.medicamento_id) AS Quantidade_Prescricoes
	FROM medicamentos
		LEFT JOIN prescricoes ON medicamentos.medicamento_id = prescricoes.medicamento_id
			GROUP BY medicamentos.nome
				HAVING COUNT(*) > 2;

-- 20. Mostre todos os exames distintos que foram realizados no hospital.

SELECT DISTINCT exames.tipo FROM exames;

-- 3- CONSULTAS DIFÍCEIS 

-- 21. Liste todos os pacientes que fizeram consultas com médicos da especialidade “Pediatria” e que também possuem prescrição de antibióticos.

SELECT pacientes.nome as Paciente, medicos.nome as Medico, especialidades.nome as Especialidade, medicamentos.descricao as Medicamento
	FROM pacientes
		INNER JOIN consultas ON pacientes.paciente_id = consultas.paciente_id
        INNER JOIN medicos ON consultas.medico_id = medicos.medico_id
        INNER JOIN especialidades ON medicos.especialidade_id = especialidades.especialidade_id
        INNER JOIN prescricoes ON pacientes.paciente_id = prescricoes.paciente_id
        INNER JOIN medicamentos ON prescricoes.medicamento_id = medicamentos.medicamento_id
			WHERE especialidades.nome = 'Pediatria' AND medicamentos.descricao = 'Antibiótico' ;

-- 22. Mostre os médicos e a quantidade de consultas realizadas, mas apenas aqueles que fizeram mais de 2 consultas (HAVING).
-- 23. Liste os pacientes internados por mais de 5 dias.
-- 24. Encontre os pacientes que possuem consultas e exames realizados no mesmo dia.
-- 25. Liste o total de consultas por especialidade médica.
-- 26. Liste os pacientes que têm mais de uma prescrição de medicamentos diferentes (DISTINCT).
-- 27. Liste os pacientes que não têm nenhuma prescrição associada.
-- 28. Mostre o nome do paciente, nome do médico e especialidade de todas as consultas em setembro de 2025, ordenadas por data da consulta.
-- 29. Liste os médicos que possuem pacientes internados no momento (data_saida ainda não ocorreu).
-- 30. Encontre todos os pacientes que fizeram mais de 3 exames distintos.

-- 4 Mais Dificil

-- 31. Liste os pacientes que nunca fizeram uma consulta, mas possuem exames realizados.
-- 32. Mostre os 3 médicos que mais atenderam pacientes em 2025.
-- 33. Liste os pacientes com mais de uma internação e calcule a média de dias internados.
-- 34. Encontre os medicamentos prescritos que nunca foram usados em exames ou internações associadas ao mesmo paciente.
-- 35. Liste os pacientes e, ao lado, mostre quantas consultas eles tiveram em 2025 e classifique em:
--     'Baixo Atendimento' (até 2 consultas), 'Médio Atendimento' (3 a 5 consultas), 'Alto Atendimento' (mais de 5 consultas).
