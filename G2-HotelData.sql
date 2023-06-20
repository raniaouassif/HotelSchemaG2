-- This script will destroy our G2HotelDB database and start a new!
DROP DATABASE IF EXISTS G2HotelDB;

CREATE DATABASE G2HotelDB;

-- Make sure we're in the correct database before we add schema.
USE G2HotelDB;

CREATE TABLE Guest (
	guestId INT PRIMARY KEY AUTO_INCREMENT,
    `Name` VARCHAR(100) NOT NULL,
    Address VARCHAR(200) NOT NULL,
    City VARCHAR(50) NOT NULL,
    State CHAR(2) NOT NULL,
    Zip VARCHAR(5) NOT NULL, 
    PhoneNumber CHAR(14) NOT NULL
);

CREATE TABLE RoomType (
	roomTypeId INT NOT NULL,
    CONSTRAINT pk_roomType
		PRIMARY KEY (roomTypeId),
	roomType VARCHAR(50) NOT NULL,
    standardOccupancy INT NOT NULL,
    maxOccupancy INT NOT NULL,
    basePrice DECIMAL NOT NULL,
    extraAdultFee DECIMAL NOT NULL
);

CREATE TABLE Amenity (
    amenityID INT PRIMARY KEY,
    Room VARCHAR(10) NOT NULL,
    Type VARCHAR(10) NOT NULL,
    Amenities VARCHAR(100) NOT NULL,
    ADAAccessible VARCHAR(3) NOT NULL,
    StandardOccupancy INT NOT NULL,
    MaximumOccupancy INT NOT NULL,
    BasePrice DECIMAL NOT NULL,
    ExtraPerson DECIMAL NOT NULL
);

CREATE TABLE Reservation (
    reservation_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    guestId INT NOT NULL,
    adults INT NOT NULL,
    children INT NOT NULL,
    startDate DATE NOT NULL,
    endDate DATE NOT NULL,
    totalCost DECIMAL NOT NULL,
    FOREIGN KEY fk_Reservation_Guest (guestId)
        REFERENCES Guest(guestId)
);

CREATE TABLE Room (
	roomNumber INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	adaAccessible BOOL NOT NULL,
    roomTypeId INT NOT NULL,
    TotalBase DECIMAL NOT NULL,
    FOREIGN KEY fk_RoomType_Room (roomTypeId)
		REFERENCES RoomType(roomTypeId)
);

CREATE TABLE RoomAmenity (
    amenityID INT,
    roomTypeID INT,
    CONSTRAINT pk_RoomAmenity
    	PRIMARY KEY (amenityID, roomTypeID),
    CONSTRAINT fk_RoomAmenity_Amenity
    	FOREIGN KEY (amenityID)
    	REFERENCES Amenity(amenityID),
    CONSTRAINT fk_pk_RoomAmenity_RoomType
    	FOREIGN KEY (roomTypeID)
    	REFERENCES RoomType(roomTypeID)
);

CREATE TABLE RoomReservation (
    roomNumber INT NOT NULL,
    reservation_id INT NOT NULL,
    PRIMARY KEY pk_RoomReservation (roomNumber, reservation_id),
    FOREIGN KEY fk_ProjectWorker_Reservation (reservation_id)
        REFERENCES Reservation(reservation_id),
	FOREIGN KEY fk_RoomReservation_Room (roomNumber)
        REFERENCES Room(roomNumber)	
);



