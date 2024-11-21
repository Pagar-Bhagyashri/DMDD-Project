-- Inserting into Employee Table
INSERT INTO Employee (Employee_Name, Employee_Role, Department, Email, Phone, Hire_Date, Salary)
VALUES
('Alice Johnson', 'Tour Manager', 'Operations', 'alice@travelagency.com', '123-456-7890', '2015-05-01', 55000.00),
('Bob Smith', 'Transport Coordinator', 'Operations', 'bob@travelagency.com', '123-456-7891', '2016-06-15', 48000.00),
('Charlie Brown', 'Activity Coordinator', 'Operations', 'charlie@travelagency.com', '123-456-7892', '2017-07-20', 51000.00),
('David Williams', 'Customer Service Representative', 'Customer Support', 'david@travelagency.com', '123-456-7893', '2018-08-10', 40000.00),
('Eva Davis', 'Sales Executive', 'Sales', 'eva@travelagency.com', '123-456-7894', '2019-09-05', 60000.00),
('Fay Lee', 'Booking Coordinator', 'Operations', 'fay@travelagency.com', '123-456-7895', '2020-01-15', 45000.00),
('George Clark', 'Tour Guide', 'Operations', 'george@travelagency.com', '123-456-7896', '2018-12-25', 38000.00),
('Helen Evans', 'Marketing Specialist', 'Marketing', 'helen@travelagency.com', '123-456-7897', '2021-02-10', 47000.00),
('Ian Harris', 'Driver', 'Transport', 'ian@travelagency.com', '123-456-7898', '2022-06-01', 35000.00),
('Jack Miller', 'Chef', 'Meal Services', 'jack@travelagency.com', '123-456-7899', '2017-11-11', 42000.00),
('Kim Taylor', 'Manager', 'Customer Support', 'kim@travelagency.com', '123-456-7800', '2021-03-20', 50000.00),
('Laura Walker', 'Receptionist', 'Customer Support', 'laura@travelagency.com', '123-456-7801', '2020-04-15', 38000.00);


-- Inserting into Customer Table
INSERT INTO Customer (Employee_ID, [Name], Phone_Number, Email, Street_Address, City, [State], Zip_Code, Date_Of_Birth)
VALUES
(1, 'John Doe', '987-654-3210', 'john.doe@example.com', '123 Maple St.', 'New York', 'NY', '10001', '1985-01-15'),
(2, 'Jane Smith', '987-654-3211', 'jane.smith@example.com', '456 Oak St.', 'Los Angeles', 'CA', '90001', '1990-02-25'),
(3, 'Michael Johnson', '987-654-3212', 'michael.johnson@example.com', '789 Pine St.', 'Chicago', 'IL', '60001', '1987-05-30'),
(4, 'Sarah Brown', '987-654-3213', 'sarah.brown@example.com', '123 Birch St.', 'Houston', 'TX', '77001', '1992-07-20'),
(5, 'David Wilson', '987-654-3214', 'david.wilson@example.com', '456 Cedar St.', 'Miami', 'FL', '33101', '1988-12-10'),
(6, 'Emma Garcia', '987-654-3215', 'emma.garcia@example.com', '789 Willow St.', 'San Francisco', 'CA', '94101', '1993-04-18'),
(7, 'Daniel Lee', '987-654-3216', 'daniel.lee@example.com', '101 Elm St.', 'Dallas', 'TX', '75201', '1986-11-01'),
(8, 'Olivia Martinez', '987-654-3217', 'olivia.martinez@example.com', '202 Maple St.', 'Phoenix', 'AZ', '85001', '1991-08-22'),
(9, 'Ethan Perez', '987-654-3218', 'ethan.perez@example.com', '303 Birch St.', 'Seattle', 'WA', '98101', '1994-02-12'),
(10, 'Isabella Thomas', '987-654-3219', 'isabella.thomas@example.com', '404 Oak St.', 'San Diego', 'CA', '92101', '1989-10-05'),
(11, 'Alexander King', '987-654-3220', 'alexander.king@example.com', '505 Pine St.', 'Denver', 'CO', '80201', '1990-06-25'),
(12, 'Sophia Wright', '987-654-3221', 'sophia.wright@example.com', '606 Cedar St.', 'Portland', 'OR', '97201', '1992-09-15');


