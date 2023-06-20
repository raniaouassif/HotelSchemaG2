-- Query 1: Returns Reservations that End in July 2023, including guest, Room Number(s), Reservation Dates
SELECT Guest.guestName, RoomReservation.roomNumber, Reservation.startDate, Reservation.endDate 
FROM Reservation, RoomReservation, Guest
WHERE Reservation.reservation_id = RoomReservation.reservation_id AND Reservation.GuestId = Guest.GuestId  AND Reservation.endDate < '2023-07-31';



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
