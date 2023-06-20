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