-- Inserting into Tour Table
INSERT INTO Tour (Name, Tour_Description, Duration, Price, Start_Date, End_Date)
VALUES
('Summer Adventure', 'A fun-filled summer tour exploring the great outdoors.', 7, 1500.00, '2024-06-01', '2024-06-07'),
('City Lights', 'A cultural city tour with visits to museums, theatres, and restaurants.', 5, 1200.00, '2024-07-15', '2024-07-19'),
('Beach Escape', 'A relaxing beach vacation with optional water activities.', 10, 2000.00, '2024-08-01', '2024-08-10'),
('Mountain Expedition', 'An exciting hiking and camping expedition in the mountains.', 6, 1800.00, '2024-09-01', '2024-09-06'),
('Luxury Retreat', 'A luxurious spa retreat for relaxation and rejuvenation.', 4, 2500.00, '2024-10-10', '2024-10-13'),
('Wildlife Safari', 'A thrilling wildlife safari with wildlife sightings and outdoor adventures.', 7, 2200.00, '2024-11-01', '2024-11-07'),
('European Wonders', 'A grand tour across major European cities, including Paris, Rome, and London.', 14, 5000.00, '2024-12-01', '2024-12-14'),
('Desert Oasis', 'A unique desert tour with sand dune safaris and cultural experiences.', 8, 1700.00, '2025-01-10', '2025-01-17'),
('Tropical Adventure', 'A tropical tour including island hopping and beach relaxation.', 9, 2300.00, '2025-02-01', '2025-02-09'),
('Historical Exploration', 'A deep dive into ancient civilizations and historical landmarks.', 12, 3000.00, '2025-03-01', '2025-03-12'),
('Winter Wonderland', 'A winter tour to enjoy skiing, snowboarding, and cozy winter activities.', 7, 2100.00, '2025-04-01', '2025-04-07'),
('Cultural Immersion', 'An in-depth cultural experience with local crafts, food, and festivals.', 6, 1600.00, '2025-05-01', '2025-05-06');


-- Inserting into Tour_Employee Table
INSERT INTO Tour_Employee (Employee_ID, Tour_ID)
VALUES
(1, 1), -- Alice Johnson (Tour Manager) for Summer Adventure
(2, 2), -- Bob Smith (Transport Coordinator) for City Lights
(3, 3), -- Charlie Brown (Activity Coordinator) for Beach Escape
(4, 4), -- David Williams (Customer Service) for Mountain Expedition
(5, 5), -- Eva Davis (Sales Executive) for Luxury Retreat
(6, 6), -- Fay Lee (Booking Coordinator) for Wildlife Safari
(7, 7), -- George Clark (Tour Guide) for European Wonders
(8, 8), -- Helen Evans (Marketing Specialist) for Desert Oasis
(9, 9), -- Ian Harris (Driver) for Tropical Adventure
(10, 10), -- Jack Miller (Chef) for Historical Exploration
(11, 11), -- Kim Taylor (Manager) for Winter Wonderland
(12, 12); -- Laura Walker (Receptionist) for Cultural Immersion

INSERT INTO Vendor (Employee_ID, Vendor_Name, Vendor_Contact, Vendor_Type)
VALUES
(1, 'Luxury Hotels', 'contact@luxuryhotels.com', 'Accommodation'),
(2, 'Car Rentals Inc.', 'contact@carrentals.com', 'Transport'),
(3, 'Gourmet Meals Ltd.', 'contact@gourmetmeals.com', 'Meal'),
(4, 'Adventure Tours Co.', 'contact@adventuretours.com', 'Activity'),
(5, 'Beach Resorts', 'contact@beachresorts.com', 'Accommodation'),
(6, 'City Buses Ltd.', 'contact@citybuses.com', 'Transport'),
(7, 'Global Foods', 'contact@globalfoods.com', 'Meal'),
(8, 'Mountain Guides', 'contact@mountainguides.com', 'Activity'),
(9, 'Urban Escapes', 'contact@urbanescapes.com', 'Activity'),
(10, 'Tropical Retreats', 'contact@tropicalretreats.com', 'Accommodation'),
(11, 'Helicopter Adventures', 'contact@helicopteradventures.com', 'Activity'),
(12, 'Safari Expeditions', 'contact@safariexpeditions.com', 'Activity');


