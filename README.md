
# Sistema Universidade (FUNCTIONS)
#
#

![universidade](https://github.com/RaFFaRaFFaR/Universidade/assets/127689567/a6f802eb-dde4-449a-891f-415ba8835757)


#
#
#
#

### Objetivo

 O objetivo deste banco de dados universitário é fornecer uma estrutura eficiente e organizada para gerenciar informações relacionadas a alunos, cursos e matrículas em uma instituição de ensino. O sistema visa facilitar a automação de processos, como a inserção e consulta de cursos, matrícula de alunos em disciplinas específicas, além de automatizar a geração de e-mails para os alunos com base em um formato predefinido. A estrutura do banco, composta por tabelas, stored procedures e triggers, busca promover a integridade referencial e garantir que as operações sejam realizadas de maneira consistente e segura, contribuindo para uma administração acadêmica eficaz e eficiente.

#
#
#
#

# Codigo:

```SQL
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Universidade
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Universidade
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Universidade` DEFAULT CHARACTER SET utf8 ;
USE `Universidade` ;

-- -----------------------------------------------------
-- Table `Universidade`.`Cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Universidade`.`Cursos` (
  `idCursos` INT NOT NULL AUTO_INCREMENT,
  `Nome_Cursos` VARCHAR(45) NULL,
  `Duracao` INT NULL,
  PRIMARY KEY (`idCursos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Universidade`.`Alunos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Universidade`.`Alunos` (
  `idAlunos` INT NOT NULL AUTO_INCREMENT,
  `Nome_Alunos` VARCHAR(50) NULL,
  `CPF` INT NULL,
  `EMAIL` VARCHAR(50) NULL,
  `RA` INT NULL,
  `Telefeone` INT NULL,
  `Cursos_idCursos` INT NOT NULL,
  PRIMARY KEY (`idAlunos`),
  INDEX `fk_Alunos_Cursos_idx` (`Cursos_idCursos` ASC) VISIBLE,
  CONSTRAINT `fk_Alunos_Cursos`
    FOREIGN KEY (`Cursos_idCursos`)
    REFERENCES `Universidade`.`Cursos` (`idCursos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


```

#
#
#
#

# Etapa 1: Crie um banco de dados para armazenar alunos e cursos de uma universidade;

![Alunos](https://github.com/RaFFaRaFFaR/Universidade/assets/127689567/3e0cd398-f3ed-4419-9448-b4ed4f3dd3d6)

![Cursos](https://github.com/RaFFaRaFFaR/Universidade/assets/127689567/e13b4701-8538-4070-a8d5-5f62da3b1568)

#
#

# Etapa 2: Cada curso pode pertencer a somente uma área;



``` SQL
CALL InserirCurso('Desenvolvimento Web', 4, 'Tecnologia');
CALL InserirCurso('Inteligência Artificial', 5, 'Tecnologia');
CALL InserirCurso('Redes de Computadores', 3, 'Tecnologia');
CALL InserirCurso('Segurança da Informação', 4, 'Tecnologia');
CALL InserirCurso('Ciência de Dados', 5, 'Tecnologia');

CALL InserirNovoCurso('Enfermagem', 4, 'Saúde');
CALL InserirNovoCurso('Fisioterapia', 5, 'Saúde');
CALL InserirNovoCurso('Nutrição', 3, 'Saúde');
CALL InserirNovoCurso('Psicologia', 4, 'Saúde');
CALL InserirNovoCurso('Medicina', 6, 'Saúde');

```

![Call_New_Cursos](https://github.com/RaFFaRaFFaR/Universidade/assets/127689567/894f0aed-786a-41b9-a54e-695331c37ef9)

#
#


# Etapa 3: Utilize Stored Procedures para automatizar a inserção e seleção dos cursos;


``` SQL
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

```
![Call_inserir_alunos](https://github.com/RaFFaRaFFaR/Universidade/assets/127689567/f6f358fd-6583-4b59-9e89-8387b775d17d)

``` SQL

DELIMITER $

CREATE PROCEDURE SelecionarTodosCursos()
BEGIN

    SELECT * FROM Cursos;
END$

DELIMITER ;


```

![Call_selecionaralunos](https://github.com/RaFFaRaFFaR/Universidade/assets/127689567/b21a500b-1ed5-4252-b016-775fef4f7cbb)
#
#


# Etapa 4: O aluno possui um e-mail que deve ter seu endereço gerado automaticamente no seguinte formato: nome.sobrenome@dominio.com

Crie uma view chamada "PedidosClientes" que combina informações das tabelas "Clientes" e "Pedidos" usando JOIN para mostrar os detalhes dos pedidos e os nomes dos clientes.
``` SQL
DELIMITER $

CREATE TRIGGER Gerar_Email_Aluno 
BEFORE INSERT ON Alunos 
FOR EACH ROW
BEGIN
    SET NEW.Email = CONCAT(NEW.Nome_Alunos, '.', NEW.Sobrenome, '@dominio.com');
END$

DELIMITER ;;

```
``` SQL
INSERT INTO Alunos (nome_alunos, Sobrenome, RA, CPF, telefone, Cursos_idCursos) VALUES ('Maria', 'Oliveira', '789012', '987.654.321-09', '(22) 3456-7890', 56);
lientes c ON pc.ClienteID = c.ClienteID;

```


![Trigger_EMAIL](https://github.com/RaFFaRaFFaR/Universidade/assets/127689567/c32cd27e-53ac-40af-89ff-296326a10416)
#
#


# Etapa 5: Crie uma rotina que recebe os dados de um novo curso e o insere no banco de dados

``` SQL
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

```

![Call_New_Cursos](https://github.com/RaFFaRaFFaR/Universidade/assets/127689567/8e7cf739-4859-4f1d-8355-cacaabaaa20e)
#
#

# Etapa 6: Crie uma função que recebe o nome de um curso e sua área, em seguida retorna o id do curso;

``` SQL
DELIMITER $


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

```

![funcao_id](https://github.com/RaFFaRaFFaR/Universidade/assets/127689567/e94ae82b-ad9b-4899-8e51-6e6ce48ac64e)
#
#



# Etapa 7: Crie uma procedure que recebe os dados do aluno e de um curso e faz sua matrícula;

``` SQL
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

```

![Call_inserir_alunos](https://github.com/RaFFaRaFFaR/Universidade/assets/127689567/e9222bef-85db-4149-ac4b-f6576bfe2d1a)
#
#

# Etapa 8: Caso o aluno já esteja matriculado em um curso, essa matrícula não pode ser realizada

``` SQL
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

```

![error_inserir](https://github.com/RaFFaRaFFaR/Universidade/assets/127689567/acaad491-c299-46e4-afd2-248b6e069770)

![error_inserir_descri](https://github.com/RaFFaRaFFaR/Universidade/assets/127689567/77e197d7-49a8-428e-bf12-b3056b847260)

# Etapa 9: Crie o modelo lógico do exercício.

![Diagrama](https://github.com/RaFFaRaFFaR/Universidade/assets/127689567/b01b733d-7f0f-4de6-99fe-c9425980e8a5)
#
#
#
#
# OBRIGADO!



![logo-maker-featuring-aliens-and-robots-2367-el1](https://github.com/bancos-de-dados/Com-rcio-Eletr-nico/assets/127689567/96d142cd-2b5c-409d-9ba1-ce5a2a665972)
