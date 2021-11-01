-- create the database
DROP DATABASE IF EXISTS ap;
CREATE DATABASE ap;

-- select the database
USE ap;

-- create the tables
CREATE TABLE tattooStyles
(
  TattooStylesID		CHAR(50) 	PRIMARY KEY,
  TattooArtistID		INT 		not null,
  CustomerID 			INT 		not null,
  Japanese 				INT,
  Traditional			INT,
  BlackWhite			INT,
  NeoTraditional		INT,
  Tribal				INT,
  Blackwork				INT

);

CREATE TABLE market_dept
(
  Market_DeptID			INT 		PRIMARY KEY 		auto_increment,
  CustomerID			INT 		not null,
  OwnerID 				INT 		not null,
  SocialMedia 			INT,
  ApparelM				INT,
  ApparelW				INT

);

CREATE TABLE customer
(
  CustomerID	        INT            not null 		 PRIMARY KEY 		auto_increment,
  CustomerFName			CHAR(25)       not null,
  CustomerLName			CHAR(25)	   not null,
  CustomerDOB			DATE	   	   not null,
  Market_DeptID			INT 		   not null,
  TattooStylesID		CHAR(50)       not null,
  CONSTRAINT TattooStyleID_CustFK
    FOREIGN KEY (TattooStylesID)
    REFERENCES tattooStyles(TattooStylesID),
  CONSTRAINT Market_DeptID_CustFK
    FOREIGN KEY (Market_DeptID)
    REFERENCES market_dept(Market_DeptID)
);

CREATE TABLE tattooArtist
(
  TattooArtistID	INT 			PRIMARY KEY 		auto_increment,
  TattooStylesID 	CHAR(50) 		not null,
  ArtistFName		CHAR(25) 		not null,
  ArtistLName 		CHAR(25) 		not null,
  TattooArtistHours INT 			not null,
  CustomerCom 		INT 			not null,
  CONSTRAINT TattooStylesID_TAFK
    FOREIGN KEY (TattooStylesID)
    REFERENCES tattoostyles(TattooStylesID)
);

CREATE TABLE payment
(
  PaymentID			INT 			PRIMARY KEY 		auto_increment,
  TattooArtistID 	INT 			not null,
  CustomerID 		INT 			not null,
  PaymentTotal 		DECIMAL(9,2)	not null,
  CONSTRAINT CustomerID_PayFK
    FOREIGN KEY (CustomerID)
    REFERENCES customer(CustomerID),
  CONSTRAINT TattooArtistID_PayFK
    FOREIGN KEY (TattooArtistID)
    REFERENCES tattooArtist(TattooArtistID)
);

CREATE TABLE management
(
  OwnerID				INT 		PRIMARY KEY 		auto_increment,
  Market_DeptID			INT 		not null,
  Secretary 			CHAR(50),
  Finance_Dept			INT,
  CONSTRAINT Market_Dept_ManFK
    FOREIGN KEY (Market_DeptID)
    REFERENCES market_dept(Market_DeptID)

);

CREATE TABLE store
(
  StoreID				INT 		PRIMARY KEY 		auto_increment,
  OwnerID 				INT 		not null,
  StoreName 			CHAR(50),
  StoreLocation			CHAR(50),
  StoreAddy				VARCHAR(50),
  StoreHours			INT,
  CONSTRAINT OwnerID_SFK
    FOREIGN KEY (OwnerID)
    REFERENCES management(OwnerID)

);

CREATE TABLE artistStore
(
  ArtistStoreID			INT 		PRIMARY KEY 		auto_increment,
  TattooArtistID		INT 		not null,
  StoreID 				INT 		not null,
  ArtistLocation 		INT,
  CONSTRAINT TattooArtistID_ARTSFK
    FOREIGN KEY (TattooArtistID)
    REFERENCES tattooArtist(TattooArtistID),
  CONSTRAINT StoreID_ARTSFK
    FOREIGN KEY (StoreID)
    REFERENCES store(StoreID)

);