INSERT INTO Service (Vendor_ID, Service_Name, Service_Price, Service_Availability, Service_Type)
VALUES
(1, 'Deluxe Room', 150.00, 'Available', 'Accommodation'),
(1, 'Standard Room', 100.00, 'Available', 'Accommodation'),
(2, 'Private Car Service', 50.00, 'Available', 'Transport'),
(2, 'Luxury Van', 120.00, 'Available', 'Transport'),
(2, 'Bus Charter', 300.00, 'Available', 'Transport'),
(3, 'Gourmet Dinner', 20.00, 'Available', 'Meal'),
(3, 'Lunch Buffet', 15.00, 'Available', 'Meal'),
(3, 'Continental Breakfast', 10.00, 'Available', 'Meal'),
(4, 'Yoga Session', 30.00, 'Available', 'Activity'),
(4, 'Hiking Tour', 50.00, 'Available', 'Activity'),
(4, 'Scuba Diving', 150.00, 'Available', 'Activity'),
(5, 'Sightseeing Tour', 40.00, 'Available', 'Activity'),
(5, 'City Walking Tour', 20.00, 'Available', 'Activity'),
(6, 'Helicopter Ride', 250.00, 'Available', 'Activity'),
(6, 'Fishing Trip', 80.00, 'Available', 'Activity');


--These are the specialized tables from SERVICE table and therefore there are same number of records in the Service 
INSERT INTO Accommodation (Service_ID, Room_Type)
VALUES
(1, 'Deluxe Room'),
(2, 'Standard Room');


INSERT INTO Transportation (Service_ID, Vehicle_Model, Vehicle_Capacity)
VALUES
(3, 'Private Car', 4),
(4, 'Luxury Van', 12),
(5, 'Charter Bus', 50);


INSERT INTO Meal (Service_ID, Meal_Type, Cuisine_Type)
VALUES
(6, 'Gourmet Dinner', 'Italian'),
(7, 'Lunch Buffet', 'International'),
(8, 'Continental Breakfast', 'Continental');

INSERT INTO Activity (Service_ID, Activity_Name, Activity_Type, Activity_Duration)
VALUES
(9, 'Yoga Session', 'Wellness', 1),
(10, 'Hiking Tour', 'Adventure', 5),
(11, 'Scuba Diving', 'Adventure', 3),
(12, 'Sightseeing Tour', 'Leisure', 4),
(13, 'City Walking Tour', 'Leisure', 2),
(14, 'Helicopter Ride', 'Adventure', 5),
(15, 'Fishing Trip', 'Leisure', 6);
-- End of Specialized tables 

--In the below table the booking total cost will be equivalent to the Tour Price exculding the services cost
INSERT INTO Booking (Employee_ID, Customer_ID, Tour_ID, Booking_Date, Total_Cost)
VALUES
(1, 1, 1, '2024-06-01', 1500.00),  -- John Doe's booking for Summer Adventure
(2, 2, 2, '2024-07-10', 1600.00),  -- Jane Smith's booking for Winter Escape
(3, 3, 3, '2024-08-01', 1800.00),  -- Michael Johnson's booking for City Lights
(4, 4, 4, '2024-09-05', 2000.00),  -- Sarah Brown's booking for Tropical Retreat
(5, 5, 5, '2024-10-10', 1700.00),  -- David Wilson's booking for Desert Adventure
(6, 6, 6, '2024-11-01', 2100.00),  -- Emma Lewis's booking for Northern Lights
(7, 7, 7, '2024-12-01', 1900.00),  -- Jacob Miller's booking for Cultural Discovery
(8, 8, 8, '2025-01-10', 2200.00),  -- Olivia Davis's booking for Mountain Trek
(9, 9, 9, '2025-02-01', 2300.00),  -- Aiden Martinez's booking for Mediterranean Cruise
(10, 10, 10, '2025-03-01', 2400.00), -- Mia Anderson's booking for Safari Adventure
(11, 11, 11, '2025-04-01', 2500.00), -- Liam Taylor's booking for Cultural Heritage
(12, 12, 12, '2025-05-01', 2600.00); -- Noah Thomas's booking for Amazon Rainforest

