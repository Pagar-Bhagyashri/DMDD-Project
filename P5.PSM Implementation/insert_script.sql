INSERT INTO Employee (Employee_Name, Employee_Role, Department, Email, Phone, Hire_Date, Salary) VALUES
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
('Laura Walker', 'Receptionist', 'Customer Support', 'laura@travelagency.com', '123-456-7801', '2020-04-15', 38000.00),
('Rachel Green', 'Senior Tour Coordinator', 'Operations', 'rachel@travelagency.com', '123-456-7902', '2016-03-15', 58000.00),
('Monica Geller', 'Catering Manager', 'Meal Services', 'monica@travelagency.com', '123-456-7903', '2017-09-10', 52000.00),
('Chandler Bing', 'IT Specialist', 'Technology', 'chandler@travelagency.com', '123-456-7904', '2019-11-20', 65000.00),
('Phoebe Buffay', 'Wellness Coordinator', 'Customer Experience', 'phoebe@travelagency.com', '123-456-7905', '2020-05-05', 47000.00),
('Ross Geller', 'Tour Researcher', 'Product Development', 'ross@travelagency.com', '123-456-7906', '2018-07-12', 56000.00),
('Joey Tribbiani', 'Transport Manager', 'Operations', 'joey@travelagency.com', '123-456-7907', '2017-04-22', 54000.00),
('Emma Watson', 'Customer Service Lead', 'Customer Experience', 'emma@travelagency.com', '123-456-7908', '2019-08-15', 48000.00),
('Mike Hannigan', 'Activities Coordinator', 'Operations', 'mike@travelagency.com', '123-456-7909', '2021-01-10', 46000.00),
('Carol Willick', 'Marketing Manager', 'Marketing', 'carol@travelagency.com', '123-456-7910', '2018-11-30', 62000.00),
('Richard Burke', 'Finance Director', 'Finance', 'richard@travelagency.com', '123-456-7911', '2016-06-25', 75000.00),
('Gunther Smith', 'Accommodation Manager', 'Operations', 'gunther@travelagency.com', '123-456-7912', '2020-03-18', 51000.00);


INSERT INTO Customer (Employee_ID, Name, Phone_Number, Email, Street_Address, City, State, Zip_Code, Date_Of_Birth) VALUES 
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
(12, 'Sophia Wright', '987-654-3221', 'sophia.wright@example.com', '606 Cedar St.', 'Portland', 'OR', '97201', '1992-09-15'),
(13, 'Emily Watson', '987-654-3222', 'emily.watson@example.com', '707 Maple Lane', 'Atlanta', 'GA', '30301', '1993-03-17'),
(14, 'Ryan Thompson', '987-654-3223', 'ryan.thompson@example.com', '808 River Road', 'Boston', 'MA', '02101', '1988-11-22'),
(15, 'Sophia Rodriguez', '987-654-3224', 'sophia.rodriguez@example.com', '909 Mountain View', 'Las Vegas', 'NV', '89101', '1991-06-30'),
(16, 'Lucas Chen', '987-654-3225', 'lucas.chen@example.com', '1010 Ocean Drive', 'Honolulu', 'HI', '96801', '1995-01-25'),
(17, 'Emma Nakamura', '987-654-3226', 'emma.nakamura@example.com', '1111 Forest Path', 'New Orleans', 'LA', '70101', '1990-09-12');


