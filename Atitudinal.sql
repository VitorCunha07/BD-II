1-SELECT nome_completo, materias_alunos.nota_prova_bimestral
FROM materias_alunos
INNER JOIN alunos ON materias_alunos.aluno_id = alunos.id
WHERE materias_alunos.nota_prova_bimestral >= 7;


2-SELECT nome_completo
FROM materias_alunos
INNER JOIN alunos ON materias_alunos.aluno_id = alunos.id
WHERE ((materias_alunos.nota_prova_bimestral*5) + 
(materias_alunos.nota_prova_mensal*3) +  
materias_alunos.nota_atitudinal + 
materias_alunos.nota_licoes) /10 >= 7;



3-SELECT alunos.nome_completo AS nome_completo, cursos.nome AS curso, 
    ((materias_alunos.nota_prova_bimestral * 5) + 
    (materias_alunos.nota_prova_mensal * 3) + 
    materias_alunos.nota_atitudinal + 
    materias_alunos.nota_licoes) / 10 AS media_final
FROM materias_alunos
INNER JOIN alunos ON materias_alunos.aluno_id = alunos.id
INNER JOIN cursos ON cursos.id = materias_alunos.id
WHERE cursos.nome = 'Jogos Digitais'
    AND ((materias_alunos.nota_prova_bimestral * 5) + 
    (materias_alunos.nota_prova_mensal * 3) + 
    materias_alunos.nota_atitudinal + 
    materias_alunos.nota_licoes) / 10 >= 7
    AND materias_alunos.nota_prova_bimestral >= 7;
