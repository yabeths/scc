CREATE TABLE client (
    id INTEGER PRIMARY KEY,
    name VARCHAR,
    dateofbirth DATE,
    species VARCHAR
);

CREATE TABLE specialneed (
    id INTEGER PRIMARY KEY,
    description VARCHAR
);

CREATE TABLE home (
    id INTEGER PRIMARY KEY,
    name VARCHAR,
    phone VARCHAR
);

-- join table
CREATE TABLE clientneed (
    clientid INTEGER,
    needid INTEGER
);

-- join table
CREATE TABLE homecapability (
    homeid INTEGER,
    needid INTEGER
);

CREATE TABLE vaccine (
    id INTEGER PRIMARY KEY,
    name VARCHAR,
    notes VARCHAR
);

CREATE TABLE vaccinationschedule (
    id INTEGER PRIMARY KEY,
    vaccineid INTEGER,
    species VARCHAR,
    age INTERVAL
);

CREATE TABLE recurringvaccine (
    id INTEGER PRIMARY KEY,
    vaccineid INTEGER,
    species VARCHAR,
    boost INTERVAL
);

CREATE TABLE vaccination (
    id INTEGER PRIMARY KEY,
    clientid INTEGER,
    vaccineid INTEGER,
    date DATE
);
