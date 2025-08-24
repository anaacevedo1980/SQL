-- Crear la base de datos
CREATE DATABASE guarderia_mascotas;
USE guarderia_mascotas;

-- Tabla: clientes
CREATE TABLE clientes (
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(100),
    direccion TEXT
);

-- Tabla: mascotas
CREATE TABLE mascotas (
    id_mascota INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    raza VARCHAR(50),
    fecha_nacimiento DATE,
    peso DECIMAL(5,2),
    observaciones TEXT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- Tabla: servicios
CREATE TABLE servicios (
    id_servicio INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL
);

-- Tabla: empleados
CREATE TABLE empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    rol VARCHAR(50),
    telefono VARCHAR(20)
);
-- Tabla: reservas
CREATE TABLE reservas (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    id_mascota INT NOT NULL,
    id_empleado INT NOT NULL, 
    fecha_ingreso DATETIME NOT NULL,
    fecha_salida DATETIME,
    id_servicio INT NOT NULL,
    observaciones TEXT,
    estado VARCHAR(20) DEFAULT 'Activa',
    FOREIGN KEY (id_mascota) REFERENCES mascotas(id_mascota),
    FOREIGN KEY (id_servicio) REFERENCES servicios(id_servicio),
     FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
);

-- Tabla:pagos
CREATE TABLE pagos (
    id_pago INT AUTO_INCREMENT PRIMARY KEY,
    id_reserva INT NOT NULL,
    fecha_pago DATETIME NOT NULL,
    monto DECIMAL(10,2) NOT NULL,
    medio_pago VARCHAR(50),
    estado_pago VARCHAR(20) DEFAULT 'Pagado',
    FOREIGN KEY (id_reserva) REFERENCES reservas(id_reserva)
);
-- ******************************---
-- Tabla:horarios_empleados
CREATE TABLE horarios_empleados (
    id_horario INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT NOT NULL,
    dia_semana ENUM('Lunes','Martes','Miércoles','Jueves','Viernes','Sábado','Domingo'),
    hora_entrada TIME,
    hora_salida TIME,
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
);

-- Tabla:promociones
CREATE TABLE promociones (
    id_promocion INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    descuento DECIMAL(5,2), 
    fecha_inicio DATE,
    fecha_fin DATE
);


-- Tabla de productos
CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tipo VARCHAR(50),
    stock INT DEFAULT 0,
    precio DECIMAL(10,2)
);


