--
-- PostgreSQL database dump
--

\restrict iif7lNlLW2ACvuLMfjsYcOwKbfI3Q1duCvLhhWonTpnezCl5Dz22X9LUpzG8sBa

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (101, 'MRF', 'Zapper', '80/100-18', 'Bike', 'Honda Shine,Hero Splendor,TVS Radeon', 42, 6, 1650.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (102, 'MRF', 'Zapper', '90/90-18', 'Bike', 'Bajaj Pulsar,TVS Apache,Honda Hornet,Yamaha FZ', 28, 5, 1850.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (103, 'MRF', 'Nylogrip', '100/90-17', 'Bike', 'Bajaj Pulsar 150,TVS Apache 160,Yamaha FZ', 18, 4, 2100.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (104, 'MRF', 'Nylogrip', '110/70-17', 'Bike', 'Bajaj Pulsar NS200,TVS Apache 200,Yamaha MT-15', 9, 3, 2450.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (105, 'MRF', 'Nylogrip', '120/80-17', 'Bike', 'Royal Enfield Classic 350,Royal Enfield Hunter 350', 6, 3, 2750.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (106, 'MRF', 'Masseter', '100/90-18', 'Bike', 'Royal Enfield Classic 350,Royal Enfield Bullet 350', 22, 4, 2300.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (107, 'CEAT', 'Zoom', '80/100-18', 'Bike', 'Honda Shine,Hero Splendor,TVS Radeon', 35, 5, 1700.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (108, 'CEAT', 'Zoom', '90/90-18', 'Bike', 'Bajaj Pulsar,TVS Apache,Honda Hornet,Yamaha FZ', 24, 5, 1900.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (109, 'CEAT', 'Zoom', '100/80-17', 'Bike', 'Bajaj Pulsar 150,TVS Apache 160,Yamaha FZ', 17, 4, 2200.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (110, 'CEAT', 'Gripp', '110/70-17', 'Bike', 'Bajaj Pulsar NS200,TVS Apache 200,Yamaha MT-15', 11, 3, 2550.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (111, 'CEAT', 'Gripp', '120/80-17', 'Bike', 'Royal Enfield Classic 350,Royal Enfield Hunter 350', 7, 2, 2850.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (112, 'CEAT', 'SecuraDrive', '195/65 R15', 'Car', 'Honda City,Hyundai Verna,Maruti Ciaz', 16, 3, 5200.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (113, 'Apollo', 'ActiGripp', '80/100-18', 'Bike', 'Honda Shine,Hero Splendor,TVS Radeon', 31, 6, 1600.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (114, 'Apollo', 'ActiGripp', '90/90-18', 'Bike', 'Bajaj Pulsar,TVS Apache,Honda Hornet,Yamaha FZ', 21, 4, 1800.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (115, 'Apollo', 'ActiGripp', '100/90-17', 'Bike', 'Bajaj Pulsar 150,TVS Apache 160,Yamaha FZ', 14, 3, 2050.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (116, 'Apollo', 'Alpha', '110/70-17', 'Bike', 'Bajaj Pulsar NS200,TVS Apache 200,Yamaha MT-15', 8, 3, 2500.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (117, 'Apollo', 'Alpha', '120/80-17', 'Bike', 'Royal Enfield Classic 350,Royal Enfield Hunter 350', 5, 2, 2800.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (118, 'Apollo', 'Amazer', '175/65 R15', 'Car', 'Maruti Swift,Hyundai Grand i10,Honda Amaze', 20, 3, 4800.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (119, 'Bridgestone', 'Turanza', '185/65 R15', 'Car', 'Honda City,Hyundai i20,Maruti Baleno,Tata Altroz', 13, 2, 6100.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (120, 'Bridgestone', 'Turanza', '195/65 R15', 'Car', 'Honda City,Hyundai Verna,Maruti Ciaz', 18, 3, 6400.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (121, 'Bridgestone', 'Turanza', '205/55 R16', 'Car', 'Honda Civic,Skoda Octavia,Volkswagen Jetta', 9, 2, 7200.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (122, 'Bridgestone', 'Ecopia', '165/70 R14', 'Car', 'Maruti Swift,Maruti WagonR,Hyundai Grand i10', 25, 3, 4500.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (123, 'Bridgestone', 'Ecopia', '175/65 R15', 'Car', 'Maruti Swift,Hyundai Grand i10,Honda Amaze', 12, 2, 5100.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (124, 'Michelin', 'Energy XM2+', '165/70 R14', 'Car', 'Maruti Swift,Maruti WagonR,Hyundai Grand i10', 19, 3, 5600.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (125, 'Michelin', 'Energy XM2+', '175/65 R15', 'Car', 'Maruti Swift,Hyundai Grand i10,Honda Amaze', 14, 2, 6100.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (126, 'Michelin', 'Energy XM2+', '185/65 R15', 'Car', 'Honda City,Hyundai i20,Maruti Baleno,Tata Altroz', 10, 2, 6500.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (127, 'Michelin', 'Primacy 4', '195/65 R15', 'Car', 'Honda City,Hyundai Verna,Maruti Ciaz', 8, 2, 7800.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (128, 'Michelin', 'Primacy 4', '205/55 R16', 'Car', 'Honda Civic,Skoda Octavia,Volkswagen Jetta', 6, 2, 8500.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (129, 'Goodyear', 'Assurance', '165/70 R14', 'Car', 'Maruti Swift,Maruti WagonR,Hyundai Grand i10', 22, 3, 4700.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (130, 'Goodyear', 'Assurance', '175/65 R15', 'Car', 'Maruti Swift,Hyundai Grand i10,Honda Amaze', 15, 2, 5200.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (131, 'Goodyear', 'Assurance', '185/65 R15', 'Car', 'Honda City,Hyundai i20,Maruti Baleno,Tata Altroz', 11, 2, 5700.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (132, 'Goodyear', 'Eagle F1', '205/55 R16', 'Car', 'Honda Civic,Skoda Octavia,Volkswagen Jetta', 7, 2, 8200.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (133, 'Yokohama', 'Earth-1', '165/70 R14', 'Car', 'Maruti Swift,Maruti WagonR,Hyundai Grand i10', 18, 3, 5000.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (134, 'Yokohama', 'Earth-1', '175/65 R15', 'Car', 'Maruti Swift,Hyundai Grand i10,Honda Amaze', 13, 2, 5500.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (135, 'Yokohama', 'Earth-1', '185/65 R15', 'Car', 'Honda City,Hyundai i20,Maruti Baleno,Tata Altroz', 9, 2, 5900.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (136, 'Yokohama', 'Earth-1', '195/65 R15', 'Car', 'Honda City,Hyundai Verna,Maruti Ciaz', 6, 2, 6300.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (137, 'Yokohama', 'Advan Sport', '205/55 R16', 'Car', 'Honda Civic,Skoda Octavia,Volkswagen Jetta', 5, 1, 9000.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (138, 'JK Tyre', 'Blaze', '80/100-18', 'Bike', 'Honda Shine,Hero Splendor,TVS Radeon', 30, 5, 1550.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (139, 'JK Tyre', 'Blaze', '90/90-18', 'Bike', 'Bajaj Pulsar,TVS Apache,Honda Hornet,Yamaha FZ', 20, 4, 1750.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (140, 'JK Tyre', 'Blaze', '100/90-17', 'Bike', 'Bajaj Pulsar 150,TVS Apache 160,Yamaha FZ', 12, 3, 2000.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (141, 'JK Tyre', 'Vectra', '185/65 R15', 'Car', 'Honda City,Hyundai i20,Maruti Baleno,Tata Altroz', 14, 2, 4900.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (142, 'JK Tyre', 'Vectra', '195/65 R15', 'Car', 'Honda City,Hyundai Verna,Maruti Ciaz', 8, 2, 5300.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (143, 'TVS Eurogrip', 'Protorq', '80/100-18', 'Bike', 'Honda Shine,Hero Splendor,TVS Radeon', 34, 6, 1600.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (144, 'TVS Eurogrip', 'Protorq', '90/90-18', 'Bike', 'Bajaj Pulsar,TVS Apache,Honda Hornet,Yamaha FZ', 26, 5, 1800.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (145, 'TVS Eurogrip', 'Protorq', '100/80-17', 'Bike', 'Bajaj Pulsar 150,TVS Apache 160,Yamaha FZ', 15, 4, 2150.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (146, 'TVS Eurogrip', 'Remora', '110/70-17', 'Bike', 'Bajaj Pulsar NS200,TVS Apache 200,Yamaha MT-15', 10, 3, 2450.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (147, 'TVS Eurogrip', 'Remora', '120/80-17', 'Bike', 'Royal Enfield Classic 350,Royal Enfield Hunter 350', 6, 2, 2750.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (148, 'Ralco', 'Speed Blaster', '80/100-18', 'Bike', 'Honda Shine,Hero Splendor,TVS Radeon', 27, 5, 1450.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (149, 'Ralco', 'Speed Blaster', '90/90-18', 'Bike', 'Bajaj Pulsar,TVS Apache,Honda Hornet,Yamaha FZ', 19, 4, 1650.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (150, 'Ralco', 'Speed Blaster', '100/90-17', 'Bike', 'Bajaj Pulsar 150,TVS Apache 160,Yamaha FZ', 13, 3, 1950.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (151, 'MRF', 'Nylogrip', '90/90-19', 'Bike', 'Royal Enfield Classic 350,Royal Enfield Bullet 350', 16, 3, 2200.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (152, 'MRF', 'Nylogrip', '110/80-17', 'Bike', 'Bajaj Pulsar NS200,TVS Apache 200,Yamaha R15', 12, 3, 2650.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (153, 'MRF', 'Steel Brace', '100/90-18', 'Bike', 'Royal Enfield Classic 350,Royal Enfield Bullet 350', 19, 3, 2350.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (154, 'MRF', 'Steel Brace', '120/90-17', 'Bike', 'Royal Enfield Classic 350,Royal Enfield Meteor 350', 8, 2, 2900.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (155, 'MRF', 'Perfinza', '185/70 R14', 'Car', 'Maruti Swift Dzire,Tata Indica,Hyundai Xcent', 21, 3, 4600.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (156, 'MRF', 'Perfinza', '195/60 R15', 'Car', 'Honda City,Hyundai Verna,Maruti Ciaz', 10, 2, 5900.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (157, 'CEAT', 'Zoom Rad X1', '100/90-17', 'Bike', 'Bajaj Pulsar 150,TVS Apache 160,Yamaha FZ', 23, 4, 2250.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (158, 'CEAT', 'Zoom Rad X1', '110/80-17', 'Bike', 'Bajaj Pulsar NS200,TVS Apache 200,Yamaha R15', 9, 2, 2700.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (159, 'CEAT', 'Milaze', '90/90-18', 'Bike', 'Honda Shine,Hero Splendor,Bajaj Pulsar', 32, 6, 1750.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (160, 'CEAT', 'Milaze', '100/90-18', 'Bike', 'Royal Enfield Classic 350,Royal Enfield Bullet 350', 14, 3, 2200.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (161, 'CEAT', 'SecuraDrive', '185/65 R15', 'Car', 'Honda City,Hyundai i20,Maruti Baleno,Tata Altroz', 17, 3, 5100.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (162, 'CEAT', 'SecuraDrive', '205/55 R16', 'Car', 'Honda Civic,Skoda Octavia,Volkswagen Jetta', 6, 1, 7600.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (163, 'CEAT', 'SportDrive', '195/55 R16', 'Car', 'Volkswagen Polo,Honda City,Hyundai i20', 11, 2, 6800.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (164, 'CEAT', 'EnergyDrive', '175/70 R14', 'Car', 'Maruti Swift Dzire,Hyundai Xcent,Tata Tigor', 24, 3, 4900.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (165, 'Apollo', 'ActiGripp', '90/90-19', 'Bike', 'Royal Enfield Classic 350,Royal Enfield Bullet 350', 13, 2, 2150.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (166, 'Apollo', 'ActiGripp', '110/80-17', 'Bike', 'Bajaj Pulsar NS200,TVS Apache 200,Yamaha R15', 10, 3, 2600.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (167, 'Apollo', 'ActiGripp', '120/80-18', 'Bike', 'Royal Enfield Classic 350,Royal Enfield Meteor 350', 7, 2, 2850.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (168, 'Apollo', 'Alpha H1', '100/90-18', 'Bike', 'Royal Enfield Classic 350,Royal Enfield Bullet 350', 18, 3, 2400.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (169, 'Apollo', 'Alpha H1', '120/90-17', 'Bike', 'Royal Enfield Classic 350,Royal Enfield Meteor 350', 5, 1, 2950.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (170, 'Apollo', 'Amazer 4G Life', '185/70 R14', 'Car', 'Maruti Swift Dzire,Hyundai Xcent,Tata Tigor', 20, 3, 4700.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (171, 'Apollo', 'Amazer 4G Life', '195/60 R15', 'Car', 'Honda City,Hyundai Verna,Maruti Ciaz', 12, 2, 5500.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (172, 'Apollo', 'Amazer 4G Life', '205/65 R15', 'Car', 'Toyota Innova,Maruti Ertiga,Kia Carens', 9, 2, 6500.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (173, 'Bridgestone', 'Turanzas', '175/70 R14', 'Car', 'Maruti Swift Dzire,Hyundai Xcent,Tata Tigor', 18, 3, 5000.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (174, 'Bridgestone', 'Turanza', '195/60 R15', 'Car', 'Honda City,Hyundai Verna,Maruti Ciaz', 15, 2, 6700.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (175, 'Bridgestone', 'Turanza', '215/60 R16', 'Car', 'Hyundai Creta,Kia Seltos,Maruti Grand Vitara', 8, 2, 8200.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (176, 'Bridgestone', 'Ecopia', '185/70 R14', 'Car', 'Maruti Swift Dzire,Tata Indica,Hyundai Xcent', 23, 3, 4800.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (177, 'Bridgestone', 'Ecopia', '195/60 R15', 'Car', 'Honda City,Hyundai Verna,Maruti Ciaz', 11, 2, 6100.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (178, 'Bridgestone', 'Alenza', '215/60 R17', 'Car', 'Hyundai Creta,Kia Seltos,MG Astor', 7, 1, 9800.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (179, 'Michelin', 'Energy XM2+', '175/70 R14', 'Car', 'Maruti Swift Dzire,Hyundai Xcent,Tata Tigor', 16, 2, 5700.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (180, 'Michelin', 'Energy XM2+', '195/60 R15', 'Car', 'Honda City,Hyundai Verna,Maruti Ciaz', 9, 2, 6800.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (181, 'Michelin', 'Primacy 4', '215/60 R16', 'Car', 'Hyundai Creta,Kia Seltos,Maruti Grand Vitara', 8, 2, 9200.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (182, 'Michelin', 'Primacy 4', '225/55 R17', 'Car', 'Skoda Octavia,Volkswagen Tiguan,Jeep Compass', 5, 1, 10500.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (183, 'Michelin', 'Pilot Sport 4', '225/45 R17', 'Car', 'Volkswagen Jetta,Skoda Octavia,Mini Cooper', 4, 1, 11500.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (184, 'Goodyear', 'Assurance', '185/70 R14', 'Car', 'Maruti Swift Dzire,Tata Indica,Hyundai Xcent', 20, 3, 4600.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (185, 'Goodyear', 'Assurance', '195/60 R15', 'Car', 'Honda City,Hyundai Verna,Maruti Ciaz', 13, 2, 5500.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (186, 'Goodyear', 'EfficientGrip', '205/65 R15', 'Car', 'Toyota Innova,Maruti Ertiga,Kia Carens', 10, 2, 6700.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (187, 'Goodyear', 'EfficientGrip', '215/60 R16', 'Car', 'Hyundai Creta,Kia Seltos,Maruti Grand Vitara', 7, 1, 8100.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (188, 'Goodyear', 'Eagle F1', '225/45 R17', 'Car', 'Volkswagen Jetta,Skoda Octavia,Mini Cooper', 5, 1, 9800.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (189, 'Yokohama', 'Earth-1', '175/70 R14', 'Car', 'Maruti Swift Dzire,Hyundai Xcent,Tata Tigor', 19, 3, 5100.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (190, 'Yokohama', 'Earth-1', '195/60 R15', 'Car', 'Honda City,Hyundai Verna,Maruti Ciaz', 12, 2, 6200.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (191, 'Yokohama', 'Earth-1', '205/65 R15', 'Car', 'Toyota Innova,Maruti Ertiga,Kia Carens', 8, 2, 7200.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (192, 'Yokohama', 'Geolandar', '215/60 R17', 'Car', 'Hyundai Creta,Kia Seltos,MG Astor', 6, 1, 9300.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (193, 'Yokohama', 'Advan Sport', '225/45 R17', 'Car', 'Volkswagen Jetta,Skoda Octavia,Mini Cooper', 4, 1, 11000.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (194, 'JK Tyre', 'Blaze', '90/90-19', 'Bike', 'Royal Enfield Classic 350,Royal Enfield Bullet 350', 25, 4, 1650.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (195, 'JK Tyre', 'Blaze', '110/80-17', 'Bike', 'Bajaj Pulsar NS200,TVS Apache 200,Yamaha R15', 13, 3, 2100.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (196, 'JK Tyre', 'Jet X', '100/90-18', 'Bike', 'Royal Enfield Classic 350,Royal Enfield Bullet 350', 17, 3, 2250.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (197, 'JK Tyre', 'Vectra', '175/70 R14', 'Car', 'Maruti Swift Dzire,Hyundai Xcent,Tata Tigor', 22, 3, 4400.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (198, 'JK Tyre', 'Vectra', '205/65 R15', 'Car', 'Toyota Innova,Maruti Ertiga,Kia Carens', 9, 2, 5900.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (199, 'TVS Eurogrip', 'Protorq', '110/80-17', 'Bike', 'Bajaj Pulsar NS200,TVS Apache 200,Yamaha R15', 11, 3, 2550.00);
INSERT INTO public.inventory (product_id, brand, model, tyre_size, category, vehicle_compatibility, stock, daily_sales, price) VALUES (200, 'TVS Eurogrip', 'Duratrail', '120/90-17', 'Bike', 'Royal Enfield Classic 350,Royal Enfield Meteor 350', 7, 2, 2800.00);


--
-- PostgreSQL database dump complete
--

\unrestrict iif7lNlLW2ACvuLMfjsYcOwKbfI3Q1duCvLhhWonTpnezCl5Dz22X9LUpzG8sBa

