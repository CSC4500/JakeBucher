-- create the database
DROP DATABASE IF EXISTS ap;
CREATE DATABASE ap;

-- select the database
USE ap;

-- create the tables
CREATE TABLE tattooStyles
(
  TattooStylesID		CHAR(50) 		PRIMARY KEY,
  TattooArtistID		VARCHAR(50) 	not null,
  CustomerID 			VARCHAR(50) 	not null

);

CREATE TABLE market_dept
(
  Market_DeptID			CHAR(25) 		PRIMARY KEY,
  CustomerID			VARCHAR(50) 	not null,
  OwnerID 				VARCHAR(25) 	not null,
  SocialMedia 			VARCHAR(100),
  ApparelM				CHAR(25),
  ApparelW				CHAR(25)

);

CREATE TABLE customer
(
  CustomerID	        VARCHAR(50)    not null 		 PRIMARY KEY,
  CustomerFName			CHAR(25)       not null,
  CustomerLName			CHAR(25)	   not null,
  CustomerDOB			DATE	   	   not null,
  Market_DeptID			CHAR(25) 	   not null,
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
  TattooArtistID	VARCHAR(50) 	PRIMARY KEY,
  TattooStylesID 	CHAR(50) 		not null,
  ArtistFName		CHAR(25) 		not null,
  ArtistLName 		CHAR(25) 		not null,
  TattooArtistHours VARCHAR(25)		not null,
  CustomerCom 		VARCHAR(1000) 	not null,
  CONSTRAINT TattooStylesID_TAFK
    FOREIGN KEY (TattooStylesID)
    REFERENCES tattoostyles(TattooStylesID)
);

CREATE TABLE payment
(
  PaymentID			INT 			PRIMARY KEY 		auto_increment,
  TattooArtistID 	VARCHAR(50) 	not null,
  CustomerID 		VARCHAR(50) 	not null,
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
  OwnerID				VARCHAR(25) 		PRIMARY KEY,
  Market_DeptID			CHAR(25) 			not null,
  Secretary 			CHAR(50),
  Finance_Dept			CHAR(50),
  CONSTRAINT Market_Dept_ManFK
    FOREIGN KEY (Market_DeptID)
    REFERENCES market_dept(Market_DeptID)

);

CREATE TABLE store
(
  StoreID				VARCHAR(25) 		PRIMARY KEY,
  OwnerID 				VARCHAR(25) 		not null,
  StoreName 			CHAR(50),
  StoreLocation			CHAR(50),
  StoreAddy				VARCHAR(50),
  StoreHours			VARCHAR(25),
  CONSTRAINT OwnerID_SFK
    FOREIGN KEY (OwnerID)
    REFERENCES management(OwnerID)

);

CREATE TABLE artistStore
(
  ArtistStoreID			INT 			PRIMARY KEY 		auto_increment,
  TattooArtistID		VARCHAR(50) 	not null,
  StoreID 				VARCHAR(25) 	not null,
  ArtistLocation 		CHAR(100),
  CONSTRAINT TattooArtistID_ARTSFK
    FOREIGN KEY (TattooArtistID)
    REFERENCES tattooArtist(TattooArtistID),
  CONSTRAINT StoreID_ARTSFK
    FOREIGN KEY (StoreID)
    REFERENCES store(StoreID)

);

INSERT INTO tattooStyles VALUES
('Japanese', 'Antonius Tocknell', '23-8532744'),
('Blackwhite', 'Lotta Massel', '31-8316063'),
('NeoTraditional', 'Petronille Cottee', '58-0754450'),
('Traditional', 'Tiffanie Gogerty', '40-6741603'),
('Tribal', 'Amy Musicka', '24-1518344'),
('Blackwork', 'Christean Sheldrick', '39-5131297');

INSERT INTO market_dept VALUES
('other', '99-2595760', 'Ink4Life', 'https://www.instagram.com/Ink4Life', 'S', 'S'),
('socialMedia', '57-0488602', 'Ink4Life', 'https://www.instagram.com/Ink4Life', 'M', 'M'),
('apparel', '93-7838150', 'Ink4Life', 'https://www.twitter.com/Ink4Life', 'L', 'L'),
('family/friend', '51-8012918', 'Ink4Life', 'https://www.facebook.com/Ink4Life', 'XL', 'XL');

INSERT INTO customer VALUES
('49-6948404', 'Terrill', 'Walcar', '1995-06-09', 'other', 'Japanese'),
('98-7198903', 'Peria', 'MacCrann', '1972-05-17', 'socialMedia', 'Blackwhite'),
('28-1751311', 'Bridie', 'Elwyn', '1990-05-21', 'apparel', 'NeoTraditional'),
('59-4768869', 'Albina', 'Caudray', '1987-03-17', 'family/friend', 'Traditional'),
('03-5452353', 'Leodora', 'Castanyer', '2009-02-16', 'socialMedia', 'Tribal'),
('48-6462679', 'Gal', 'Pennycock', '1977-09-15', 'other', 'Blackwork'),
('78-9181842', 'Kimberli', 'Sambath', '1981-07-31', 'family/friend', 'Blackwork'),
('52-1183076', 'Blithe', 'Boothe', '1983-01-07', 'apparel', 'Tribal'),
('05-2409294', 'Herve', 'Barme', '1993-05-17', 'socialMedia', 'Traditional'),
('80-0020136', 'Madel', 'Di Claudio', '2007-04-09', 'other', 'NeoTraditional'),
('33-9459712', 'Steven', 'Battell', '1985-12-03', 'apparel', 'Blackwhite'),
('94-7606718', 'Laurella', 'McIlhagga', '2003-12-11', 'other', 'Japanese'),
('92-4874994', 'Francis', 'Ferrar', '1973-10-07', 'other', 'Japanese'),
('09-9534655', 'Harcourt', 'Tuffin', '2000-11-08', 'socialMedia', 'Blackwhite'),
('06-9050435', 'Meggie', 'Barriball', '1994-06-01', 'other', 'NeoTraditional'),
('99-8275463', 'Beauregard', 'Stillgoe', '1976-02-23', 'apparel', 'Traditional'),
('43-1739576', 'Fanchette', 'Galilee', '2004-06-23', 'family/friend', 'Tribal'),
('35-4878214', 'Tyne', 'Juris', '2007-10-16', 'other', 'Blackwork'),
('22-4027688', 'Freddie', 'Rix', '1999-01-10', 'socialMedia', 'Blackwhite'),
('82-3289769', 'Jeffry', 'Ciccotti', '1986-12-06', 'apparel', 'Japanese');

