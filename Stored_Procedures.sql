DELIMITER $

CREATE PROCEDURE InserirCurso(
    IN p_NomeCurso VARCHAR(45),
    IN p_Duracao INT,
    IN p_Area VARCHAR(45)
)
BEGIN
    INSERT INTO Cursos (Nome_cursos, Duracao, Area) VALUES (p_NomeCurso, p_Duracao, p_Area);
END$

DELIMITER ;


//////////////////////////////////////////////////////////////////////////////////////////////


-- DELIMITER é usado para alterar o delimitador padrão de ponto e vírgula para '$'
DELIMITER $

-- Criação da stored procedure para selecionar todos os cursos
CREATE PROCEDURE SelecionarTodosCursos()
BEGIN
    -- Comando para selecionar todos os cursos da tabela Cursos
    SELECT * FROM Cursos;
END$

-- Restauração do delimitador padrão
DELIMITER ;

//////////////////////////////////////////////////////////////////////////////////////////////

DELIMITER $

CREATE PROCEDURE InserirNovoCurso(
    IN p_NomeCurso VARCHAR(45),
    IN p_Duracao INT,
    IN p_Area VARCHAR(45)
)
BEGIN
    INSERT INTO Cursos (Nome_cursos, Duracao, Area) VALUES (p_NomeCurso, p_Duracao, p_Area);
END$

DELIMITER ;

//////////////////////////////////////////////////////////////////////////////////////////////

 DELIMITER $

-- Criação da procedure para matricular um aluno em um curso
CREATE PROCEDURE MatricularAluno(
    IN p_Nome_Aluno VARCHAR(150),
    IN p_Sobrenome_Aluno VARCHAR(150),
    IN p_RA_Aluno VARCHAR(150),
    IN p_CPF_Aluno VARCHAR(150),
    IN p_Email_Aluno VARCHAR(150),
    IN p_Telefone_Aluno VARCHAR(150),
    IN p_Nome_Curso VARCHAR(150)
)
BEGIN
    DECLARE CursoID INT;

    -- Buscar o ID do curso com base no nome do curso fornecido
    SELECT idCursos INTO CursoID
    FROM Cursos
    WHERE nome_cursos = p_Nome_Curso
    LIMIT 1;  -- Limitar a consulta a uma linha

    -- Verificar se o aluno já está matriculado no curso
    IF EXISTS (
        SELECT 1
        FROM Alunos
        WHERE RA = p_RA_Aluno AND Cursos_idCursos = CursoID
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Aluno já possui matrícula no curso.';
    ELSE
        -- Inserir o aluno na tabela Alunos com a referência para o curso
        INSERT INTO Alunos (nome_alunos, Sobrenome, RA, CPF, Email, Telefone, Cursos_idCursos)
        VALUES (p_Nome_Aluno, p_Sobrenome_Aluno, p_RA_Aluno, p_CPF_Aluno, p_Email_Aluno, p_Telefone_Aluno, CursoID);
    END IF;
END$

DELIMITER ;
