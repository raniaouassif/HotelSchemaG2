-- Query 1: Returns Reservations that End in July 2023, including guest, Room Number(s), Reservation Dates
SELECT Guest.guestName, RoomReservation.roomNumber, Reservation.startDate, Reservation.endDate 
FROM Reservation, RoomReservation, Guest
WHERE Reservation.reservation_id = RoomReservation.reservation_id AND Reservation.GuestId = Guest.GuestId  AND Reservation.endDate < '2023-07-31';
-- OUTPUT
-- guestName	roomNumber	startDate	endDate
-- Mack Simmer	308	2023-02-02	2023-02-04
-- Bettyann Seery	203	2023-02-05	2023-02-10
-- Bettyann Seery	303	2023-07-28	2023-07-29
-- Duane Cullison	305	2023-02-22	2023-02-24
-- Karie Yang	201	2023-03-06	2023-03-07
-- Aurore Lipton	302	2023-03-18	2023-03-23
-- Aurore Lipton	304	2023-06-17	2023-06-18
-- Zachery Luechtefeld	202	2023-03-29	2023-03-31
-- Jeremiah Pendergrass	304	2023-03-31	2023-04-05
-- Walter Holaway	301	2023-04-09	2023-04-13
-- Walter Holaway	204	2023-07-13	2023-07-14
-- Wilfred Vise	207	2023-04-23	2023-04-24
-- Wilfred Vise	401	2023-07-18	2023-07-21
-- Maritza Tilton	401	2023-05-30	2023-06-02
-- Joleen Tison	206	2023-06-10	2023-06-14
-- Joleen Tison	208	2023-06-10	2023-06-14

-- Query 2 : Write a query that returns a list of all reservations for rooms with a jacuzzi, displaying the guest's name, the room number, and the dates of the reservation.
SELECT Guest.`Name`, Room.roomNumber, Reservation.startDate, Reservation.endDate
FROM Room
JOIN RoomReservation ON Room.roomNumber = RoomReservation.roomNumber
JOIN Reservation ON RoomReservation.reservation_id = Reservation.reservation_id
JOIN Guest ON Reservation.guestId = Guest.guestId
JOIN RoomAmenity ON Room.roomNumber = RoomAmenity.roomNumber
WHERE RoomAmenity.amenityID = 3;
-- OUTPUT 
-- | Name                | roomNumber | startDate  | endDate    |
-- |---------------------|------------|------------|------------|
-- | Bettyann Seery      | 201        | 2023-02-05 | 2023-02-10 |
-- | Duane Cullison      | 201        | 2023-02-05 | 2023-02-10 |
-- | Duane Cullison      | 202        | 2023-02-22 | 2023-02-24 |
-- | Karie Yang          | 203        | 2023-03-06 | 2023-03-07 |
-- | Aurore Lipton       | 205        | 2023-03-18 | 2023-03-23 |
-- | Aurore Lipton       | 206        | 2023-03-29 | 2023-03-31 |
-- | Jeremiah Pendergrass | 206        | 2023-03-29 | 2023-03-31 |
-- | Walter Holaway      | 207        | 2023-03-31 | 2023-04-05 |
-- | Walter Holaway      | 208        | 2023-03-31 | 2023-04-05 |
-- | Maritza Tilton      | 301        | 2023-05-30 | 2023-06-02 |
-- | Joleen Tison        | 308        | 2023-06-10 | 2023-06-14 |
-- | Joleen Tison        | 308        | 2023-06-10 | 2023-06-14 |
-- | Aurore Lipton       | 305        | 2023-06-17 | 2023-06-18 |
-- | Walter Holaway      | 304        | 2023-07-13 | 2023-07-14 |
-- | Walter Holaway      | 304        | 2023-07-13 | 2023-07-14 |
-- | Wilfred Vise        | 305        | 2023-07-18 | 2023-07-21 |
-- | Bettyann Seery      | 302        | 2023-07-28 | 2023-07-29 |
-- | Mack Simmer         | 305        | 2023-08-30 | 2023-09-01 |
-- | Zachery Luechtefeld | 305        | 2023-08-30 | 2023-09-01 |
-- | Mack Simmer         | 305        | 2023-08-30 | 2023-09-01 |
-- | Mack Simmer         | 308        | 2023-08-30 | 2023-09-01 |
-- | Maritza Tilton      | 305        | 2023-08-30 | 2023-09-01 |
-- | Maritza Tilton      | 306        | 2023-09-16 | 2023-09-17 |
-- | Karie Yang          | 401        | 2023-09-13 | 2023-09-15 |
-- | Duane Cullison      | 401        | 2023-09-13 | 2023-09-15 |
-- | Duane Cullison      | 401        | 2023-09-13 | 2023-09-15 |

