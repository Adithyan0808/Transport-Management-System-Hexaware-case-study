create table vehicles(
	vehicleID int identity primary key,
	model varchar(255),
	capacity decimal(10,2),
	type varchar(50),
	status varchar(50)
)

create table routes(
	routeID int identity primary key,
	startDestination varchar(255),
	endDestination varchar(255),
	distance decimal(10,2)
)

create table trips(
	tripID int identity primary key,
	vehicleID int foreign key references vehicles(vehicleID),
	routeID int foreign key references routes(routeID),
	departureDate datetime,
	arrivalDate datetime,
	status varchar(50),
	tripType varchar(50) default 'Freight',
	maxPassengers int
)


create table passengers(
	passengerID int identity primary key,
	firstName varchar(255),
	gender varchar(255),
	age int,
	email varchar(255) unique,
	phoneNumber varchar(50)
)


create table bookings(
	bookingID int identity primary key,
	tripID int foreign key references trips(tripID),
	passengerID int foreign key references passengers(passengerID),
	bookingDate datetime,
	status varchar(50)
)

INSERT INTO Vehicles (Model, Capacity, Type, Status)
VALUES
('Mercedes Sprinter', 15.50, 'Van', 'Available'),
('Volvo 9700', 50.00, 'Bus', 'On Trip'),
('Freightliner Cascadia', 20.00, 'Truck', 'Maintenance');


INSERT INTO Routes (StartDestination, EndDestination, Distance)
VALUES
('New York', 'Boston', 215.30),
('San Francisco', 'Los Angeles', 380.00),
('Chicago', 'Detroit', 280.50);

INSERT INTO Trips (VehicleID, RouteID, departureDate, ArrivalDate, Status, TripType, MaxPassengers)
VALUES
(1, 1, '2024-11-15 08:00:00', '2024-11-15 12:00:00', 'Scheduled', 'Passenger', 15),
(2, 2, '2024-11-16 09:00:00', '2024-11-16 17:00:00', 'In Progress', 'Passenger', 50),
(3, 3, '2024-11-18 07:00:00', '2024-11-18 14:00:00', 'Completed', 'Freight', NULL);

INSERT INTO Passengers (FirstName, Gender, Age, Email, PhoneNumber)
VALUES
('Alice Johnson', 'Female', 28, 'alice.johnson@example.com', '555-123-4567'),
('Bob Smith', 'Male', 35, 'bob.smith@example.com', '555-987-6543'),
('Eve Davis', 'Female', 24, 'eve.davis@example.com', '555-456-7890');


INSERT INTO Bookings (TripID, passengerID, BookingDate, Status)
VALUES
(1, 1, '2024-11-10 10:00:00', 'Confirmed'),
(2, 2, '2024-11-11 14:30:00', 'Cancelled'),
(3, 3, '2024-11-12 09:00:00', 'Completed');

