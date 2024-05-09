CREATE DATABASE universal_reference;

\c universal_reference -- подключение к бд
  
CREATE TABLE entities (
    entity_id SERIAL PRIMARY KEY,
    entity_type VARCHAR(255) NOT NULL
);

CREATE TABLE attributes (
    attribute_id SERIAL PRIMARY KEY,
    attribute_name VARCHAR(255) NOT NULL,
    data_type VARCHAR(255) NOT NULL
);

CREATE TABLE entity_attributes (
    entity_id INT REFERENCES entities(entity_id),
    attribute_id INT REFERENCES attributes(attribute_id),
    value TEXT,
    PRIMARY KEY (entity_id, attribute_id)
);

---------------------------------------------------------------------------------
psql -U юзер -d бд -f create_tables.sql -- для выполнение скрипта
