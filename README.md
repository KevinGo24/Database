# SQL DATABASE PERFORMACE TEST

This is my test of relational database performance with PostgreSQL. A database named db_kevin_gonzalez_cayena is created, and the following tables are created:
- City
- Branch
- Client
- Technician
- Equipment
- WorkOrder

## SQL COMMAND

- create database db_kevin_gonzalez_cayena
```text
CREATE TABLE city 
CREATE TABLE branch 
CREATE TABLE client
CREATE TABLE Technician 
CREATE TABLE Equipment
CREATE TABLE WorkOrder
```

## SQL ATTRIBUTE $ FIELDS

- city table
```text
    id_city SERIAL PRIMARY KEY,
    name_city VARCHAR(50) NOT NULL UNIQUE

```
- branch table
```text
    id_branch SERIAL PRIMARY KEY,
    name_branch VARCHAR(50) NOT NULL UNIQUE
```
- client table
```text
  id_client SERIAL PRIMARY KEY,
    fullname VARCHAR(100) NOT NULL,
    id_city INT NOT NULL,
    id_branch INT NOT NULL
```
- technician table
```text
    id_technician SERIAL PRIMARY KEY,
    fullname VARCHAR(100) NOT NULL,
    tel_technician VARCHAR(20)
```
- equipament table
```text
    id_equipment SERIAL PRIMARY KEY,
    name_equipament VARCHAR(100) NOT NULL,
    EquipmentCategory VARCHAR(50) NOT NULL 
```
- WorkOrder table
```text
        work_order VARCHAR(10) PRIMARY KEY,
    date_service DATE NOT NULL,
    service_type VARCHAR(50) NOT NULL,
    hours_service INT NOT NULL,
    cost_service INT NOT NULL,
    id_client INT NOT NULL,      
    id_technician INT NOT NULL,  
    id_equipment INT NOT NULL
```

## PRIMARY KEY & FOREIGN KEY

### TABLE PRIMARY KEY

- city table (id_city SERIAL PRIMARY KEY)
- brachm table (id_branch SERIAL PRIMARY KEY)
- client table (id_client SERIAL PRIMARY KEY,)
- technician table (id_technician SERIAL PRIMARY KEY)

### FOREIGN KEY

- client table
```text
    FOREIGN KEY (id_city) REFERENCES city(id_city),
    FOREIGN KEY (id_branch) REFERENCES branch(id_branch)
```
- WorkOrder table
```text
   FOREIGN KEY (id_client) REFERENCES client(id_client),
    FOREIGN KEY (id_technician) REFERENCES Technician(id_technician),
    FOREIGN KEY (id_equipment) REFERENCES Equipment(id_equipment)
```

## NOT NULL

It does not allow sending empty fields

## UNIQUE

The UNIQUE constraint in SQL guarantees that all values ​​in a column or set of columns are different.

## PRIMARY KEY

is a unique identifier of a table

## FOREIGN KEY

column or set of columns in a table that is linked to the primary key of another table.