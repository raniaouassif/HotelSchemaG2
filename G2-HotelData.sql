-- This script will destroy our G2HotelDB database and start a new!
DROP DATABASE IF EXISTS G2HotelDB;

CREATE DATABASE G2HotelDB;

-- Make sure we're in the correct database before we add schema.
USE G2HotelDB;

-- Creating the tables
CREATE TABLE Guest (
	GuestId INT PRIMARY KEY AUTO_INCREMENT,
    `Name` VARCHAR(100) NOT NULL,
    Address VARCHAR(200) NOT NULL,
    City VARCHAR(50) NOT NULL,
    State CHAR(2) NOT NULL,
    Zip VARCHAR(5) NOT NULL, 
    PhoneNumber CHAR(14) NOT NULL
);


-- Populate our database
INSERT INTO Guest (GuestId, `Name`, Address, City, State, Zip, PhoneNumber) VALUES
    (1, 'Mack Simmer', '379 Old Shore Street', 'Council Bluffs', 'IA', '51501', '(291) 553-0508'),
    (2, 'Bettyann Seery', '750 Wintergreen Dr.', 'Wasilla', 'AK', '99654', '(478) 277-9632'),
    (3, 'Duane Cullison', '9662 Foxrun Lane', 'Harlingen', 'TX', '78552', '(308) 494-0198'),
    (4, 'Karie Yang', '9378 W. Augusta Ave.', 'West Deptford', 'NJ', '8096', '(214) 730-0298'),
    (5, 'Aurore Lipton', '762 Wild Rose Street', 'Saginaw', 'MI', '48601', '(377) 507-0974'),
    (6, 'Zachery Luechtefeld', '7 Poplar Dr.', 'Arvada', 'CO', '80003', '(814) 485-2615'),
    (7, 'Jeremiah Pendergrass', '70 Oakwood St.', 'Zion', 'IL', '60099', '(279) 491-0960'),
    (8, 'Walter Holaway', '7556 Arrowhead St.', 'Cumberland', 'RI', '2864', '(446) 396-6785'),
    (9, 'Wilfred Vise', '77 West Surrey Street', 'Oswego', 'NY', '13126', '(834) 727-1001'),
    (10, 'Maritza Tilton', '939 Linda Rd.', 'Burke', 'VA', '22015', '(446) 351-6860'),
    (11, 'Joleen Tison', '87 Queen St.', 'Drexel Hill', 'PA', '19026', '(231) 893-2755');