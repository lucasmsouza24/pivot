DROP DATABASE testpivot;

CREATE DATABASE testpivot;

USE testpivot;

-- create tables
CREATE TABLE maquina(
    id INT AUTO_INCREMENT PRIMARY KEY,
    servidor VARCHAR(45)
);

CREATE TABLE tipo_medicao(
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(45) -- não inserir nomes contendo espaço!
);

CREATE TABLE medicao(
    id INT AUTO_INCREMENT PRIMARY KEY,
    valor DECIMAL(7, 2),
    data_hora DATETIME,
    fk_maquina INT NOT NULL,
    fk_tipo_medicao INT NOT NULL,
    FOREIGN KEY(fk_maquina) REFERENCES maquina(id),
    FOREIGN KEY(fk_tipo_medicao) REFERENCES tipo_medicao(id)
);

-- insert values
INSERT INTO
    maquina(servidor)
VALUES
    ('Server 1'),
    ('Server 2');

INSERT INTO
    tipo_medicao(tipo)
VALUES
    ('cpu_uso'),
    ('ram_uso'),
    ('disco_uso');

INSERT INTO
    medicao(valor, data_hora, fk_maquina, fk_tipo_medicao)
VALUES
    (30, '2021-10-05 00:00', 1, 1),
    (40, '2021-10-05 00:00', 1, 2),
    (50, '2021-10-05 00:00', 1, 3),
    (31, '2021-10-05 00:01', 2, 1),
    (42, '2021-10-05 00:01', 2, 2),
    (50, '2021-10-05 00:01', 2, 3),
    (32, '2021-10-05 00:02', 1, 1),
    (42, '2021-10-05 00:02', 1, 2),
    (50, '2021-10-05 00:02', 1, 3),
    (32, '2021-10-05 00:03', 2, 1),
    (44, '2021-10-05 00:03', 2, 2),
    (50, '2021-10-05 00:03', 2, 3),
    (31, '2021-10-05 00:04', 1, 1),
    (45, '2021-10-05 00:04', 1, 2),
    (50, '2021-10-05 00:04', 1, 3),
    (34, '2021-10-05 00:05', 2, 1),
    (47, '2021-10-05 00:05', 2, 2),
    (50, '2021-10-05 00:05', 2, 3),
    (39, '2021-10-05 00:06', 1, 1),
    (46, '2021-10-05 00:06', 1, 2),
    (50, '2021-10-05 00:06', 1, 3),
    (31, '2021-10-05 00:07', 2, 1),
    (43, '2021-10-05 00:07', 2, 2),
    (50, '2021-10-05 00:07', 2, 3),
    (32, '2021-10-05 00:08', 1, 1),
    (41, '2021-10-05 00:08', 1, 2),
    (50, '2021-10-05 00:08', 1, 3);