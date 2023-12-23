-- DDL MEDICAL CENTER

DROP DATABASE IF EXISTS medical_center_db;

CREATE DATABASE medical_center_db;

\c medical_center_db;

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    dob DATE NOT NULL,
    speciality VARCHAR(20),
    salary FLOAT NOT NULL
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    dob DATE NOT NULL,
)

CREATE TABLE diseases (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
)

CREATE TABLE doctors_patients (
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctors ON DELETE CASCADE,
    patient_id INTEGER REFERENCES patients ON DELETE CASCADE
)

CREATE TABLE patients_diseases (
    id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patients ON DELETE CASCADE,
    disease_id INTEGER REFERENCES diseases ON DELETE CASCADE
)
