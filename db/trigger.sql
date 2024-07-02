
-- triger insert_tarjeta--  --Inserta nueva tarjeta--
DELIMITER//
CREATE TRIGGER tg_log_tarjetas_insert   /*crea el triger*/
AFTER INSERT ON tb_tarjetas FOR EACH ROW BEGIN 
INSERT INTO tb_log_tarjetas (accion,n_tarjeta,saldo,id_cliente)
VALUES (
    'INSERT',
    NEW.n_tarjeta,
    NEW.saldo,
    NEW.id_cliente
);
END;

--Trigger tgr_update_tarjetas--
DELIMITER//
CREATE TRIGGER tgr_update_tarjetas  /*crea el triger*/
AFTER UPDATE ON tb_tarjetas FOR EACH ROW    /*Primera accion,antes de nsertar en la tabla (N)*/
BEGIN 
INSERT INTO tb_log_tarjetas (accion,n_tarjeta,saldo,id_cliente)
VALUES (
    'UPDATE',
    NEW.n_tarjeta,
    NEW.saldo,
    NEW.id_cliente
);
END;

--Trigger tgr_eliminar_tarjetas--
DELIMITER//
CREATE TRIGGER tgr_eliminar_tarjetas    /*crea el triger*/
BEFORE DELETE ON tb_tarjetas FOR EACH ROW   /*Primera accion,antes de nsertar en la tabla (N)*/
BEGIN 
INSERT INTO tb_log_tarjetas (accion,n_tarjeta,saldo,id_cliente)
VALUES (
    'DELETE',
    OLD.n_tarjeta,
    OLD.saldo,
    OLD.id_cliente
);
END;



/*CLIENTES -- CLIENTES -- CLIENTES  -- CLIENTES -- CLIENTES -- CLIENTES -- CLIENTES -- CLIENTES -- CLIENTES*/

-- tg_log_clientes_insert --

DELIMITER / / 
CREATE TRIGGER tg_log_clientes_insert   /*crea el triger*/
AFTER INSERT ON tb_clientes FOR EACH ROW BEGIN
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

-- tg_log_clientes_update --

/ / DELIMITER / / 
CREATE TRIGGER tg_log_clientes_update   /*crea el triger*/
AFTER UPDATE ON tb_clientes FOR EACH ROW BEGIN
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

-- tg_log_clientes_delete --

/ / DELIMITER / / 
CREATE TRIGGER tg_log_clientes_delete   /*crea el triger*/
BEFORE DELETE ON tb_clientes FOR EACH ROW BEGIN
INSERT INTO
    tb_log_clientes (accion, id_cliente, nombre_completo)
VALUES
    (
        'DELETE',
        OLD.id_cliente,
        CONCAT(
            'viejo: ', OLD.nombre,
            ' ',
            'viejo: ', OLD.ap_paterno,
            ' ',
            'viejo: ', OLD.ap_materno,
        )
    );

END;

-- Trigger de login -- -- Trigger de login -- -- Trigger de login -- -- Trigger de login -- -- Trigger de login -- 

DELIMITER //
CREATE TRIGGER tb_login_clientes 
AFTER UPDATE ON tb_clientes FOR EACH ROW BEGIN
IF NEW.estado = 'Activo' AND OLD.estado <> 'Inactivo' THEN
INSERT INTO tb_log_clientes (accion, id_cliente, nombre_completo)
VALUES
    (
        'LOGIN', 
        NEW.id_cliente, 
        CONCAT(
            NEW.nombre, '', NEW.ap_paterno, '', NEW.ap_materno
        )
    );
END IF;
END//

-- Trigger de logout -- -- Trigger de logout -- -- Trigger de logout -- -- Trigger de logout -- -- Trigger de logout -- 

DELIMITER //
CREATE TRIGGER tb_logout_clientes 
AFTER UPDATE ON tb_clientes FOR EACH ROW BEGIN
IF NEW.estado = 'Inactivo' AND OLD.estado <> 'Activo' THEN
INSERT INTO tb_log_clientes (accion, id_cliente, nombre_completo)
VALUES
    (
        'LOGOUT', 
        OLD.id_cliente, 
        CONCAT(
            OLD.nombre, '', OLD.ap_paterno, '', OLD.ap_materno
        )
    );
END IF;
    END//

-- ACCCIONES -- -- ACCCIONES -- -- ACCCIONES -- -- ACCCIONES -- -- ACCCIONES -- -- ACCCIONES -- -- ACCCIONES --

-- Trigger tg_log_tipo_movimientos_insert --

DELIMITER / / 
CREATE TRIGGER tg_log_tipo_movimientos_insert   /*crea el triger*/
AFTER INSERT ON tb_tipo_movimientos FOR EACH ROW BEGIN
INSERT INTO
    tb_log_tipo_movimientos (accion, id_tipo_movimiento, tipo)
VALUES
    (
        'INSERT',
        NEW.id_tipo_movimiento,
        NEW.tipo
    );
END;

-- Trigger tg_log_tipo_movimientos_update --

DELIMITER / / 
CREATE TRIGGER tg_log_tipo_movimientos_update   /*crea el triger*/
AFTER UPDATE ON tb_tipo_movimientos FOR EACH ROW BEGIN
INSERT INTO
    tb_log_movimientos (accion, id_tipo_movimiento, tipo)
VALUES
    (
        'UPDATE',
        NEW.id_tipo_movimiento,
        NEW.tipo
    );

END;

-- Trigger tg_log_tipo_movimientos_delete --

DELIMITER / / 
CREATE TRIGGER tg_log_tipo_movimientos_delete   /*crea el triger*/
AFTER DELETE ON tb_tipo_movimientos FOR EACH ROW BEGIN
INSERT INTO
    tb_log_movimientos (accion, id_tipo_movimiento, tipo)
VALUES
    (
        'DELETE',
        OLD.id_tipo_movimiento,
        OLD.tipo
    );
END;

