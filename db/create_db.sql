CREATE DATABASE cajero_expres

USE cajero_expres

CREATE TABLE tb_clientes(
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(25),
    ap_paterno VARCHAR(25),
    ap_materno VARCHAR(25),
);
/*Tabla de historial (log)*/
CREATE TABLE tb_log_clientes(
    id_log_cliente INT PRIMARY KEY AUTO_INCREMENT,
    accion VARCHAR(10),
    id_cliente INT,
    nombre_comnpleto VARCHAR(250),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
); /**/

-- trigger tb_log_clientes
DELIMITER / / 
CREATE TRIGGER tg_log_clientes_insert
AFTER
INSERT
    ON tb_clientes FOR EACH ROW BEGIN
INSERT INTO
    tb_log_clientes (accion, id_cliente, nombre_completo)
VALUES
    (
        'INSERT',
        NEW.id_cliente,
        CONCAT(
            NEW.nombre,
            ' ',
            NEW.ap_paterno,
            ' ',
            NEW.ap_materno
        )
    );
END;

/ / DELIMITER / / 
CREATE TRIGGER tg_log_clientes_update
AFTER
UPDATE
    ON tb_clientes FOR EACH ROW BEGIN
INSERT INTO
    tb_log_clientes (accion, id_cliente, nombre_completo)
VALUES
    (
        'UPDATE',
        OLD.id_cliente,
        CONCAT(
            'viejo: ', OLD.nombre,' nuevo: ',NEW.nombre,
            ' ',
            'viejo: ', OLD.ap_paterno,' nuevo: ', NEW.ap_paterno,
            ' ',
            'viejo: ', OLD.ap_materno,' nuevo: ', NEW.ap_materno
        )
    );

END;

CREATE TABLE tb_tarjetas(
    id_tarjeta INT PRIMARY KEY AUTO_INCREMENT,
    n_tarjeta VARCHAR(16),
    nip VARCHAR(4),
    saldo DECIMAL(20,2),
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES tb_clientes(id_cliente)
);

CREATE TABLE tb_tipo_movimientos(
    id_tipo_movimiento INT PRIMARY KEY AUTO_INCREMENT,
    tipo
);

CREATE TABLE tb_movimientos(
    id_movimiento INT PRIMARY KEY AUTO_INCREMENT,
    monto DECIMAL(7,2),
    fecha_movimiento TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_tarjeta INT,
    id_tipo_movimiento INT,
    FOREIGN KEY (id_tarjeta) REFERENCES tb_tarjetas(id_tarjeta),
    FOREIGN KEY (id_tipo_movimiento) REFERENCES tb_tipo_movimientos(id_tipo_movimiento)
);


/* 
formularios 
DATE    1990-09-25  tipo de dato para insercion 
TIME    10:05:25    horas,minutos,segundos
DATETIME    1990-09-25 10:05:25 fucion de ambas "NOW() <- NSERTA LA FECHA Y HORA DEL SERVIDOR"
YEAR 1990
*/

/* TIMESTAMP CURRENT_TIMESTAMP Fecha y hora actual de acuerdo a la zona horaria del registro */