/* Tworzenie sztucznych danych */

insert into Employees
values
(1, 'Anna', 'Maria', 23.01, null),
(2, 'Maria', 'Anna', 32, 1),
(3, 'John', 'Smith', 22, 1),
(4, 'Smith', 'John', 33, 5),
(5, 'Shrek', 'Theonion', 50, null),
(6, 'Banana', 'Bread', 100, 5),
(7, 'Pumpkin', 'Late', 15, 2);

insert into Projects
values
(1, 'Bakery', '{"client" : "John", "address":{"town":"Belgrade","street":"Paris"}}', 6),
(2, 'Court', '{"client" : "Poland", "address":{"town":"Warsaw", "street": "Koszykowa"}}', 1),
(3, 'Swimming', '{"client":"Mr.Swimmer","address":{"town":"Belgrade", "street": "Weierstrass"}}', 2),
(4, 'Onions', '{"client":"England","address":{"town":"Swamp", "street": "Mud"}}', 5),
(5, 'Water', '{"client":"Life","address":{"town":"Earth", "street": "Oceanandseas"}}', 3);

insert into WorkTimes
values
(1, 2, '2025-10-12 08:12:00.0000000 +02:00', '08:00:00'),
(2, 3, '2025-10-12 08:00:00.0000000 +02:00', '08:00:00'),
(4, 1, '2025-10-12 09:00:00.0000000 +02:00', '03:00:00'),
(5, 2, '2025-11-12 08:00:00.0000000 +02:00', '05:30:00'),
(6, 1, '2024-12-03 13:00:00.0000000 +01:00', '04:20:00'),
(1, 2, '2024-12-03 08:00:00.0000000 +00:00', '09:00:00'),
(1, 3, '2024-12-04 08:00:00.0000000 +00:00', '09:00:00'),
(3, 5, '2023-01-02 13:00:00.0000000 +01:00', '05:00:00'),
(5, 4, '2025-01-07 08:00:00.0000000 +01:00', '10:00:00'),
(7, 5, '2025-01-09 08:00:00.0000000 +00:00', '07:40:00');

insert into AdditionalExpenses
values
(1, 1, 12000, 'Nowy telewizor', '2024-12-03 08:00:00.0000000 +00:00'),
(2, 2, 200,'Lunch dla zespo³u','2024-12-04 08:00:00.0000000 +00:00'),
(3, 3, 30000, 'Woda do basenu', '2025-10-12 09:00:00.0000000 +02:00'),
(4 ,4, 2, '£zy', '2025-02-02 00:00:00.0000000 +01:00'),
(5, 5, 9999999999, 'Pacyfik', '2025-01-01 12:00:00.0000000 +01:00'),
(6, 1, 11.11, 'Nowy chleb', '2022-12-03 08:00:00.0000000 +00:00');