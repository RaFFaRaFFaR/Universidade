-- DELIMITER é usado para alterar o delimitador padrão de ponto e vírgula para '$'
DELIMITER $

-- Criação do Trigger para gerar automaticamente o e-mail
CREATE TRIGGER Gerar_Email_Aluno 
BEFORE INSERT ON Alunos 
FOR EACH ROW
BEGIN
    SET NEW.Email = CONCAT(NEW.Nome_Alunos, '.', NEW.Sobrenome, '@dominio.com');
END$

-- Restauração do delimitador padrão
DELIMITER ;

//////////////////////////////////////////////////////////////////////////////////////////////




