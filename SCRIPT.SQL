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
    FOREIGN KEY (id_city) REFERENCES city(id_city),
    FOREIGN KEY (id_branch) REFERENCES branch(id_branch)
);

-- 4. technician table
CREATE TABLE Technician (
    id_technician SERIAL PRIMARY KEY,
    fullname VARCHAR(100) NOT NULL,
    tel_technician VARCHAR(20)
);

-- 5. equipament table
CREATE TABLE Equipment (
    id_equipment SERIAL PRIMARY KEY,
    name_equipament VARCHAR(100) NOT NULL,
    EquipmentCategory VARCHAR(50) NOT NULL 
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