-- Query 3 : returns all the rooms reserved for a specific guest, 
-- including the guest's name, the room(s) reserved, the start date of the reservation, 
-- how many people were included in the reservation.
SELECT G.guestName, RM.roomNumber, R.startDate, R.adults + R.children AS totalGuests
FROM Guest G
JOIN Reservation R ON G.guestId = R.guestId
JOIN RoomReservation RR ON R.reservation_id = RR.reservation_id
JOIN Room RM ON RR.roomNumber = RM.roomNumber
WHERE G.guestName = 'Aurore Lipton';

-- OUTPUT
-- guestName	roomNumber	startDate	totalGuests
-- Aurore Lipton	302	2023-03-18	3
-- Aurore Lipton	304	2023-06-17	3

-- Query 4 : returns a list of rooms, reservation ID, and per-room cost for each reservation. The results should include all rooms, whether or not there is a reservation associated with the room.
SELECT Room.roomNumber, Reservation.reservation_id, Room.totalBase AS 'PerRoomCost'
FROM Room
LEFT JOIN RoomReservation ON Room.roomNumber = RoomReservation.roomNumber
LEFT JOIN Reservation ON RoomReservation.reservation_id = Reservation.reservation_id;

-- OUTPUT
-- roomNumber	reservation_id	PerRoomCost
-- 201	4	199.99
-- 202	6	174.99
-- 203	2	199.99
-- 203	19	199.99
-- 204	14	174.99
-- 205	NULL	174.99
-- 206	11	149.99
-- 206	21	149.99
-- 207	9	174.99
-- 208	12	149.99
-- 208	18	149.99
-- 301	8	199.99
-- 301	22	199.99
-- 302	5	174.99
-- 302	23	174.99
-- 303	16	199.99
-- 304	13	174.99
-- 305	3	174.99
-- 305	17	174.99
-- 306	NULL	149.99
-- 307	NULL	174.99
-- 308	1	149.99
-- 401	10	399.99
-- 401	15	399.99
-- 401	20	399.99
-- 402	NULL	399.99

-- Query 6: List of guest names and the number of reservations per guest
SELECT g.guestName, COUNT(r.reservation_id) AS NumberOfReservations
FROM Guest g
LEFT JOIN Reservation r ON g.guestId = r.guestId
GROUP BY g.guestName
ORDER BY NumberOfReservations DESC, g.guestName;

-- OUPUT
-- guestName	NumberOfReservations
-- Mack Simmer	4
-- Bettyann Seery	3
-- Aurore Lipton	2
-- Duane Cullison	2
-- Joleen Tison	2
-- Karie Yang	2
-- Maritza Tilton	2
-- Walter Holaway	2
-- Wilfred Vise	2
-- Zachery Luechtefeld	1

-- Query 7 :  returns the name, address, and phone number of a guest based on their phone number.
-- (Choose a phone number from the existing data.)
SELECT guestName,
address,
phoneNumber
FROM Guest
WHERE phoneNumber = '(291) 553-0508';
-- OUTPUT
-- guestName Mack Simmer
-- address 379 Old Shore Street
-- phoneNumber (291) 553-0508