INSERT INTO Tour (Name, Tour_Description, Duration, Price, Start_Date, End_Date) VALUES
('Summer Adventure', 'A fun-filled summer tour exploring the great outdo...', 7, 1500.00, '2024-11-15', '2024-11-18'),
('City Lights', 'A cultural city tour with visits to museums, theatres...', 5, 1200.00, '2024-11-17', '2024-11-21'),
('Beach Escape', 'A relaxing beach vacation with optional water acti...', 10, 2000.00, '2024-11-19', '2024-11-25'),
('Mountain Expedition', 'An exciting hiking and camping expedition in the ...', 6, 1800.00, '2024-11-19', '2024-11-23'),
('Luxury Retreat', 'A luxurious spa retreat for relaxation and rejuvena...', 4, 2500.00, '2024-11-19', '2024-11-22'),
('Wildlife Safari', 'A thrilling wildlife safari with wildlife sightings and ...', 7, 2200.00, '2024-11-19', '2024-11-24'),
('European Wonders', 'A grand tour across major European cities, includ...', 14, 5000.00, '2024-11-19', '2024-11-28'),
('Desert Oasis', 'A unique desert tour with sand dune safaris and c...', 8, 1700.00, '2024-11-19', '2024-11-25'),
('Tropical Adventure', 'A tropical tour including island hopping and beac...', 9, 2300.00, '2024-11-19', '2024-11-26'),
('Historical Exploration', 'A deep dive into ancient civilizations and historica...', 12, 3000.00, '2024-11-19', '2024-11-27'),
('Winter Wonderland', 'A winter tour to enjoy skiing, snowboarding, and c...', 7, 2100.00, '2024-11-25', '2024-12-01'),
('Cultural Immersion', 'An in-depth cultural experience with local crafts, f...', 6, 1600.00, '2024-11-28', '2024-12-03'),
('Arctic Expedition', 'A thrilling journey through the Arctic wilderness an...', 8, 3500.00, '2024-12-01', '2024-12-08'),
('Silk Road Adventure', 'An epic journey tracing the historic Silk Road tradi...', 15, 4800.00, '2024-12-05', '2024-12-19'),
('Amazon Rainforest Expedition', 'An immersive exploration of the world''s largest tr...', 10, 3200.00, '2024-12-10', '2024-12-19'),
('Zen and Wellness Retreat', 'A holistic journey focusing on mental and physical...', 6, 2800.00, '2024-12-15', '2024-12-20'),
('Culinary World Tour', 'A gastronomic adventure exploring global cuisine...', 12, 3600.00, '2024-12-20', '2024-12-31');


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

INSERT INTO Vendor (Employee_ID, Vendor_Name, Vendor_Contact, Vendor_Type) VALUES
(1,'Luxury Hotels', 'contact@luxuryhotels.com', 'Accommodation'),
(2,'Car Rentals Inc.', 'contact@carrentals.com', 'Transport'),
(3,'Gourmet Meals Ltd.', 'contact@gourmetmeals.com', 'Meal'),
(4,'Adventure Tours Co.', 'contact@adventuretours.com', 'Activity'),
(5,'Beach Resorts', 'contact@beachresorts.com', 'Accommodation'),
(6,'City Buses Ltd.', 'contact@citybuses.com', 'Transport'),
(7,'Global Foods', 'contact@globalfoods.com', 'Meal'),
(8,'Mountain Guides', 'contact@mountainguides.com', 'Activity'),
(9,'Urban Escapes', 'contact@urbanescapes.com', 'Activity'),
(10,'Tropical Retreats', 'contact@tropicalretreats.com', 'Accommodation'),
(11,'Helicopter Adventures', 'contact@helicopteradventures.com', 'Activity'),
(12,'Safari Expeditions', 'contact@safariexpeditions.com', 'Activity'),
(13,'Arctic Lodges', 'contact@arcticlodges.com', 'Accommodation'),
(14,'Silk Road Travels', 'contact@silkroadtravels.com', 'Transport'),
(15,'Amazon Expeditions', 'contact@amazonexpeditions.com', 'Activity'),
(16,'Wellness Retreats', 'contact@wellnessretreats.com', 'Accommodation'),
(17,'Global Cuisine Experiences', 'contact@globalcuisine.com', 'Meal');

INSERT INTO Service (Vendor_ID, Service_Name, Service_Price, Service_Availability, Service_Type) VALUES
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
(6, 'Fishing Trip', 80.00, 'Available', 'Activity'),
(13, 'Igloo Accommodation', 200.00, 'Available', 'Accommodation'),
(13, 'Arctic Camping', 100.00, 'Available', 'Accommodation'),
(14, 'Camel Caravan Tour', 150.00, 'Available', 'Transport'),
(14, 'Luxury Train Passage', 300.00, 'Available', 'Transport'),
(15, 'Rainforest Canopy Walk', 80.00, 'Available', 'Activity'),
(15, 'Indigenous Tribe Experience', 120.00, 'Available', 'Activity'),
(16, 'Meditation Retreat', 150.00, 'Available', 'Activity'),
(16, 'Yoga and Wellness Workshop', 100.00, 'Available', 'Activity'),
(17, 'Cooking Master Class', 200.00, 'Available', 'Meal'),
(17, 'Local Market Food Tour', 75.00, 'Available', 'Meal');