--In this we are calculation each service cost made by the customer in the booking 
INSERT INTO Booking_Service (Booking_ID, Service_ID, Quantity, Total_service_cost, Check_In_Date, Check_Out_Date)
VALUES
(1, 1, 5, 750.00, '2024-06-01', '2024-06-06'),  -- John Doe's booking for 5 Deluxe Rooms
(1, 2, 5, 250.00, '2024-06-01', '2024-06-06'),  -- John Doe's booking for 5 Private Cars
(1, 3, 10, 200.00, '2024-06-01', '2024-06-06'), -- John Doe's booking for 10 Gourmet Dinners
(2, 1, 3, 300.00, '2024-07-10', '2024-07-15'),  -- Jane Smith's booking for 3 Standard Rooms
(2, 2, 4, 480.00, '2024-07-10', '2024-07-15'),  -- Jane Smith's booking for 4 Luxury Vans
(2, 3, 8, 120.00, '2024-07-10', '2024-07-15'),  -- Jane Smith's booking for 8 Lunch Buffets
(3, 1, 4, 600.00, '2024-08-01', '2024-08-06'),  -- Michael Johnson's booking for 4 Deluxe Rooms
(3, 2, 4, 200.00, '2024-08-01', '2024-08-06'),  -- Michael Johnson's booking for 4 Private Cars
(3, 3, 5, 100.00, '2024-08-01', '2024-08-06'),  -- Michael Johnson's booking for 5 Gourmet Dinners
(4, 1, 2, 300.00, '2024-09-05', '2024-09-10'),  -- Sarah Brown's booking for 2 Deluxe Rooms
(4, 2, 2, 240.00, '2024-09-05', '2024-09-10'),  -- Sarah Brown's booking for 2 Luxury Vans
(4, 4, 3, 90.00, '2024-09-05', '2024-09-10'),   -- Sarah Brown's booking for 3 Yoga Sessions
(5, 1, 3, 450.00, '2024-10-10', '2024-10-15'),  -- David Wilson's booking for 3 Standard Rooms
(5, 2, 2, 240.00, '2024-10-10', '2024-10-15'),  -- David Wilson's booking for 2 Private Cars
(5, 7, 4, 80.00, '2024-10-10', '2024-10-15');   -- David Wilson's booking for 4 Lunch Buffets


--Here the final amount for the booking is calculated Tourprice+(addition of service price)= Billing Amount
INSERT INTO Billing (Booking_ID, Billing_Amount, Billing_Date, Payment_Status)
VALUES
(1, 2700.00, '2024-06-01', 'Pending'),   -- John Doe's Summer Adventure (1500.00 + 750.00 + 250.00 + 200.00)
(2, 2320.00, '2024-07-10', 'Completed'), -- Jane Smith's Winter Escape (1600.00 + 300.00 + 480.00 + 120.00)
(3, 2100.00, '2024-08-01', 'Failed'),    -- Michael Johnson's City Lights (1800.00 + 400.00 + 200.00 + 100.00)
(4, 2630.00, '2024-09-05', 'Pending'),   -- Sarah Brown's Tropical Retreat (2000.00 + 300.00 + 240.00 + 90.00)
(5, 2520.00, '2024-10-10', 'Completed'), -- David Wilson's Desert Adventure (1700.00 + 450.00 + 240.00 + 80.00)
(6, 2680.00, '2024-11-01', 'Pending'),   -- Emma Lewis's Northern Lights (2100.00 + 300.00 + 240.00 + 40.00)
(7, 2750.00, '2024-12-01', 'Completed'), -- Jacob Miller's Cultural Discovery (1900.00 + 600.00 + 200.00 + 50.00)
(8, 2920.00, '2025-01-10', 'Pending'),   -- Olivia Davis's Mountain Trek (2200.00 + 500.00 + 200.00 + 20.00)
(9, 2950.00, '2025-02-01', 'Completed'), -- Aiden Martinez's Mediterranean Cruise (2300.00 + 600.00 + 240.00 + 40.00)
(10, 2980.00, '2025-03-01', 'Pending'),  -- Mia Anderson's Safari Adventure (2400.00 + 600.00 + 240.00 + 40.00)
(11, 3270.00, '2025-04-01', 'Completed'), -- Liam Taylor's Cultural Heritage (2500.00 + 600.00 + 240.00 + 50.00)
(12, 3380.00, '2025-05-01', 'Pending');  -- Noah Thomas's Amazon Rainforest (2600.00 + 600.00 + 240.00 + 40.00)