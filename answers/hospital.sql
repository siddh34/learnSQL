CREATE TABLE User (
    id INTEGER PRIMARY KEY,
    role ENUM('admin', 'paitent', 'doctor'),
    name VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    password VARCHAR(255),
    sex VARCHAR(10),
    age VARCHAR(10),
    patient_id INTEGER,
    doctor_id INTEGER,
    created_at DATE,
    updated_at DATE
);

CREATE TABLE Roles (
    roles_name ENUM('admin', 'paitent', 'doctor') PRIMARY KEY,
    appointment_permission TEXT[],
    support_tickets_permissions TEXT[],
    feedback_permissions TEXT[]
);

CREATE TABLE Paitent (
    id INTEGER PRIMARY KEY,
    user_id INTEGER UNIQUE,
    family_member INTEGER[],
    weight INTEGER,
    blood_group VARCHAR(10),
    relation TEXT[],
    health_issues TEXT[],
    FOREIGN KEY (user_id) REFERENCES User(id)
);

CREATE TABLE Docter (
    id INTEGER PRIMARY KEY,
    user_id INTEGER UNIQUE,
    services TEXT[],
    speciality TEXT[],
    experience INTEGER,
    default_fee INTEGER,
    average_consulting_time TIME,
    facility_name VARCHAR(255),
    facility_type VARCHAR(255),
    facility_location VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES User(id)
);

CREATE TABLE Timings (
    id INTEGER PRIMARY KEY,
    day VARCHAR(20),
    `to` TIME,
    `from` TIME,
    break_to TIME,
    break_from TIME,
    doctor_user_id INTEGER,
    FOREIGN KEY (doctor_user_id) REFERENCES Docter(user_id)
);

CREATE TABLE Feedbacks (
    id INTEGER PRIMARY KEY,
    paitent_user_id INTEGER,
    doctor_user_id INTEGER,
    time DATE,
    consulting_feedback DOUBLE,
    clinic_feedback DOUBLE,
    waiting_time DOUBLE,
    created_at DATE,
    update_at DATE,
    FOREIGN KEY (paitent_user_id) REFERENCES Paitent(user_id),
    FOREIGN KEY (doctor_user_id) REFERENCES Docter(user_id)
);

CREATE TABLE Appointment (
    id INTEGER PRIMARY KEY,
    paitent_user_id INTEGER,
    doctor_user_id INTEGER,
    fees INTEGER,
    time DATETIME,
    visit_type VARCHAR(50),
    ivr_app_id VARCHAR(100),
    status VARCHAR(50),
    paitent_complaint TEXT,
    paitent_current_weight DOUBLE,
    created_at DATE,
    updated_at DATE,
    FOREIGN KEY (paitent_user_id) REFERENCES Paitent(user_id),
    FOREIGN KEY (doctor_user_id) REFERENCES Docter(user_id)
);

CREATE TABLE Chat (
    id INTEGER PRIMARY KEY,
    doctor_user_id INTEGER,
    paitent_user_id INTEGER,
    type VARCHAR(50),
    message TEXT,
    created_at DATE,
    updated_at DATE,
    FOREIGN KEY (doctor_user_id) REFERENCES Docter(user_id),
    FOREIGN KEY (paitent_user_id) REFERENCES Paitent(user_id)
);

CREATE TABLE SupportTickets (
    id INTEGER PRIMARY KEY,
    message TEXT,
    paitent_user_id INTEGER,
    status ENUM('open', 'closed'),
    FOREIGN KEY (paitent_user_id) REFERENCES Paitent(user_id)
);

ALTER TABLE User ADD FOREIGN KEY (role) REFERENCES Roles(roles_name);
ALTER TABLE User ADD FOREIGN KEY (patient_id) REFERENCES Paitent(id);
ALTER TABLE User ADD FOREIGN KEY (doctor_id) REFERENCES Docter(id);
