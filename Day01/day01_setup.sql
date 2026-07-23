-- 1. Wipe out any old version of the database completely
DROP DATABASE IF EXISTS synexus_db;

-- 2. Create a fresh database from scratch
CREATE DATABASE synexus_db;
USE synexus_db;

-- 3. Create the members table
CREATE TABLE members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    designation VARCHAR(100),
    joined_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 4. Create the events table
CREATE TABLE events (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    event_name VARCHAR(150) NOT NULL,
    event_date DATE NOT NULL,
    location VARCHAR(150),
    is_active BOOLEAN DEFAULT 1
);