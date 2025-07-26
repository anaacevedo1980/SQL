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