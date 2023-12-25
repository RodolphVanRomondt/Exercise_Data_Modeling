-- DDL MEDICAL CENTER

DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center;

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

INSERT INTO doctors (first_name, last_name) VALUES
    ('Pearl ', 'Sharp'), ('Nelson ', 'Adekoya'), ('Man-huei', 'Chang');

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

INSERT INTO patients (first_name, last_name) VALUES
    ('Rodolph', 'Van Romondt'), ('Colt', 'Steele'), ('David', 'Adewole');

CREATE TABLE diseases (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

INSERT INTO diseases (name) VALUES
    ('Hepatitis A'), ('Hepatitis B'), ('Hepatitis C');

CREATE TABLE doctors_patients (
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctors ON DELETE CASCADE,
    patient_id INTEGER REFERENCES patients ON DELETE CASCADE
);

INSERT INTO doctors_patients (doctor_id, patient_id) VALUES
    (1, 2), (1, 3), (2, 3);

CREATE TABLE patients_diseases (
    id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patients ON DELETE CASCADE,
    disease_id INTEGER REFERENCES diseases ON DELETE CASCADE
);

INSERT INTO patients_diseases (patient_id, disease_id) VALUES
    (1, 2), (1, 3), (2, 3);