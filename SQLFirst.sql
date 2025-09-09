-- Criar o banco de dados
CREATE DATABASE escola_db;
USE escola_db;



-- Criar tabela de alunos
CREATE TABLE alunos (
    aluno_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    sobrenome VARCHAR(50),
    data_nascimento DATE,
    nota DECIMAL(3,1)
);

-- Criar tabela de cursos
CREATE TABLE cursos (
    curso_id INT AUTO_INCREMENT PRIMARY KEY,
    nome_curso VARCHAR(100),
    professor VARCHAR(50)
);

-- Criar tabela de matrículas (N:N entre alunos e cursos)
CREATE TABLE matriculas (
    matricula_id INT AUTO_INCREMENT PRIMARY KEY,
    aluno_id INT,
    curso_id INT,
    data_matricula DATE,
    FOREIGN KEY (aluno_id) REFERENCES alunos(aluno_id),
    FOREIGN KEY (curso_id) REFERENCES cursos(curso_id)
);

-- Inserir alunos (dados mais reais)
INSERT INTO alunos (nome, sobrenome, data_nascimento, nota) VALUES
('Ana', 'Carvalho', '2006-05-22', 8.7),
('Lucas', 'Fernandes', '2005-09-14', 9.3),
('Beatriz', 'Almeida', '2004-12-01', 7.5),
('Gabriel', 'Moura', '2003-02-28', 6.9),
('Juliana', 'Costa', '2005-11-10', 8.2),
('Rafael', 'Gomes', '2001-03-30', 5.8),
('Isabela', 'Rocha', '2000-08-19', 9.0);

-- Inserir cursos
INSERT INTO cursos (nome_curso, professor) VALUES
('Matemática', 'Prof. Alan Turing'),
('Física', 'Prof. Marie Curie'),
('Ciência da Computação', 'Prof. Ada Lovelace'),
('História', 'Prof. Howard Zinn'),
('Química', 'Prof. Antoine Lavoisier');

-- Inserir matrículas
INSERT INTO matriculas (aluno_id, curso_id, data_matricula) VALUES
(1, 1, '2024-02-05'),
(1, 3, '2024-02-06'),
(2, 1, '2024-02-07'),
(2, 2, '2024-02-08'),
(3, 4, '2024-02-09'),
(3, 5, '2024-02-10'),
(4, 2, '2024-02-11'),
(5, 3, '2024-02-12'),
(6, 1, '2024-02-13'),
(6, 5, '2024-02-14'),
(7, 4, '2024-02-15'),
(7, 2, '2024-02-16');
    
-- 1 Questão: Selecione todos os alunos da tabela alunos.

SELECT * FROM alunos;

-- 2 Questão: Mostre apenas os nomes e sobrenomes dos alunos.

SELECT nome, sobrenome FROM alunos;

-- 3 Questão: Mostre todos os cursos disponíveis e os professores responsáveis.

SELECT nome_curso, professor FROM cursos;

-- 4 Questão: Selecione os alunos que têm nota maior que 8.

SELECT nome, nota FROM alunos
	WHERE nota >= 8;

-- 5 Questão: Liste todas as matrículas, mostrando o aluno_id e o curso_id.

SELECT aluno_id, curso_id FROM matriculas;

-- 6 Questão: Encontre os alunos que nasceram depois de 2005-01-01.

SELECT nome, data_nascimento FROM alunos
	WHERE data_nascimento > '2005-01-01';

-- 7 Questão: Mostre os cursos cujo nome contém a palavra "Ciência".

SELECT * FROM cursos
	WHERE nome_curso LIKE '%Ciência%';

-- 8 Questão: Conte quantos alunos existem na tabela alunos.

SELECT count(*) AS total_aluno FROM alunos;

-- 9 Questão: Liste as matrículas feitas no dia '2024-02-07'.

SELECT matricula_id, nome, sobrenome, curso_id, data_matricula FROM matriculas
	JOIN alunos ON matriculas.aluno_id = alunos.aluno_id
	WHERE data_matricula ='2024-02-07'; 

