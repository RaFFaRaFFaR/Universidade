DELIMITER $

-- Criação da função para obter o ID do curso
CREATE FUNCTION ObterIDdoCurso(
    p_NomeCurso VARCHAR(45),
    p_AreaCurso VARCHAR(45)
)
RETURNS INT
BEGIN
    DECLARE CursoID INT;

    -- Buscar o ID do curso com base no nome e área fornecidos
    SELECT idCursos INTO CursoID
    FROM Cursos
    WHERE Nome_cursos = p_NomeCurso AND Area = p_AreaCurso;

    RETURN CursoID;
END$

DELIMITER ;


SELECT ObterIDdoCurso('Desenvolvimento Web', 'Tecnologia');