-- Tabla de consumos por mascota
CREATE TABLE consumos (
    id_consumo INT AUTO_INCREMENT PRIMARY KEY,
    id_mascota INT NOT NULL,
    id_producto INT NOT NULL,
    fecha_consumo DATETIME,
    cantidad INT,
    FOREIGN KEY (id_mascota) REFERENCES mascotas(id_mascota),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- Tabla intermedia servicios y promociones
 CREATE TABLE  SERVICIOS_PROMOCIONES (
        id_servicio_promocion INT AUTO_INCREMENT PRIMARY KEY,
        id_servicio  INT NOT NULL,
        id_promocion  INT NOT NULL,
        FOREIGN KEY (id_servicio) REFERENCES servicios(id_servicio),
        FOREIGN KEY ( id_promocion) REFERENCES promociones( id_promocion)
        
    );
    
   -- ******************************************************************************************************************************************

-- -------------------------------------------------------------INSERCION DE DATOS

-- Clientes
INSERT INTO clientes (nombre, telefono, email, direccion) VALUES
('Ana Pérez', '1122334455', 'ana@mail.com', 'Calle Falsa 123'),
('Carlos Gómez', '1144556677', 'carlos@mail.com', 'Av. Siempre Viva 742'),
('María López', '1166778899', 'maria@mail.com', 'San Martín 450'),
('Javier Torres', '1177889900', 'javier@mail.com', 'Belgrano 1120'),
('Lucía Fernández', '1188990011', 'lucia@mail.com', 'Mitre 220'),
('Diego Ramírez', '1199001122', 'diego@mail.com', 'Rivadavia 305'),
('Sofía Martínez', '1100112233', 'sofia@mail.com', 'Av. Libertad 980'),
('Martín Castro', '1133445566', 'martin@mail.com', 'Alsina 670'),
('Laura Méndez', '1155667788', 'laura@mail.com', 'Córdoba 1240'),
('Fernando Ruiz', '1166007788', 'fernando@mail.com', 'Saavedra 350'),
('Paula Herrera', '1177228899', 'paula@mail.com', 'Av. Pellegrini 800'),
('Ricardo Domínguez', '1188449900', 'ricardo@mail.com', 'Av. Colón 1450'),
('Valentina Ortiz', '1199550011', 'valentina@mail.com', 'Urquiza 230'),
('Gustavo Cabrera', '1100223344', 'gustavo@mail.com', 'Lavalle 720'),
('Camila Vargas', '1133556677', 'camila@mail.com', 'San Juan 360'),
('Hernán Molina', '1144667788', 'hernan@mail.com', 'Av. Roca 500'),
('Mónica Silva', '1155778899', 'monica@mail.com', 'Reconquista 122'),
('Alejandro Ponce', '1166889900', 'alejandro@mail.com', 'Av. 9 de Julio 340'),
('Florencia Aguirre', '1177990011', 'florencia@mail.com', 'Viamonte 250'),
('Pablo Ríos', '1188001122', 'pablo@mail.com', 'Alsina 940');

-- Mascotas
INSERT INTO mascotas (id_cliente, nombre, raza, fecha_nacimiento, peso, observaciones) VALUES
(1, 'Firulais', 'Labrador', '2020-05-10', 25.3, 'Muy juguetón'),
(2, 'Max', 'Bulldog', '2019-08-22', 18.7, 'Alérgico a la carne roja'),
(3, 'Luna', 'Caniche', '2021-01-15', 6.2, 'Le teme a los ruidos fuertes'),
(4, 'Rocky', 'Pastor Alemán', '2018-03-20', 32.5, 'Muy protector'),
(5, 'Nina', 'Beagle', '2020-11-02', 11.0, 'Ladra mucho cuando está sola'),
(6, 'Toby', 'Golden Retriever', '2019-06-12', 28.4, 'Le encanta nadar'),
(7, 'Kira', 'Dálmata', '2021-04-05', 22.0, 'Muy sociable con otros perros'),
(8, 'Simba', 'Chihuahua', '2022-02-18', 3.1, 'Muy nervioso'),
(9, 'Duke', 'Boxer', '2019-09-09', 24.7, 'Necesita ejercicio diario'),
(10, 'Mora', 'Cocker Spaniel', '2020-07-21', 14.5, 'Muy cariñosa'),
(11, 'Zeus', 'Rottweiler', '2018-12-30', 40.2, 'Debe comer dieta controlada'),
(12, 'Coco', 'Shih Tzu', '2021-09-10', 5.8, 'Se asusta con facilidad'),
(13, 'Olivia', 'Border Collie', '2020-10-25', 19.6, 'Muy inteligente'),
(14, 'Bruno', 'San Bernardo', '2019-04-11', 58.3, 'Babea mucho'),
(15, 'Milo', 'Pug', '2021-06-16', 9.7, 'Ronca al dormir'),
(16, 'Daisy', 'Husky Siberiano', '2020-12-01', 27.9, 'Le encanta correr'),
(17, 'Bobby', 'French Poodle', '2019-05-08', 7.5, 'Se lleva bien con niños'),
(18, 'Lola', 'Pitbull', '2021-03-03', 21.4, 'Muy tranquila'),
(19, 'Chispa', 'Dachshund', '2022-01-14', 6.9, 'Le gusta excavar'),
(20, 'Rocco', 'Mastín Napolitano', '2018-07-07', 60.0, 'Tranquilo pero fuerte');

-- Servicios
INSERT INTO servicios (nombre, descripcion, precio) VALUES
('Guardería diaria', 'Cuidado por día completo', 1500.00),
('Baño y peluquería', 'Baño, corte y secado', 2000.00),
('Paseo', 'Paseo de 1 hora', 800.00);

-- Empleados
INSERT INTO empleados (nombre, rol, telefono) VALUES
('Lucía Martínez', 'Cuidadora', '1177889900'),
('Juan López', 'Peluquero', '1199665544'),
('Mariana Torres', 'Veterinaria', '1188223344'),
('Pedro Gómez', 'Entrenador', '1166554433'),
('Carolina Fernández', 'Recepcionista', '1144332211');

-- Reservas 
INSERT INTO reservas (id_mascota, id_empleado, fecha_ingreso, fecha_salida, id_servicio, observaciones)
VALUES
(1, 1, '2025-08-21 09:00:00', '2025-08-21 18:00:00', 1, 'Traer comida especial'),
(2, 2, '2025-08-21 10:00:00', NULL, 2, 'Solicitado baño antialérgico'),
(3, 3, '2025-08-22 08:30:00', '2025-08-22 17:30:00', 1, 'Le gusta jugar con pelotas'),
(4, 4, '2025-08-22 09:15:00', '2025-08-22 14:00:00', 3, 'Paseo corto'),
(5, 5, '2025-08-22 11:00:00', NULL, 2, 'Corte de uñas solicitado'),
(6, 1, '2025-08-23 07:45:00', '2025-08-23 18:15:00', 1, 'Alergia a pollo'),
(7, 2, '2025-08-23 10:00:00', '2025-08-23 13:00:00', 3, 'Paseo por el parque'),
(8, 3, '2025-08-23 09:30:00', '2025-08-23 12:30:00', 2, 'Baño completo'),
(9, 4, '2025-08-24 08:00:00', '2025-08-24 17:00:00', 1, 'Se lleva bien con otros perros'),
(10, 5, '2025-08-24 11:15:00', NULL, 2, 'Consulta por piel'),
(11, 1, '2025-08-24 09:00:00', '2025-08-24 18:00:00', 1, 'Traer su manta'),
(12, 2, '2025-08-25 10:30:00', '2025-08-25 14:30:00', 2, 'Baño con shampoo medicado'),
(13, 3, '2025-08-25 08:15:00', '2025-08-25 16:45:00', 1, 'Prefiere estar al aire libre'),
(14, 4, '2025-08-25 09:45:00', NULL, 3, 'Paseo con correa reforzada'),
(15, 5, '2025-08-26 07:30:00', '2025-08-26 12:00:00', 2, 'Chequeo post baño'),
(16, 1, '2025-08-26 08:45:00', '2025-08-26 18:30:00', 1, 'Muy activo'),
(17, 2, '2025-08-26 10:00:00', '2025-08-26 13:30:00', 2, 'Baño express'),
(18, 3, '2025-08-27 09:00:00', '2025-08-27 15:00:00', 1, 'Le gusta dormir mucho'),
(19, 4, '2025-08-27 10:30:00', '2025-08-27 12:30:00', 3, 'Paseo corto'),
(20, 5, '2025-08-27 11:00:00', NULL, 2, 'Perfume canino'),
(1, 1, '2025-08-28 09:15:00', '2025-08-28 18:00:00', 1, 'Traer juguete favorito'),
(2, 2, '2025-08-28 08:45:00', '2025-08-28 13:00:00', 3, 'Paseo en grupo'),
(3, 3, '2025-08-28 10:00:00', NULL, 2, 'Cepillado extra'),
(4, 4, '2025-08-29 09:30:00', '2025-08-29 17:00:00', 1, 'Le gusta estar con Rocky'),
(5, 5, '2025-08-29 08:15:00', '2025-08-29 11:45:00', 3, 'Paseo en grupo'),
(6, 1, '2025-08-29 09:00:00', NULL, 2, 'Baño con acondicionador'),
(7, 2, '2025-08-30 07:45:00', '2025-08-30 18:15:00', 1, 'Sensible al ruido'),
(8, 3, '2025-08-30 09:15:00', '2025-08-30 12:00:00', 2, 'Baño medicado'),
(9, 4, '2025-08-30 10:45:00', '2025-08-30 15:30:00', 1, 'Muy sociable'),
(10, 5, '2025-08-31 08:00:00', '2025-08-31 17:00:00', 1, 'Traer comida hipoalergénica'),
(11, 1, '2025-08-31 09:30:00', NULL, 2, 'Cepillado especial'),
(12, 2, '2025-08-31 10:00:00', '2025-08-31 12:00:00', 3, 'Paseo tranquilo'),
(13, 3, '2025-08-31 11:15:00', '2025-08-31 16:30:00', 1, 'Juega con frisbee'),
(14, 4, '2025-08-31 07:30:00', '2025-08-31 13:00:00', 2, 'Baño y corte de pelo'),
(15, 5, '2025-08-31 09:00:00', NULL, 3, 'Paseo por plaza'),
(16, 1, '2025-08-31 08:45:00', '2025-08-31 18:15:00', 1, 'Requiere supervisión constante'),
(17, 2, '2025-08-31 09:15:00', '2025-08-31 14:00:00', 3, 'Paseo largo'),
(18, 3, '2025-08-31 10:30:00', NULL, 2, 'Shampoo para piel sensible'),
(19, 4, '2025-08-31 11:00:00', '2025-08-31 15:00:00', 1, 'Se lleva bien con gatos'),
(20, 5, '2025-08-31 12:00:00', '2025-08-31 18:00:00', 1, 'Muy tranquilo durante el día');

-- Pagos
INSERT INTO pagos (id_reserva, fecha_pago, monto, medio_pago) VALUES
(1, '2025-08-21 09:30:00', 0.00, 'Tarjeta'),
(2, '2025-08-21 11:00:00', 2000.00, 'Efectivo'),
(3, '2025-08-22 09:00:00', 1500.00, 'Tarjeta'),
(4, '2025-08-22 10:00:00', 0.00, 'Efectivo'),
(5, '2025-08-22 11:30:00', 2000.00, 'Transferencia'),
(6, '2025-08-23 08:00:00', 1500.00, 'Tarjeta'),
(7, '2025-08-23 10:30:00', 800.00, 'Efectivo'),
(8, '2025-08-23 10:00:00', 2000.00, 'Tarjeta'),
(9, '2025-08-24 08:30:00', 1500.00, 'Transferencia'),
(10, '2025-08-24 11:30:00', 2000.00, 'Efectivo'),
(11, '2025-08-24 09:30:00', 1500.00, 'Tarjeta'),
(12, '2025-08-25 10:45:00', 2000.00, 'Efectivo'),
(13, '2025-08-25 08:30:00', 1500.00, 'Transferencia'),
(14, '2025-08-25 10:00:00', 800.00, 'Tarjeta'),
(15, '2025-08-26 08:00:00', 2000.00, 'Efectivo'),
(16, '2025-08-26 09:00:00', 1500.00, 'Tarjeta'),
(17, '2025-08-26 10:15:00', 2000.00, 'Efectivo'),
(18, '2025-08-27 09:15:00', 1500.00, 'Transferencia'),
(19, '2025-08-27 10:45:00', 800.00, 'Tarjeta'),
(20, '2025-08-27 11:15:00', 2000.00, 'Efectivo'),
(21, '2025-08-28 09:30:00', 1500.00, 'Tarjeta'),
(22, '2025-08-28 09:00:00', 800.00, 'Transferencia'),
(23, '2025-08-28 10:15:00', 2000.00, 'Efectivo'),
(24, '2025-08-29 09:45:00', 1500.00, 'Tarjeta'),
(25, '2025-08-29 08:30:00', 800.00, 'Efectivo'),
(26, '2025-08-29 09:15:00', 2000.00, 'Transferencia'),
(27, '2025-08-30 08:00:00', 1500.00, 'Tarjeta'),
(28, '2025-08-30 09:30:00', 2000.00, 'Efectivo'),
(29, '2025-08-30 11:00:00', 1500.00, 'Tarjeta'),
(30, '2025-08-31 08:15:00', 1500.00, 'Transferencia'),
(31, '2025-08-31 09:45:00', 2000.00, 'Efectivo'),
(32, '2025-08-31 10:15:00', 800.00, 'Tarjeta'),
(33, '2025-08-31 11:30:00', 1500.00, 'Transferencia'),
(34, '2025-08-31 07:45:00', 2000.00, 'Tarjeta'),
(35, '2025-08-31 09:15:00', 800.00, 'Efectivo'),
(36, '2025-08-31 08:30:00', 1500.00, 'Tarjeta'),
(37, '2025-08-31 09:30:00', 800.00, 'Transferencia'),
(38, '2025-08-31 10:45:00', 2000.00, 'Efectivo'),
(39, '2025-08-31 11:15:00', 1500.00, 'Tarjeta'),
(40, '2025-08-31 12:15:00', 1500.00, 'Efectivo');


-- horarios_empleados - Cada empleado tiene horarios para lunes a viernes, con turnos mañana, tarde y noche
INSERT INTO horarios_empleados (id_empleado, dia_semana, turno, hora_entrada, hora_salida)
SELECT 
    e.id_empleado,
    d.dia,
    t.turno,
    -- hora de entrada según turno
    CASE t.turno
        WHEN 'Mañana' THEN DATE_ADD(d.fecha_ref, INTERVAL 8 HOUR)
        WHEN 'Tarde' THEN DATE_ADD(d.fecha_ref, INTERVAL 14 HOUR)
        WHEN 'Noche' THEN DATE_ADD(d.fecha_ref, INTERVAL 20 HOUR)
    END AS hora_entrada,
    -- hora de salida según turno
    CASE t.turno
        WHEN 'Mañana' THEN DATE_ADD(d.fecha_ref, INTERVAL 14 HOUR)
        WHEN 'Tarde' THEN DATE_ADD(d.fecha_ref, INTERVAL 20 HOUR)
        WHEN 'Noche' THEN DATE_ADD(d.fecha_ref, INTERVAL 26 HOUR) -- 20:00 + 6 horas = 02:00 del día siguiente
    END AS hora_salida
FROM empleados e
CROSS JOIN (
    SELECT 'Lunes' AS dia, '2025-08-18' AS fecha_ref UNION
    SELECT 'Martes', '2025-08-19' UNION
    SELECT 'Miércoles', '2025-08-20' UNION
    SELECT 'Jueves', '2025-08-21' UNION
    SELECT 'Viernes', '2025-08-22'
) d
CROSS JOIN (SELECT 'Mañana' AS turno UNION SELECT 'Tarde' UNION SELECT 'Noche') t;


-- promociones
INSERT INTO promociones (nombre, descripcion, descuento, fecha_inicio, fecha_fin) VALUES
('Promo Verano 1', 'Descuento especial para estancias largas en verano.', 10.00, '2025-01-01', '2025-01-31'),
('Promo Verano 2', 'Promo de verano: descuento en reservas de más de 5 días.', 12.50, '2025-01-01', '2025-02-15'),
('Promo Fin de Semana', 'Descuento por reservas viernes a domingo.', 15.00, '2025-02-01', '2025-03-31'),
('Promo San Valentín', 'Promo especial para mascotas en San Valentín.', 20.00, '2025-02-10', '2025-02-20'),
('Promo Marzo', 'Descuento general para el mes de marzo.', 8.00, '2025-03-01', '2025-03-31'),
('Promo Semana Santa', 'Descuento especial en Semana Santa.', 18.00, '2025-03-25', '2025-04-05'),
('Promo Abril 1', 'Descuento en hospedaje de mascotas en abril.', 10.00, '2025-04-01', '2025-04-30'),
('Promo Abril 2', 'Promo especial por reservas anticipadas en abril.', 12.00, '2025-04-01', '2025-04-30'),
('Promo Día del Animal', 'Descuento por el Día del Animal.', 25.00, '2025-04-20', '2025-04-30'),
('Promo Mayo', 'Promo especial para mayo.', 9.50, '2025-05-01', '2025-05-31'),
('Promo Día de la Madre', 'Descuento en el Día de la Madre.', 15.00, '2025-05-10', '2025-05-20'),
('Promo Junio', 'Descuento general en junio.', 11.00, '2025-06-01', '2025-06-30'),
('Promo Invierno 1', 'Promo de invierno para largas estadías.', 20.00, '2025-06-15', '2025-07-15'),
('Promo Invierno 2', 'Descuento por reservas en vacaciones de invierno.', 22.50, '2025-07-01', '2025-07-31'),
('Promo Agosto 1', 'Descuento especial para agosto.', 10.00, '2025-08-01', '2025-08-31'),
('Promo Agosto 2', 'Promo especial para nuevos clientes.', 15.00, '2025-08-01', '2025-08-31'),
('Promo Primavera', 'Promo especial de primavera.', 12.00, '2025-09-01', '2025-09-30'),
('Promo Día del Niño', 'Descuento especial Día del Niño.', 18.00, '2025-09-05', '2025-09-15'),
('Promo Octubre 1', 'Descuento general para octubre.', 10.00, '2025-10-01', '2025-10-31'),
('Promo Octubre 2', 'Promo especial para reservas online.', 13.00, '2025-10-01', '2025-10-31'),
('Promo Halloween', 'Promo de Halloween para mascotas.', 25.00, '2025-10-20', '2025-10-31'),
('Promo Noviembre 1', 'Descuento general en noviembre.', 9.00, '2025-11-01', '2025-11-30'),
('Promo Black Friday', 'Descuento especial Black Friday.', 30.00, '2025-11-25', '2025-11-30'),
('Promo Cyber Monday', 'Promo exclusiva Cyber Monday.', 28.00, '2025-11-28', '2025-12-02'),
('Promo Diciembre 1', 'Descuento especial diciembre.', 12.00, '2025-12-01', '2025-12-20'),
('Promo Navidad', 'Descuento especial de Navidad.', 20.00, '2025-12-15', '2025-12-26'),
('Promo Año Nuevo', 'Descuento de fin de año.', 18.00, '2025-12-27', '2026-01-05'),
('Promo Feriado Largo 1', 'Descuento por feriados largos.', 15.00, '2025-08-15', '2025-08-18'),
('Promo Feriado Largo 2', 'Descuento especial por puente.', 14.00, '2025-10-11', '2025-10-14'),
('Promo Cliente Frecuente 1', 'Descuento por ser cliente frecuente.', 10.00, '2025-01-01', '2025-12-31'),
('Promo Cliente Frecuente 2', 'Descuento por más de 10 reservas.', 12.00, '2025-01-01', '2025-12-31'),
('Promo Nuevo Cliente 1', 'Descuento para primera reserva.', 20.00, '2025-01-01', '2025-06-30'),
('Promo Nuevo Cliente 2', 'Promo especial para nuevos usuarios.', 18.00, '2025-07-01', '2025-12-31'),
('Promo Día de la Mascota', 'Descuento especial en el Día de la Mascota.', 22.00, '2025-04-15', '2025-04-25'),
('Promo Cumpleaños Mascota', 'Descuento por cumpleaños de la mascota.', 25.00, '2025-01-01', '2025-12-31'),
('Promo Paquete Vacaciones', 'Descuento por estadías largas.', 30.00, '2025-01-01', '2025-12-31'),
('Promo Fin de Año', 'Descuento especial de fin de año.', 15.00, '2025-12-15', '2025-12-31'),
('Promo Día del Amigo', 'Descuento especial día del amigo.', 18.00, '2025-07-15', '2025-07-25'),
('Promo Día del Padre', 'Descuento especial Día del Padre.', 16.00, '2025-06-10', '2025-06-20'),
('Promo Día del Trabajador', 'Descuento especial 1 de mayo.', 12.00, '2025-04-30', '2025-05-02');

-- productos
INSERT INTO productos (nombre, tipo, stock, precio) VALUES
('Alimento Premium Cachorro 3kg', 'Alimento', 50, 3200.00),
('Alimento Premium Adulto 15kg', 'Alimento', 30, 14500.00),
('Alimento Gato Adulto 7kg', 'Alimento', 25, 8900.00),
('Alimento Gato Kitten 3kg', 'Alimento', 20, 4200.00),
('Snack Hueso Dentastix', 'Snack', 100, 250.00),
('Snack Galletitas Perro 500g', 'Snack', 60, 950.00),
('Snack Atún Deshidratado Gato 200g', 'Snack', 40, 1200.00),
('Cama Redonda Mediana', 'Accesorio', 15, 8500.00),
('Cama Rectangular Grande', 'Accesorio', 10, 12500.00),
('Cucha Plástica Mediana', 'Accesorio', 12, 9800.00),
('Plato Doble Acero Inoxidable', 'Accesorio', 40, 2800.00),
('Plato Antideslizante', 'Accesorio', 35, 1500.00),
('Correa Nylon 1,5m', 'Accesorio', 50, 2200.00),
('Correa Retráctil 5m', 'Accesorio', 25, 4500.00),
('Collar Ajustable Chico', 'Accesorio', 60, 1500.00),
('Collar Ajustable Grande', 'Accesorio', 50, 2100.00),
('Arnés Mediano', 'Accesorio', 30, 3800.00),
('Arnés Grande', 'Accesorio', 20, 5200.00),
('Pelota de Goma', 'Juguete', 80, 700.00),
('Pelota con Sonido', 'Juguete', 70, 950.00),
('Cuerda para Morder', 'Juguete', 60, 1200.00),
('Hueso de Goma', 'Juguete', 55, 1100.00),
('Ratón de Tela con Catnip', 'Juguete', 40, 600.00),
('Rascador Gato Chico', 'Juguete', 20, 7500.00),
('Rascador Torre Mediana', 'Juguete', 10, 12800.00),
('Shampoo Perro 250ml', 'Higiene', 45, 2300.00),
('Shampoo Gato 250ml', 'Higiene', 30, 2500.00),
('Acondicionador Perro 250ml', 'Higiene', 20, 2800.00),
('Peine Metálico Perro', 'Higiene', 25, 1800.00),
('Peine Metálico Gato', 'Higiene', 20, 1900.00),
('Cepillo Suave Cachorros', 'Higiene', 30, 1600.00),
('Kit Cortaúñas Perro', 'Higiene', 15, 2700.00),
('Kit Cortaúñas Gato', 'Higiene', 15, 2600.00),
('Arena Sanitaria 10kg', 'Higiene', 50, 5400.00),
('Arena Sanitaria 5kg', 'Higiene', 70, 2800.00),
('Transportadora Plástica Chica', 'Accesorio', 15, 8500.00),
('Transportadora Plástica Mediana', 'Accesorio', 12, 10500.00),
('Bebedero Automático 3L', 'Accesorio', 18, 7200.00),
('Fuente de Agua Gato 2L', 'Accesorio', 10, 9500.00),
('Casa de Tela Plegable', 'Accesorio', 8, 11500.00);

-- mascotas
INSERT INTO consumos (id_mascota, id_producto, fecha_consumo, cantidad) VALUES
(1, 1, '2025-08-01 10:15:00', 1),   
(1, 5, '2025-08-01 10:20:00', 2),   
(2, 2, '2025-08-02 09:45:00', 1),
(2, 6, '2025-08-02 09:50:00', 1),
(3, 3, '2025-08-02 11:00:00', 1),
(3, 7, '2025-08-02 11:10:00', 3),
(4, 8, '2025-08-03 15:20:00', 1),
(4, 19, '2025-08-03 15:25:00', 2),
(5, 9, '2025-08-04 14:00:00', 1),
(5, 25, '2025-08-04 14:15:00', 1),
(6, 10, '2025-08-05 09:30:00', 1),
(6, 26, '2025-08-05 09:40:00', 2),
(7, 11, '2025-08-05 13:00:00', 1),
(7, 27, '2025-08-05 13:05:00', 1),
(8, 12, '2025-08-06 10:00:00', 2),
(8, 28, '2025-08-06 10:10:00', 1),
(9, 13, '2025-08-06 17:20:00', 1),
(9, 29, '2025-08-06 17:25:00', 1),
(10, 14, '2025-08-07 11:30:00', 1),
(10, 30, '2025-08-07 11:40:00', 2),
(11, 15, '2025-08-07 15:00:00', 1),
(11, 31, '2025-08-07 15:10:00', 1),
(12, 16, '2025-08-08 09:00:00', 1),
(12, 32, '2025-08-08 09:10:00', 2),
(13, 17, '2025-08-08 18:00:00', 1),
(13, 33, '2025-08-08 18:15:00', 1),
(14, 18, '2025-08-09 12:00:00', 1),
(14, 34, '2025-08-09 12:05:00', 3),
(15, 19, '2025-08-09 16:20:00', 2),
(15, 35, '2025-08-09 16:30:00', 1),
(16, 20, '2025-08-10 10:00:00', 1),
(16, 36, '2025-08-10 10:05:00', 1),
(17, 21, '2025-08-10 15:45:00', 1),
(17, 37, '2025-08-10 15:55:00', 1),
(18, 22, '2025-08-11 11:20:00', 2),
(18, 38, '2025-08-11 11:25:00', 1),
(19, 23, '2025-08-11 17:10:00', 1),
(19, 39, '2025-08-11 17:20:00', 1),
(20, 24, '2025-08-12 14:00:00', 1),
(20, 40, '2025-08-12 14:10:00', 1);


--  SERVICIOS_PROMOCIONES
INSERT INTO SERVICIOS_PROMOCIONES (id_servicio, id_promocion) VALUES
-- Guardería diaria (id_servicio = 1)
(1, 1),
(1, 2),
(1, 3),
(1, 5),
(1, 10),
(1, 13),
(1, 14),
(1, 17),
(1, 22),
(1, 23),
(1, 25),
(1, 26),
(1, 27),
(1, 31),
(1, 36),

-- Baño y peluquería (id_servicio = 2)
(2, 4),
(2, 7),
(2, 8),
(2, 9),
(2, 11),
(2, 16),
(2, 18),
(2, 20),
(2, 21),
(2, 24),
(2, 26),
(2, 29),
(2, 30),
(2, 32),
(2, 33),
(2, 35),
(2, 39),

-- Paseo (id_servicio = 3)
(3, 6),
(3, 12),
(3, 15),
(3, 17),
(3, 19),
(3, 20),
(3, 21),
(3, 22),
(3, 28),
(3, 31),
(3, 34),
(3, 37),
(3, 38),
(3, 39),
(3, 40);

-- **************************************************************************************************************************-------
----------------- VISTAS----------

-- Vista_mascotas_clientes (Lista todas las mascotas con su dueño, edad y peso)
CREATE OR REPLACE VIEW vista_mascotas_clientes AS
SELECT 
    m.id_mascota,
    m.nombre AS nombre_mascota,
    c.nombre AS nombre_cliente,
    m.raza,
    m.fecha_nacimiento,
    TIMESTAMPDIFF(YEAR, m.fecha_nacimiento, CURDATE()) AS edad_anios,
    m.peso,
    m.observaciones
FROM mascotas m
INNER JOIN clientes c ON m.id_cliente = c.id_cliente;

-- Vista de reservas activas con cliente, mascota, servicio y empleado
CREATE OR REPLACE VIEW  vista_reservas_activas AS
SELECT r.id_reserva, c.nombre AS cliente, m.nombre AS mascota, 
       s.nombre AS servicio, e.nombre AS empleado, 
       r.fecha_ingreso, r.fecha_salida, r.estado
FROM reservas r
INNER JOIN mascotas m ON r.id_mascota = m.id_mascota
INNER JOIN clientes c ON m.id_cliente = c.id_cliente
INNER JOIN servicios s ON r.id_servicio = s.id_servicio
INNER JOIN empleados e ON r.id_empleado = e.id_empleado
WHERE r.estado = 'Activa';


-- Vista de pagos con cliente y mascota
CREATE OR REPLACE VIEW vista_pagos AS
SELECT p.id_pago, c.nombre AS cliente, m.nombre AS mascota, 
       p.fecha_pago, p.monto, p.medio_pago, p.estado_pago
FROM pagos p
inner JOIN reservas r ON p.id_reserva = r.id_reserva
inner JOIN mascotas m ON r.id_mascota = m.id_mascota
inner JOIN clientes c ON m.id_cliente = c.id_cliente;

--  vista_reservas_por_servicio  (Muestra cuántas reservas tiene cada servicio y el monto total generado por él)
CREATE OR REPLACE VIEW vista_reservas_por_servicio AS
SELECT 
    s.id_servicio,
    s.nombre AS nombre_servicio,
    COUNT(r.id_reserva) AS total_reservas,
    SUM(s.precio) AS monto_total
FROM servicios s
LEFT JOIN reservas r ON r.id_servicio = s.id_servicio
GROUP BY s.id_servicio, s.nombre;

--  vista_ingresos_por_mes  ( Muestra los ingresos de la guardería por mes y año, sumando todos los pagos)
CREATE OR REPLACE VIEW vista_ingresos_por_mes AS
SELECT 
    YEAR(p.fecha_pago) AS anio,
    MONTH(p.fecha_pago) AS mes,
    COUNT(p.id_pago) AS total_pagos,
    SUM(p.monto) AS ingresos_totales
FROM pagos p
GROUP BY YEAR(p.fecha_pago), MONTH(p.fecha_pago)
ORDER BY anio, mes;


-- vista_reservas_detalladas ( Muestra todas las reservas con cliente, mascota, servicio, empleado, fechas, estado y monto pagado)
CREATE OR REPLACE VIEW vista_reservas_detalladas AS
SELECT
    r.id_reserva,
    c.nombre AS nombre_cliente,
    m.nombre AS nombre_mascota,
    m.raza AS raza_mascota,
    s.nombre AS servicio,
    e.nombre AS empleado,
    r.fecha_ingreso,
    r.fecha_salida,
    r.estado AS estado_reserva,
    IFNULL(p.monto, 0) AS monto_pagado,
    IFNULL(p.estado_pago, 'Pendiente') AS estado_pago
FROM reservas r
INNER JOIN mascotas m ON r.id_mascota = m.id_mascota
INNER JOIN clientes c ON m.id_cliente = c.id_cliente
INNER JOIN servicios s ON r.id_servicio = s.id_servicio
INNER JOIN empleados e ON r.id_empleado = e.id_empleado
LEFT JOIN pagos p ON r.id_reserva = p.id_reserva;

-- vista_reservas_activas_empleado ( Muestra las reservas activas que tiene cada empleado, con cliente y mascota asignada, ideal para planificar turnos diarios)
CREATE OR REPLACE VIEW vista_reservas_activas_empleado AS
SELECT
    e.id_empleado,
    e.nombre AS nombre_empleado,
    r.id_reserva,
    c.nombre AS nombre_cliente,
    m.nombre AS nombre_mascota,
    s.nombre AS servicio,
    r.fecha_ingreso,
    r.fecha_salida,
    r.estado AS estado_reserva
FROM reservas r
INNER JOIN empleados e ON r.id_empleado = e.id_empleado
INNER JOIN mascotas m ON r.id_mascota = m.id_mascota
INNER JOIN clientes c ON m.id_cliente = c.id_cliente
INNER JOIN servicios s ON r.id_servicio = s.id_servicio
WHERE r.estado = 'Activa'
ORDER BY e.id_empleado, r.fecha_ingreso;


-- *************************************************************************************************************--
-- ---------------------------------------------FUNCIONES-----------------------------------------------------------------------
-- Calcular edad de una mascota en años
DELIMITER //
CREATE FUNCTION calcular_edad(fecha_nacimiento DATE) 
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE());
END //
DELIMITER ;