-- 10 Questão: Mostre os alunos ordenados pelo sobrenome em ordem alfabética.

SELECT * FROM alunos
	ORDER BY nome
		ASC;
        
-- 11 Questão: Liste o nome e sobrenome dos alunos junto com os cursos em que estão matriculados.

SELECT alunos.nome, alunos.sobrenome, cursos.nome_curso 
	FROM alunos
		Join matriculas ON alunos.aluno_id = matriculas.aluno_id
		Join cursos ON matriculas.curso_id = cursos.curso_id;

-- 12 Questão: Mostre todos os alunos que estão matriculados no curso de "Matemática".

SELECT alunos.nome, alunos.sobrenome, cursos.nome_curso, cursos.professor 
	FROM alunos
		JOIN matriculas ON alunos.aluno_id = matriculas.aluno_id
        JOIN cursos ON matriculas.curso_id = cursos.curso_id
			WHERE cursos.nome_curso = 'Matemática';

-- 13 Questão: Conte quantos alunos estão matriculados em cada curso.

SELECT cursos.nome_curso, COUNT(matriculas.aluno_id) AS total_alunos
	FROM cursos
		JOIN matriculas ON cursos.curso_id = matriculas.curso_id
			GROUP BY cursos.nome_curso;

-- 14 Questão: Liste os alunos e suas notas, mas apenas daqueles que têm nota maior que 8 e estão matriculados em algum curso.

SELECT alunos.nome, alunos.nota, cursos.nome_curso 
	FROM alunos
		JOIN matriculas ON alunos.aluno_id = matriculas.aluno_id
        JOIN cursos ON matriculas.curso_id = cursos.curso_id
			WHERE alunos.nota > 8;
            

-- 15 Questão: Mostre os cursos que não têm nenhum aluno matriculado.

SELECT cursos.nome_curso, cursos.professor
	FROM cursos
		LEFT JOIN matriculas ON cursos.curso_id = matriculas.curso_id
			WHERE matriculas.matricula_id = NULL;


-- 16 Questão: Liste os alunos junto com a data da matrícula mais recente de cada um.

SELECT alunos.nome, alunos.sobrenome, cursos.nome_curso, matriculas.data_matricula
	FROM alunos
		JOIN matriculas ON alunos.aluno_id = matriculas.aluno_id
		JOIN cursos ON matriculas.curso_id = cursos.curso_id
			WHERE matriculas.data_matricula = (
				SELECT MAX(matriculas.data_matricula)
					FROM matriculas
						WHERE matriculas.aluno_id = alunos.aluno_id
)
ORDER BY matriculas.data_matricula DESC;

-- 17 Questão: Liste os nomes dos alunos e o nome do professor do curso em que estão matriculados.

SELECT alunos.nome, cursos.professor, cursos.nome_curso
	FROM alunos
		JOIN matriculas ON alunos.aluno_id = matriculas.aluno_id
        JOIN cursos ON matriculas.curso_id = cursos.curso_id;

-- 18 Questão: Mostre todos os alunos que estão matriculados em mais de um curso.

SELECT alunos.aluno_id, alunos.nome, alunos.sobrenome, COUNT(matriculas.curso_id) AS total_cursos
	FROM alunos
		JOIN matriculas ON alunos.aluno_id = matriculas.aluno_id
			GROUP BY alunos.aluno_id, alunos.nome, alunos.sobrenome
				HAVING COUNT(matriculas.curso_id) > 1;


-- 19 Questão: Liste os alunos que nasceram antes de 2005 e estão matriculados em cursos de "Ciência da Computação" ou "Física".

SELECT alunos.nome, alunos.sobrenome, alunos.data_nascimento, cursos.nome_curso
	FROM alunos
		JOIN matriculas ON alunos.aluno_id = matriculas.aluno_id
        JOIN cursos ON matriculas.curso_id = cursos.curso_id
			WHERE alunos.data_nascimento < '2005-01-01' AND (cursos.nome_curso = 'Ciência da Computação' OR cursos.nome_curso = 'Física');
        