INSERT INTO tattooArtist VALUES
(1, 'Japanese', 'Zebulon', 'Bugs', '1100-2200', 'Japanese Style Dragon on forearm.'),
(2, 'Blackwhite', 'Xeloa', 'Davidson', '1100-2200', 'Black and white portrait of grandma on ribs.'),
(3, 'Traditional', 'Wenonah', 'Klaus', '1100-2200', 'Traditional style skull and heart with flame. The skull on my left butt and heart on my right butt.'),
(4, 'Blackwork', 'Sidoney', 'Cianni', '1100-2200', 'Blackwork of a jaguar with a snake in its mouth. On my left outer arm.'),
(5, 'Tribal', 'Hakeem', 'Terram', '1100-2200', 'Tribal tattoo of my heritage. I want a full leg sleeve on my left leg.'),
(6, 'NeoTraditional', 'Michelle', 'Coleiro', '1100-2200', 'Neotradtional tattoo of a wolf on my forearm.'),
(7, 'Japanese', 'Louise', 'McEvoy', '1100-2200', 'Japanese style samuri. On my right outer arm.'),
(8, 'Blackwhite', 'Justis', 'Jirak', '1100-2200', 'Black and white of a panda in a bamboo forest.'),
(9, 'Traditional', 'Maggi', 'Adriano', '1100-2200', 'Traditional of a pin up army women on forearm of left arm.'),
(10, 'Tribal', 'Gaelan', 'Lasseter', '1100-2200', 'Triabal tattoo of heratige. Full arm sleeve on right arm.'),
(11, 'NeoTraditional', 'Jonis', 'Ruxton', '1100-2200', 'Neotraditional of a forest and a women hunting. On right calf.'),
(12, 'Japanese', 'Sutherlan', 'Winsom', '1100-2200', 'Japanese style tiger in full color. On whole back.'),
(13, 'Blackwhite', 'Sigismond', 'Ginty', '1100-2200', 'Black and white lion. On left inside arm.'),
(14, 'Traditional', 'Arni', 'Maystone', '1100-2200', 'Traditional tatoo of spider and knife on left ribs.'),
(15, 'Blackwork', 'Mei', 'Sweating', '1100-2200', 'Blackwork of a hyena on neck.');

INSERT INTO payment VALUES
(1, 1, '35-4878214', '4.65'),
(2, 2, '22-4027688', '8.73'),
(3, 3, '82-3289769', '0.34');

INSERT INTO management VALUES
('Ink4Life', 'socialMedia', 'Antonietta Postgate', 'Finacials');
#('Ink4Life', 'MarketingDP', 'Elfreda Tink', 'Finacials'),
#('Ink4Life', 'MarketingDP', 'Emmeline Ubsdall', 'Finacials');

INSERT INTO store VALUES
('54569-2140', 'Ink4Life', 'Ink4Life', 'Harare, Zimbabwe', '1111 Baller Street', 1100-2300),
('41167-4233', 'Ink4Life', 'Ink4Life', 'Djibouti, Djibouti ', '2222 BBB Junction', 1100-2300),
('49288-0759', 'Ink4Life', 'Ink4Life', 'Abuja, Nigeria', '12345 Ye Ave', 1100-2300);

INSERT INTO artistStore VALUES
(1, 1, '54569-2140', 'Harare, Zimbabwe'),
(2, 2, '41167-4233', 'Djibouti, Djibouti'),
(3, 3, '49288-0759', 'Abuja, Nigeria'),
(4, 3, '49288-0759', 'Abuja, Nigeria'),
(5, 2, '41167-4233', 'Djibouti, Djibouti'),
(6, 1, '54569-2140','Harare, Zimbabwe'),
(7, 1, '54569-2140','Harare, Zimbabwe'),
(8, 2, '49288-0759', 'Abuja, Nigeria'),
(9, 3, '41167-4233', 'Djibouti, Djibouti'),
(10, 3, '41167-4233', 'Djibouti, Djibouti'),
(11, 2, '54569-2140','Harare, Zimbabwe'),
(12, 1, '49288-0759', 'Abuja, Nigeria'),
(13, 2, '54569-2140','Harare, Zimbabwe'),
(14, 3, '41167-4233', 'Djibouti, Djibouti'),
(15, 1, '49288-0759', 'Abuja, Nigeria');