-- Calcular monto total de una reserva
DELIMITER //
CREATE FUNCTION monto_reserva(id INT) 
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT precio INTO total FROM servicios s
    JOIN reservas r ON r.id_servicio = s.id_servicio
    WHERE r.id_reserva = id;
    RETURN total;
END //
DELIMITER ;

-- Función: Calcular total gastado por mascota ( Suma los consumos multiplicando cantidad × precio del producto)
DELIMITER $$

CREATE FUNCTION total_gastado_mascota(mascota_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);

    SELECT IFNULL(SUM(c.cantidad * p.precio), 0)
    INTO total
    FROM consumos c
    INNER JOIN productos p ON c.id_producto = p.id_producto
    WHERE c.id_mascota = mascota_id;

    RETURN total;
END$$

DELIMITER ;

-- Devuelve el porcentaje de descuento actual de una promoción activa
DELIMITER $$

CREATE FUNCTION descuento_vigente(promocion_id INT)
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    DECLARE descuento_actual DECIMAL(5,2);

    SELECT IF(CURDATE() BETWEEN fecha_inicio AND fecha_fin, descuento, 0)
    INTO descuento_actual
    FROM promociones
    WHERE id_promocion = promocion_id;

    RETURN IFNULL(descuento_actual, 0);
END$$

