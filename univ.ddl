
CREATE TABLE BUILDINGAREA (
     TypeName varchar(255) NOT NULL,
     PRIMARY KEY(TypeName)
);
------------------------------------------------
--  DDL Statement for table XX
------------------------------------------------
CREATE TABLE DEPARTMENT (
     DepID SMALLINT NOT NULL,
     Name varchar(255),
     PRIMARY KEY(DepID)
);
------------------------------------------------
--  DDL Statement for table XX
------------------------------------------------
CREATE TABLE ENERGYRATES (
     Identifier SMALLINT NOT NULL,
     CostPerUnit  FLOAT,
     PRIMARY KEY(Identifier)
);

------------------------------------------------
--  DDL Statement for table XX
------------------------------------------------
CREATE TABLE ROOMTYPE (
     RoomTypeID SMALLINT NOT NULL,
     TypeName varchar(255),
     PRIMARY KEY(RoomTypeID)
);

------------------------------------------------
--  DDL Statement for table XX
------------------------------------------------
CREATE TABLE ROOMS (
     Identifier SMALLINT NOT NULL,
     RoomNumber SMALLINT,
     RoomTypeID SMALLINT,
     PRIMARY KEY(Identifier),
     FOREIGN KEY(RoomTypeID) REFERENCES ROOMTYPE(RoomTypeID)  on delete cascade
);



------------------------------------------------
--  DDL Statement for table XX
------------------------------------------------
CREATE TABLE RESEARCHGROUP (
     ID SMALLINT NOT NULL,
     Name varchar(255),
     MonthlyBudget INT,
     DepID SMALLINT,
     Identifier SMALLINT,
     PRIMARY KEY(ID),
     FOREIGN KEY(DepID) REFERENCES DEPARTMENT(DepID) on delete cascade,
     FOREIGN KEY(Identifier) REFERENCES ROOMS(Identifier) on delete cascade

);

------------------------------------------------
--  DDL Statement for table EMPLOYEE
------------------------------------------------
CREATE TABLE EMPLOYEE (
     EmployeeID SMALLINT NOT NULL,
     FirstName varchar(255),
     LastName varchar(255),
     Address varchar(255),
     Gender varchar(255),
     PhoneNumber INT,      
     YearsOfService SMALLINT,     
     DateOfBirth DATE,   
     Salary FLOAT,
     ID SMALLINT NOT NULL,
     DepID SMALLINT NOT NULL,
     PRIMARY KEY(EmployeeID),
     FOREIGN KEY(ID) REFERENCES RESEARCHGROUP(ID) on delete cascade,
     FOREIGN KEY(DepID) REFERENCES DEPARTMENT(DepID) on delete cascade
);


 
   


------------------------------------------------
--  DDL Statement for table XX
------------------------------------------------
CREATE TABLE BUILDING (
     Identifier SMALLINT NOT NULL,
     NumberOfRooms SMALLINT,
     NumberOfMeters SMALLINT,
     NumberOfFloors SMALLINT,    
     NAME varchar(255),
     EmployeeID SMALLINT,
     TypeName varchar(255),
     PRIMARY KEY(Identifier),
     FOREIGN KEY(EmployeeID) REFERENCES EMPLOYEE(EmployeeID) on delete cascade,
     FOREIGN KEY(TypeName) REFERENCES BUILDINGAREA(TypeName) on delete cascade
     
);


------------------------------------------------
--  DDL Statement for table XX
------------------------------------------------
CREATE TABLE METER (
     ID SMALLINT NOT NULL,
     Type varchar(255),
     UnitOfMeasurement varchar(255),
     TypeName varchar(255),
     Identifier SMALLINT,
     PRIMARY KEY(ID),
     FOREIGN KEY(TypeName) REFERENCES BUILDINGAREA(TypeName) on delete cascade,
     FOREIGN KEY(Identifier) REFERENCES ROOMS(Identifier) on delete cascade
     
);

---------------------------------

