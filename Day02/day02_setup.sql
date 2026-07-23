USE synexus_db;

INSERT INTO members (first_name, last_name, email, designation) 
VALUES 
('Anant', 'Sharma', 'anant.tjit@gmail.com', 'Founder'),
('Abhay Aditya', 'R S', 'abhayaditya1875@gmail.com', 'Chief Creative Officer'),
('Harshit', 'Singh', 'harshitsingh.vtu@gmail.com', 'Backend & Java Lead'),
('P V', 'Pavitra', 'pavitrapv0405@gmail.com', 'Operations Head'),
('K V', 'Greeshma', 'kvgreeshma34@gmail.com', 'Core Team Member');

INSERT INTO events (event_name, event_date, location)
VALUES
('Build For Bengaluru Hackathon', '2026-04-24', 'REVA University, Bangalore'),
('AWS Community Day', '2026-07-11', 'Central Convention Space, Bangalore'),
('Bengaluru Tech Week', '2026-09-01', 'Citywide Venues, Bangalore'),
('Smart Horizon 48-Hour Hackathon', '2026-09-03', 'New Horizon College of Engineering, Bangalore'),
('Bengaluru Tech Summit 2026', '2026-11-17', 'BIEC, Bangalore');

SELECT * FROM members;

SELECT * FROM events;

SELECT first_name, last_name, designation 
FROM members;