INSERT INTO Accommodation (Service_ID, Room_Type) VALUES
(1, 'Deluxe Room'),
(2, 'Standard Room'), 
(16, 'Igloo'),
(17, 'Camping Site');


INSERT INTO Meal (Service_ID, Meal_Type, Cuisine_Type) VALUES
(6, 'Gourmet Dinner', 'Italian'),
(7, 'Lunch Buffet', 'International'),
(8, 'Continental Breakfast', 'Continental');


INSERT INTO Activity (Service_ID, Activity_Name, Activity_Type, Activity_Duration) VALUES
(9, 'Yoga Session', 'Wellness', 1),
(10, 'Hiking Tour', 'Adventure', 2),
(11, 'Scuba Diving', 'Adventure', 3),
(12, 'Sightseeing Tour', 'Leisure', 4),
(13, 'City Walking Tour', 'Leisure', 2),
(14, 'Helicopter Ride', 'Adventure', 5),
(15, 'Fishing Trip', 'Leisure', 6),
(20, 'Rainforest Canopy Walk', 'Adventure', 3),
(21, 'Indigenous Tribe Experience', 'Cultural', 4),
(22, 'Meditation Retreat', 'Wellness', 2),
(23, 'Yoga Workshop', 'Wellness', 1);

INSERT INTO Transportation (Service_ID, Vehicle_Model, Vehicle_Capacity) VALUES
(3, 'Private Car', 4),
(4, 'Luxury Van', 12),
(5, 'Charter Bus', 50),
(18, 'Camel Caravan', 10),
(19, 'Luxury Train', 200);



INSERT INTO Booking (Employee_ID, Customer_ID, Tour_ID, Booking_Date, Total_Cost) VALUES 
(1, 1, 1, '2024-06-01', 1500.00),
(2, 2, 2, '2024-07-10', 1600.00),
(3, 3, 3, '2024-08-01', 1800.00),
(4, 4, 4, '2024-09-05', 2000.00),
(5, 5, 5, '2024-10-10', 1700.00),
(6, 6, 6, '2024-11-01', 2100.00),
(7, 7, 7, '2024-12-01', 1900.00),
(8, 8, 8, '2025-01-10', 2200.00),
(9, 9, 9, '2025-02-01', 2300.00),
(10, 10, 10, '2025-03-01', 2400.00),
(11, 11, 11, '2025-04-01', 2500.00),
(12, 12, 12, '2025-05-01', 2600.00),
(13, 13, 13, '2025-06-10', 3500.00),
(14, 14, 14, '2025-07-15', 4800.00),
(15, 15, 15, '2025-08-20', 3200.00),
(16, 16, 16, '2025-09-25', 2800.00),
(17, 17, 17, '2025-10-30', 3600.00),
(18, 1, 5, '2024-11-15', 2500.00),
(19, 1, 8, '2024-12-01', 1700.00),
(20, 3, 2, '2024-11-20', 1200.00),
(21, 3, 7, '2024-12-05', 5000.00),
(22, 5, 1, '2024-11-25', 1500.00),
(23, 5, 4, '2024-12-10', 1800.00);