DELIMITER ;

-- Calcular stock disponible después de consumos ( Resta del stock inicial las cantidades consumidas de un producto)
DELIMITER $$

CREATE FUNCTION stock_disponible(producto_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE stock_actual INT;

    SELECT p.stock - IFNULL(SUM(c.cantidad), 0)
    INTO stock_actual
    FROM productos p
    LEFT JOIN consumos c ON p.id_producto = c.id_producto
    WHERE p.id_producto = producto_id
    GROUP BY p.stock;

    RETURN IFNULL(stock_actual, 0);
END$$

DELIMITER ;


-- ******************************************************************************************************************************************
-- ----------------------------------------- PROCEDIMIENTOS-------------------------------------------------
-- Registrar un consumo de mascota (Este SP inserta un consumo y actualiza el stock disponible (llamando a la función stock_disponible))

DELIMITER $$

CREATE PROCEDURE registrar_consumo (
    IN mascota_id INT,
    IN producto_id INT,
    IN cantidad INT
)
BEGIN
    DECLARE stock_restante INT;

    -- Verificamos el stock con la función
    SET stock_restante = stock_disponible(producto_id);

    IF stock_restante >= cantidad THEN
        -- Insertamos el consumo
        INSERT INTO consumos (id_mascota, id_producto, fecha_consumo, cantidad)
        VALUES (mascota_id, producto_id, NOW(), cantidad);

        -- Actualizamos el stock en la tabla productos
        UPDATE productos
        SET stock = stock - cantidad
        WHERE id_producto = producto_id;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No hay suficiente stock para registrar el consumo';
    END IF;
END$$

DELIMITER ;



--  Consultar el gasto total de una mascota (Llama a la función total_gastado_mascota)

DELIMITER $$

CREATE PROCEDURE consultar_gasto_mascota (
    IN mascota_id INT
)
BEGIN
    SELECT m.nombre, total_gastado_mascota(mascota_id) AS gasto_total
    FROM mascotas m
    WHERE m.id_mascota = mascota_id;
END$$

DELIMITER ;


-- Aplicar descuento de una promoción (Usa la función descuento_vigente y devuelve el precio con descuento)

DELIMITER $$

CREATE PROCEDURE aplicar_descuento (
    IN promocion_id INT,
    IN precio_original DECIMAL(10,2)
)
BEGIN
    DECLARE descuento DECIMAL(5,2);
    DECLARE precio_final DECIMAL(10,2);

    SET descuento = descuento_vigente(promocion_id);

    SET precio_final = precio_original - (precio_original * (descuento/100));

    SELECT promocion_id AS promocion,
           descuento AS porcentaje,
           precio_original,
           precio_final;
END$$

DELIMITER ;


-- Listar mascotas con sus edades (Este SP usa la función calcular_edad)

DELIMITER $$

CREATE PROCEDURE listar_mascotas_con_edad ()
BEGIN
    SELECT id_mascota, nombre, calcular_edad(fecha_nacimiento) AS edad
    FROM mascotas;
END$$

DELIMITER ;


-- *********************************************************************************************************************************
-- ----------------------------------------- TRIGGERS-----------------------------------------
-- Cambiar estado de reserva al registrar un pago (Cuando se inserta un pago, automáticamente cambia el estado de la reserva a "Pagada")

DELIMITER $$

CREATE TRIGGER trg_actualizar_estado_reserva
AFTER INSERT ON pagos
FOR EACH ROW
BEGIN
    UPDATE reservas
    SET estado = 'Pagada'
    WHERE id_reserva = NEW.id_reserva;
END$$

DELIMITER ;


-- Evitar stock negativo (Antes de insertar un consumo, se valida que haya suficiente stock. Si no hay, lanza error)
DELIMITER $$

CREATE TRIGGER trg_validar_stock
BEFORE INSERT ON consumos
FOR EACH ROW
BEGIN
    DECLARE stock_actual INT;

    SELECT stock INTO stock_actual
    FROM productos
    WHERE id_producto = NEW.id_producto;

    IF stock_actual < NEW.cantidad THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No hay stock suficiente para este consumo';
    ELSE
        -- Actualizar stock automáticamente
        UPDATE productos
        SET stock = stock - NEW.cantidad
        WHERE id_producto = NEW.id_producto;
    END IF;
END$$

DELIMITER ;

-- Marcar reserva como finalizada al registrar fecha de salida (Cuando se actualiza fecha_salida, el estado pasa a "Finalizada")
DELIMITER $$

CREATE TRIGGER trg_finalizar_reserva
BEFORE UPDATE ON reservas
FOR EACH ROW
BEGIN
    IF NEW.fecha_salida IS NOT NULL AND OLD.fecha_salida IS NULL THEN
        SET NEW.estado = 'Finalizada';
    END IF;
END$$
DELIMITER ;

-- Registro automático de promociones vencidas (Cuando llega la fecha fin de una promoción, se marca como expirada)

--  Para esto, primero agregamos un campo estado en la tabla promociones:

ALTER TABLE promociones ADD estado VARCHAR(20) DEFAULT 'Activa';

DELIMITER $$

CREATE TRIGGER trg_expirar_promocion
BEFORE UPDATE ON promociones
FOR EACH ROW
BEGIN
    IF NEW.fecha_fin < CURDATE() THEN
        SET NEW.estado = 'Expirada';
    END IF;
END$$

DELIMITER ;

-- asegura que las promociones se marquen como expiradas tanto al crearse como al modificarse.


DELIMITER $$

CREATE TRIGGER trg_expirar_promocion_insert
BEFORE INSERT ON promociones
FOR EACH ROW
BEGIN
    IF NEW.fecha_fin < CURDATE() THEN
        SET NEW.estado = 'Expirada';
    END IF;
END$$

DELIMITER ;


















