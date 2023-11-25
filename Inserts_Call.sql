INSERT INTO Alunos (nome_alunos, Sobrenome, RA, CPF, telefone, Cursos_idCursos) VALUES ('Maria', 'Oliveira', '789012', '987.654.321-09', '(22) 3456-7890', 56);


//////////////////////////////////////////////////////////////////////////////////////////////

CALL InserirCurso('Desenvolvimento Web', 4, 'Tecnologia');
CALL InserirCurso('Inteligência Artificial', 5, 'Tecnologia');
CALL InserirCurso('Redes de Computadores', 3, 'Tecnologia');
CALL InserirCurso('Segurança da Informação', 4, 'Tecnologia');
CALL InserirCurso('Ciência de Dados', 5, 'Tecnologia');


//////////////////////////////////////////////////////////////////////////////////////////////

CALL InserirNovoCurso('Enfermagem', 4, 'Saúde');
CALL InserirNovoCurso('Fisioterapia', 5, 'Saúde');
CALL InserirNovoCurso('Nutrição', 3, 'Saúde');
CALL InserirNovoCurso('Psicologia', 4, 'Saúde');
CALL InserirNovoCurso('Medicina', 6, 'Saúde');

//////////////////////////////////////////////////////////////////////////////////////////////

CALL MatricularAluno('João', 'Silva', '123456', '123.456.789-01', 'joao.silva@dominio.com', '(11) 98765-4321', 'Desenvolvimento Web');


//////////////////////////////////////////////////////////////////////////////////////////////

CALL MatricularAluno('Gisele', 'GM', '123001', '111.222.333-44', 'gisele.gm@dominio.com', '(11) 98765-4321', 'Desenvolvimento Web');
CALL MatricularAluno('Luciana', 'GM', '123002', '222.333.444-55', 'luciana.gm@dominio.com', '(11) 98765-4322', 'Inteligência Artificial');
CALL MatricularAluno('Luciano', 'GM', '123003', '333.444.555-66', 'luciano.gm@dominio.com', '(11) 98765-4323', 'Redes de Computadores');
CALL MatricularAluno('Fernando', 'GM', '123004', '444.555.666-77', 'fernando.gm@dominio.com', '(11) 98765-4324', 'Segurança da Informação');
CALL MatricularAluno('Jhonatan', 'GM', '123005', '555.666.777-88', 'jhonatan.gm@dominio.com', '(11) 98765-4325', 'Ciência de Dados');
CALL MatricularAluno('Gabriel', 'GM', '123006', '666.777.888-99', 'gabriel.gm@dominio.com', '(11) 98765-4326', 'Medicina');
CALL MatricularAluno('Giselle', 'GM', '123007', '777.888.999-00', 'giselle.gm@dominio.com', '(11) 98765-4327', 'Enfermagem');
CALL MatricularAluno('Mauro', 'GM', '123008', '888.999.000-11', 'mauro.gm@dominio.com', '(11) 98765-4328', 'Fisioterapia');

//////////////////////////////////////////////////////////////////////////////////////////////

CALL SelecionarTodosCursos