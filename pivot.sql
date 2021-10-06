-- INNER JOIN view
CREATE OR REPLACE VIEW v_inner_join AS
SELECT maquina.servidor, valor, data_hora, tipo_medicao.tipo FROM 
maquina INNER JOIN medicao ON maquina.id = medicao.fk_maquina
INNER JOIN tipo_medicao ON medicao.fk_tipo_medicao = tipo_medicao.id;

-- pivot
SET @sql = CONCAT('CREATE OR REPLACE VIEW v_analytics AS SELECT servidor, data_hora, ', 
(SELECT GROUP_CONCAT(DISTINCT CONCAT('max(case when tipo = ''', tipo, ''' then valor end) ', 
tipo)) FROM v_inner_join), ' FROM v_inner_join GROUP BY data_hora ORDER BY data_hora ASC');

-- execute
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SELECT * FROM v_analytics;