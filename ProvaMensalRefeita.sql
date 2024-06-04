-- Primeira

SELECT alunos.nome_completo
FROM materias_alunos
INNER JOIN alunos ON materias_alunos.aluno_id = alunos.id
INNER JOIN materias ON materias_alunos.materia_id = materias.id
WHERE materias.nome = 'Português'
  AND ((materias_alunos.nota_prova_bimestral * 0.5) + 
       (materias_alunos.nota_prova_mensal * 0.3) + 
       (materias_alunos.nota_atitudinal * 0.1) + 
       (materias_alunos.nota_licoes * 0.1)) > 8.0;
 

-- Segunda


SELECT alunos.nome_completo, materias.nome AS materia,
       ((materias_alunos.nota_prova_bimestral * 0.5) + 
        (materias_alunos.nota_prova_mensal * 0.3) + 
        (materias_alunos.nota_atitudinal * 0.1) + 
        (materias_alunos.nota_licoes * 0.1)) AS media_final
FROM materias_alunos
INNER JOIN alunos ON materias_alunos.aluno_id = alunos.id
INNER JOIN materias ON materias_alunos.materia_id = materias.id
WHERE materias.nivel = 'Ensino Médio';


-- Terceira primeira parte


UPDATE materias_alunos
SET aprovado = CASE 
                 WHEN ((materias_alunos.nota_prova_bimestral * 0.5) + 
                       (materias_alunos.nota_prova_mensal * 0.3) + 
                       (materias_alunos.nota_atitudinal * 0.1) + 
                       (materias_alunos.nota_licoes * 0.1)) >= 6.0 
                 THEN 'true' 
                 ELSE 'false' 
               END;


-- Terceira segunda parte


ALTER TABLE materias_alunos
DROP COLUMN aprovado;
