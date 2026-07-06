-- 1. city table
CREATE TABLE city (
    id_city SERIAL PRIMARY KEY,
    name_city VARCHAR(50) NOT NULL UNIQUE
);

-- 2. branch table
CREATE TABLE branch (
    id_branch SERIAL PRIMARY KEY,
    name_branch VARCHAR(50) NOT NULL UNIQUE
);

-- 3. client table
CREATE TABLE client (
    id_client SERIAL PRIMARY KEY,
    fullname VARCHAR(100) NOT NULL,
    id_city INT NOT NULL,
    id_branch INT NOT NULL,
	date_service DATE NOT NULL,
    FOREIGN KEY (id_city) REFERENCES city(id_city),
    FOREIGN KEY (id_branch) REFERENCES branch(id_branch)
);

-- 4. technician table
CREATE TABLE Technician (
    id_technician SERIAL PRIMARY KEY,
    fullname VARCHAR(100) NOT NULL,
    tel_technician VARCHAR(20)
	work_order VARCHAR(10),
	FOREIGN KEY (work_order) REFERENCES WorkOrder(work_order),
);

-- 5. equipament table
CREATE TABLE Equipment (
    id_equipment SERIAL PRIMARY KEY,
    name_equipament VARCHAR(100) NOT NULL,
    EquipmentCategory VARCHAR(50) NOT NULL,
);

-- 6. WorkOrder table
CREATE TABLE WorkOrder (
    work_order VARCHAR(10) PRIMARY KEY,
    date_service DATE NOT NULL,
    service_type VARCHAR(50) NOT NULL,
    hours_service INT NOT NULL,
    cost_service INT NOT NULL,
    id_client INT NOT NULL,      
    id_technician INT NOT NULL,  
    id_equipment INT NOT NULL,   
    FOREIGN KEY (id_client) REFERENCES client(id_client),
    FOREIGN KEY (id_technician) REFERENCES Technician(id_technician),
    FOREIGN KEY (id_equipment) REFERENCES Equipment(id_equipment)
)

BEGIN TRANSACTION;

-- 1. Insertar el nuevo cliente
INSERT INTO client (id_client, fullname, id_city, id_bramch) 
-- Insertar la orden de servicio asociada al último cliente creado
INSERT INTO workorder (work_order, date_service, hours_service,id_client) 
COMMIT TRANSACTION;
-- 3. actualizar 
UPDATE workorder SET cost_service WHERE workorder.hours_service
-- 4. ELIMINAR
DELETE FROM client WHERE client.fullname
-- 5 consulatr por registro
SELECT name_equipament COUNT WorkOrder(work_order) FROM workorder GROUP BY fullname
-- 6 historial
SELECT 
    c.id_city,
    n.name_city,
FROM 
    WorkOrder w
INNER JOIN 
    client c ON s.id_client = c.id_cliente
ORDER BY 
    c.id_city ASC, 
    s.date_service DESC;
--7 numero de ordenes
SELECT 
 o.work_order,
 c.FULLNAME,
 FROM
 Technician on i.id_technician
 GROUP BY
 o.work_order,
 c.FULLNAME,
 ORDER BY
 ORDER_WORK DESC