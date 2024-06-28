-- TABLA LOG_tarjetas -- -- TABLA LOG_tarjetas -- -- TABLA LOG_tarjetas -- -- TABLA LOG_tarjetas -- -- TABLA LOG_tarjetas --
CREATE TABLE tb_log_tarjetas(
    id_log_tarjeta INT PRIMARY KEY AUTO_INCREMENT,
    accion VARCHAR(10),
    n_tarjeta INT,
    saldo DECIMAL(20,2),
    id_cliente INT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
); 

-- TABLA tb_log_clientes -- -- TABLA tb_log_clientes -- -- TABLA tb_log_clientes --  -- TABLA tb_log_clientes -- -- TABLA tb_log_clientes --
CREATE TABLE tb_log_clientes(
    id_log_cliente INT PRIMARY KEY AUTO_INCREMENT,
    accion VARCHAR(10),
    id_cliente INT,
    nombre_comnpleto VARCHAR(250),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- TABLA tb_log_movimientos -- -- TABLA tb_log_movimientos -- -- TABLA tb_log_movimientos -- -- TABLA tb_log_movimientos -- -- TABLA tb_log_movimientos --
CREATE TABLE tb_log_tipo_movimientos(
    id_log_tipo_movimientos INT PRIMARY KEY AUTO_INCREMENT,
    accion VARCHAR(10),
    id_tipo_movimiento INT,
    tipo VARCHAR(50),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);