INSERT INTO Booking_Service (Booking_ID, Service_ID, Quantity, Total_service_cost, Check_In_Date, Check_Out_Date) VALUES
(1, 1, 5, 750.00, '2024-06-01', '2024-06-06'),   -- John Doe's booking for 5 Deluxe Rooms
(1, 2, 5, 250.00, '2024-06-01', '2024-06-06'),  -- John Doe's booking for 5 Private Cars
(1, 3, 10, 200.00, '2024-06-01', '2024-06-06'),-- John Doe's booking for 10 Gourmet Dinners
(2, 1, 3, 300.00, '2024-07-10', '2024-07-15'),
(2, 2, 4, 480.00, '2024-07-10', '2024-07-15'),
(2, 3, 8, 120.00, '2024-07-10', '2024-07-15'),
(3, 1, 4, 600.00, '2024-08-01', '2024-08-06'),
(3, 2, 4, 200.00, '2024-08-01', '2024-08-06'),
(3, 3, 5, 100.00, '2024-08-01', '2024-08-06'),
(4, 1, 2, 300.00, '2024-09-05', '2024-09-10'),
(4, 2, 2, 240.00, '2024-09-05', '2024-09-10'),
(4, 4, 3, 90.00, '2024-09-05', '2024-09-10'),
(5, 1, 3, 450.00, '2024-10-10', '2024-10-15'),
(5, 2, 2, 240.00, '2024-10-10', '2024-10-15'),
(5, 7, 4, 80.00, '2024-10-10', '2024-10-15'),
(13, 16, 3, 600.00, '2025-06-15', '2025-06-22'),
(13, 20, 2, 160.00, '2025-06-15', '2025-06-22'),
(14, 18, 4, 600.00, '2025-07-20', '2025-08-04'),
(14, 25, 2, 400.00, '2025-07-20', '2025-08-04'),
(15, 19, 2, 600.00, '2025-09-05', '2025-09-14'),
(15, 21, 3, 360.00, '2025-09-05', '2025-09-14'),
(16, 22, 4, 600.00, '2025-10-20', '2025-10-25'),
(16, 23, 2, 200.00, '2025-10-20', '2025-10-25'),
(17, 25, 2, 400.00, '2025-11-10', '2025-11-21'),
(19, 16, 3, 600.00, '2025-06-15', '2025-06-22'),
(19, 20, 2, 160.00, '2025-06-15', '2025-06-22'),
(20, 18, 4, 600.00, '2025-07-20', '2025-08-04'),
(20, 25, 2, 150.00, '2025-07-20', '2025-08-04'),
(21, 21, 3, 360.00, '2025-09-05', '2025-09-14'),
(22, 19, 2, 600.00, '2025-09-05', '2025-09-14'),
(22, 22, 4, 600.00, '2025-10-20', '2025-10-25'),
(22, 23, 2, 200.00, '2025-10-20', '2025-10-25'),
(23, 24, 2, 400.00, '2025-11-10', '2025-11-21'),
(23, 25, 2, 150.00, '2025-11-10', '2025-11-21');


INSERT INTO Billing (Booking_ID, Billing_Amount, Billing_Date, Payment_Status) VALUES
(1,2700.00, '2024-06-01', 'Pending'),  -- John Doe's Summer Adventure (1500.00 + 750.00 + 250.00 + 200.00)
(2,2320.00, '2024-07-10', 'Completed'),
(3,2100.00, '2024-08-01', 'Failed'),
(4,2630.00, '2024-09-05', 'Pending'),
(5,2520.00, '2024-10-10', 'Completed'),
(6,2680.00, '2024-11-01', 'Pending'),
(7,2750.00, '2024-12-01', 'Completed'),
(8,2920.00, '2025-01-10', 'Pending'),
(9,2950.00, '2025-02-01', 'Completed'),
(10,2980.00, '2025-03-01', 'Pending'),
(11,3270.00, '2025-04-01', 'Completed'),
(12,3380.00, '2025-05-01', 'Pending'),
(13,4260.00, '2025-06-10', 'Completed'),
(14,5800.00, '2025-07-15', 'Pending'),
(15,4160.00, '2025-08-20', 'Completed'),
(16,3600.00, '2025-09-25', 'Pending'),
(17,164000.00, '2025-10-30', 'Completed'),
(19,3260.00, '2024-11-15', 'Completed'),
(20,2450.00, '2024-12-01', 'Pending'),
(21,1560.00, '2024-11-20', 'Completed'),
(22,6400.00, '2024-12-05', 'Pending'),
(23,2050.00, '2024-11-25', 'Completed');