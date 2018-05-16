--DATABASES PROYECT--

--CREATE TABLES--
CREATE TABLE Card(
  cardID NUMBER,
  status VARCHAR2(1) CHECK ((status = 'A') OR (status = 'B')),
  fines NUMBER,
  CONSTRAINT Card_PK PRIMARY KEY (cardID));

CREATE TABLE Customer(
  customerID NUMBER,
  name VARCHAR2(40),
  customerAddress VARCHAR2(50),
  phone NUMBER(9),
  password VARCHAR2(20),
  userName VARCHAR2(10),
  dateSignUp DATE,
  cardNumber NUMBER,
  CONSTRAINT Customer_PK PRIMARY KEY (customerID));

CREATE TABLE Employee(
  employeeID NUMBER,
  name VARCHAR2(40),
  employeeAddress VARCHAR2(50),
  phone NUMBER(9),
  password VARCHAR2(20),
  userName VARCHAR2(10),
  paycheck NUMBER (8, 2),
  branchName VARCHAR2(40),
  cardNumber NUMBER,
  CONSTRAINT Employee_PK PRIMARY KEY (employeeID));

CREATE TABLE Branch(
  name VARCHAR2(40),
  address VARCHAR2(50),
  phone NUMBER(9),
  CONSTRAINT Branch_PK PRIMARY KEY (name));
  
CREATE TABLE Location(
  address VARCHAR2(50),
  CONSTRAINT Location_PK PRIMARY KEY (address));
  
CREATE TABLE Rent(
  cardID NUMBER,
  itemID VARCHAR2(6),
  apporpriationDate DATE,
  returnDate DATE,
  CONSTRAINT Rent_PK PRIMARY KEY (cardID,itemID));
 
CREATE TABLE Book(
  ISBN VARCHAR2(4),
  bookID VARCHAR2(6),
  state VARCHAR2(10),
  avalability VARCHAR2(1) CHECK ((avalability = 'A') OR (avalability = 'O')),
  debyCost NUMBER(10,2),
  lostCost NUMBER(10,2),
  address VARCHAR2(50),
  CONSTRAINT Book_PK PRIMARY KEY (ISBN,bookID));

CREATE TABLE Video(
  title VARCHAR2(50),
  year INT,
  videoID VARCHAR2(6),
  state VARCHAR2(10),
  avalability VARCHAR2(1) CHECK ((avalability = 'A') OR (avalability = 'O')),
  debyCost NUMBER(10,2),
  lostCost NUMBER(10,2),
  address VARCHAR(50),
  CONSTRAINT Video_PK PRIMARY KEY (title,year,videoID));

--SELECT--
SELECT * FROM Card;
SELECT * FROM Customer;
SELECT * FROM Employee;
SELECT * FROM Branch;
SELECT * FROM Location;
SELECT * FROM Book;
SELECT * FROM Video;
SELECT * FROM Rent;

--DROP TABLES--
DROP TABLE Card;
DROP TABLE Customer;
DROP TABLE Employee;
DROP TABLE Branch;
DROP TABLE Location;
DROP TABLE Book;
DROP TABLE Video;
DROP TABLE Rent;

--FOREIGN KEYS--
ALTER TABLE Customer
ADD CONSTRAINT Customer_FK
FOREIGN KEY (cardNumber)
REFERENCES Card(cardID);

ALTER TABLE Employee
ADD CONSTRAINT Employee_FK_Card
FOREIGN KEY (cardNumber)
REFERENCES Card(cardID);

ALTER TABLE Employee
ADD CONSTRAINT Employee_FK_Branch
FOREIGN KEY (branchName)
REFERENCES Branch(name);

ALTER TABLE Branch
ADD CONSTRAINT Branch_FK
FOREIGN KEY (address)
REFERENCES Location(address);

ALTER TABLE Book
ADD CONSTRAINT Book_FK
FOREIGN KEY (address)
REFERENCES Location(address);

ALTER TABLE Video
ADD CONSTRAINT Video_FK
FOREIGN KEY (address)
REFERENCES Location(address);

ALTER TABLE Rent
ADD CONSTRAINT Rent_FK_Card
FOREIGN KEY (cardID)
REFERENCES Card(cardID);

ALTER TABLE Rent
ADD CONSTRAINT Rent_FK_Book
FOREIGN KEY (itemID)
REFERENCES Book(bookID);

ALTER TABLE Rent
ADD CONSTRAINT Rent_FK_Video
FOREIGN KEY (itemID)
REFERENCES Video(videoID);


--INSERTS--
INSERT INTO Card VALUES (101,'A',0);
INSERT INTO Card VALUES (102,'A',0);
INSERT INTO Card VALUES (103,'A',0);
INSERT INTO Card VALUES (104,'A',0);
INSERT INTO Card VALUES (105,'A',0);
INSERT INTO Card VALUES (106,'A',0);
INSERT INTO Card VALUES (107,'B',50);
INSERT INTO Card VALUES (108,'B',10);
INSERT INTO Card VALUES (109,'B',25.5);
INSERT INTO Card VALUES (110,'B',15.25);
INSERT INTO Card VALUES (151,'A',0);
INSERT INTO Card VALUES (152,'A',0);
INSERT INTO Card VALUES (153,'A',0);
INSERT INTO Card VALUES (154,'A',0);
INSERT INTO Card VALUES (155,'A',0);

INSERT INTO Branch VALUES ('ARCHEOLOGY', 'ARCHEOLOGY ROAD', 645645645);
INSERT INTO Branch VALUES ('CHEMISTRY', 'CHEMISTRY ROAD', 622622622);
INSERT INTO Branch VALUES ('COMPUTING', 'COMPUTING ROAD', 644644644);
INSERT INTO Branch VALUES ('PHYSICS', 'PHYSICS ROAD', 666666666);

INSERT INTO Customer VALUES (1, 'ALFRED', 'BACON STREET', 623623623, 'alfred123', 'al1', '12-05-2018', 101);
INSERT INTO Customer VALUES (2, 'JAMES', 'DOWNTOWN ABBEY', 659659659, 'james123', 'ja2', '10-05-2018', 102);
INSERT INTO Customer VALUES (3, 'GEORGE', 'DETROIT CITY', 654654654, 'george123', 'ge3', '21-06-2017', 103);
INSERT INTO Customer VALUES (4, 'TOM', 'WASHINGTON DC.', 658658658, 'tom123', 'tom4', '05-12-2016', 104);
INSERT INTO Customer VALUES (5, 'PETER', 'CASTERLY ROCK', 652652652, 'peter123', 'pe5', '09-08-2016', 105);
INSERT INTO Customer VALUES (6, 'JENNY', 'TERRAKOTA', 651651651, 'jenny123', 'je6', '30-04-2017', 106);
INSERT INTO Customer VALUES (7, 'ROSE', 'SWEET HOME ALABAMA', 657657657, 'rose123', 'ro7', '28-02-2018', 107);
INSERT INTO Customer VALUES (8, 'MONICA', 'FAKE STREET 123', 639639639, 'monica123', 'mo8', '15-01-2016', 108);
INSERT INTO Customer VALUES (9, 'PHOEBE', 'CENTRAL PERK', 678678678, 'phoebe123', 'pho9', '25-03-2016', 109);
INSERT INTO Customer VALUES (10, 'RACHEL', 'WHEREVER', 687687687, 'rachel123', 'ra10', '01-09-2017', 110);

INSERT INTO Employee VALUES (11, 'ROSS', 'HIS HOUSE', 671671671, 'ross123', 'ro11', 1200, 'ARCHEOLOGY', 151);
INSERT INTO Employee VALUES (12, 'CHANDLER', 'OUR HEARTHS', 688688688, 'chandler123', 'chand12', 1150.50, 'ARCHEOLOGY', 152);
INSERT INTO Employee VALUES (13, 'JOEY', 'LITTLE ITAYLY', 628628628, 'joey123', 'jo13', 975.75, 'ARCHEOLOGY', 153);
INSERT INTO Employee VALUES (14, 'VICTOR', 'SANTA FE', 654321987, 'victor123', 'vic14', 2200, 'COMPUTING', 154);
INSERT INTO Employee VALUES (15, 'JAIRO', 'ARMILLA', 698754321, 'jairo123', 'ja15', 2200.50, 'CHEMISTRY', 155);

INSERT INTO Location VALUES ('ARCHEOLOGY ROAD');
INSERT INTO Location VALUES ('CHEMISTRY ROAD');
INSERT INTO Location VALUES ('COMPUTING ROAD');
INSERT INTO Location VALUES ('PHYSICS ROAD');

INSERT INTO Book VALUES ('A123', 'B1A123', 'GOOD', 'A', 5, 20, 'ARCHEOLOGY ROAD');
INSERT INTO Book VALUES ('A123', 'B2A123', 'NEW', 'O', 6, 30, 'ARCHEOLOGY ROAD');
INSERT INTO Book VALUES ('B234', 'B1B234', 'NEW', 'A', 2, 15, 'CHEMISTRY ROAD');
INSERT INTO Book VALUES ('C321', 'B1C321', 'BAD', 'A', 1, 10, 'PHYSICS ROAD');
INSERT INTO Book VALUES ('H123', 'B1H123', 'GOOD', 'A', 3, 15, 'CHEMISTRY ROAD');
INSERT INTO Book VALUES ('Z123', 'B1Z123', 'GOOD', 'O', 4, 20, 'COMPUTING ROAD');
INSERT INTO Book VALUES ('L321', 'B1L321', 'NEW', 'O', 4, 20, 'COMPUTING ROAD');
INSERT INTO Book VALUES ('P321', 'B1P321', 'USED', 'A', 2, 12, 'CHEMISTRY ROAD');

INSERT INTO Video VALUES ('CHEMISTRY FOR DUMMIES', 2016, 'V1CH16', 'NEW', 'O', 10, 50, 'CHEMISTRY ROAD');
INSERT INTO Video VALUES ('CHEMISTRY FOR DUMMIES', 2016, 'V2CH16', 'BAD', 'A', 5, 20, 'CHEMISTRY ROAD');
INSERT INTO Video VALUES ('COMPUTING MANAGER', 2014, 'V1CO14', 'GOOD', 'A', 4, 20, 'COMPUTING ROAD');
INSERT INTO Video VALUES ('JAVA LANGUAGE', 2015, 'V1JA15', 'USED', 'O', 4, 20, 'COMPUTING ROAD');
INSERT INTO Video VALUES ('DINOSAURS', 2000, 'V1DI00', 'GOOD', 'O', 5, 25, 'ARCHEOLOGY ROAD');
INSERT INTO Video VALUES ('T-REX, DEADLY KING', 1992, 'V1TR92', 'USED', 'A', 10, 50, 'ARCHEOLOGY ROAD');
INSERT INTO Video VALUES ('ANCESTORS OF THE HUMANITY', 1998, 'V1AN98', 'BAD', 'A', 3, 15, 'ARCHEOLOGY ROAD');
INSERT INTO Video VALUES ('PHYSICS, MOST BORING SH*T', 2018, 'V1PH18', 'NEW', 'A', 1, 5, 'PHYSICS ROAD');

INSERT INTO Rent VALUES (101, 'B2A123', '10-05-2018', '20-05-2018');
INSERT INTO Rent VALUES (102, 'B1Z123', '10-05-2018', '25-05-2018');
INSERT INTO Rent VALUES (104, 'V1JA15', '01-05-2018', '21-05-2018');
INSERT INTO Rent VALUES (105, 'V1DI00', '02-05-2018', '25-05-2018');
INSERT INTO Rent VALUES (154, 'B1L321', '04-05-2018', '26-05-2018');
INSERT INTO Rent VALUES (155, 'V1CH16', '29-04-2018', '29-05-2018');

--FUNCTIONS--
--1--
CREATE OR REPLACE PROCEDURE login_library(user IN VARCHAR2, pass IN VARCHAR2)
IS
  passAux customer.password%TYPE;
BEGIN
  SELECT password INTO passAux
  FROM customer
  WHERE username LIKE user;
  
  IF passAux LIKE pass THEN
    DBMS_OUTPUT.PUT_LINE('User ' || user || ' loging succesfull');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Password incorrect');
  END IF;
  
  EXCEPTION WHEN no_data_found THEN 
  DBMS_OUTPUT.PUT_LINE('User incorrect');
END;

SET SERVEROUTPUT ON;
DECLARE
  user customer.username%TYPE;
  pass customer.password%TYPE;
BEGIN
  user := &Username;
  pass := &Password;
  login_library(user,pass);
END;
--2--


--3--

CREATE OR REPLACE PROCEDURE customerAcount_library(custoID IN customer.customerid%TYPE)
IS
  auxCard NUMBER;
  auxFines NUMBER;
  auxItem VARCHAR(6);
  rented number := 0;
BEGIN
  SELECT cardnumber INTO auxCard
  FROM customer
  WHERE customerid LIKE custoID;
  
  SELECT COUNT(*) INTO rented
  FROM rent
  WHERE rent.cardid LIKE auxcard;
  
  DBMS_OUTPUT.PUT_LINE('The user card is ' || auxCard);  
  IF (rented > 0) THEN
    SELECT rent.itemid INTO auxItem
    FROM rent,card
    WHERE card.cardid = rent.cardid
    AND card.cardid LIKE auxCard;    
    
    DBMS_OUTPUT.PUT_LINE('The user has ' || auxItem || ' rented');
  ELSE    
    DBMS_OUTPUT.PUT_LINE('This user has no rents'); 
  END IF;
  
  SELECT fines INTO auxFines
  FROM card
  WHERE cardid LIKE auxcard;
  
  DBMS_OUTPUT.PUT_LINE('The user fines are ' || auxFines);
    
  EXCEPTION WHEN no_data_found THEN 
  DBMS_OUTPUT.PUT_LINE('NOT DATA FOUND');
END;

SET SERVEROUTPUT ON;
DECLARE
  custoID customer.customerid%TYPE;
BEGIN
  custoID := &Customer_ID;
  customerAcount_library(custoID);
END;

--4--
CREATE OR REPLACE PROCEDURE rentItem_library(auxCard IN card.cardid%TYPE, auxItemID IN VARCHAR2, itemType IN VARCHAR2, auxDate IN DATE)
IS
BEGIN
  
  IF itemType LIKE 'book' THEN
    UPDATE book
    SET avalability = 'O'
    WHERE bookid LIKE auxItemID;
    
  ELSIF itemType LIKE 'video' THEN
    UPDATE video
    SET avalability = 'O'
    WHERE videoid LIKE auxItemID;
  END IF;
    
    INSERT INTO rent
    VALUES (auxCard,auxItemID,sysdate,auxDate);
    DBMS_OUTPUT.PUT_LINE('ITEM ' || auxItemID || ' RENTED');
END;

SET SERVEROUTPUT ON;
DECLARE
  auxCard card.cardid%TYPE;
  auxItemID VARCHAR2(10);
  itemType VARCHAR2(20);
  auxDate DATE;
BEGIN
  auxCard := &Card_ID;
  auxItemID := &ID_Item;
  itemType := &Item_Type_(book_or_video);
  auxDate := &Return_date;
  rentItem_library(auxCard,auxItemID,itemType,auxDate);
END;
--5--

CREATE OR REPLACE PROCEDURE payFines_library(auxCard IN card.cardid%TYPE, money IN NUMBER)
IS
  finesAmount NUMBER;
  total NUMBER;
BEGIN
  SELECT fines INTO finesAmount
  FROM card
  WHERE cardid LIKE auxCard;
  
  IF finesAmount < money THEN
    total := money - finesAmount;
    DBMS_OUTPUT.PUT_LINE('YOU PAY ALL YOUR FINES AND YOU HAVE ' || total || ' MONEY BACK');
    
    UPDATE card
    SET status = 'A', fines = 0
    WHERE cardid = auxCard;
    
  ELSIF finesAmount = money THEN
    total := money - finesAmount;
    DBMS_OUTPUT.PUT_LINE('YOU PAY ALL YOUR FINES');
    
    UPDATE card
    SET status = 'A', fines = 0
    WHERE cardid = auxCard;
  
  ELSE
    total := finesAmount - money;
    DBMS_OUTPUT.PUT_LINE('YOU WILL NEED TO PAY ' || total || ' MORE DOLLARS TO UNLOCK YOUR CARD');
    
    UPDATE card
    SET fines = total
    WHERE cardid = auxCard;
  END IF;
END;

SET SERVEROUTPUT ON;
DECLARE
  auxCard card.cardid%TYPE;
  money NUMBER;
BEGIN
  auxCard := &Card_ID;
  money := &Money_To_Pay;
  payFines_library(custoID);
END;

--6--
CREATE OR REPLACE PROCEDURE updateInfo_library(auxCustomer IN customer.customerid%TYPE, pNumber NUMBER, address VARCHAR2, newPass VARCHAR2)
IS
BEGIN
  UPDATE customer
  SET phone = pNumber, customeraddress = address, password = newPass
  WHERE customerid = auxCustomer;
END;

SET SERVEROUTPUT ON;
DECLARE
  auxCustomer customer.customerid%TYPE;
  pNumber NUMBER;
  address VARCHAR2;
  newPass VARCHAR2;
BEGIN
  auxCustomer := &Customer_ID;
  pNumber := &Write_your_new_phone_number_or_the_old_one_if_you_do_not_want_to_change_it;
  address := &Write_your_new_address_or_the_old_one_if_you_do_not_want_to_change_it;
  newPass := &Write_your_new_password_or_the_old_one_if_you_do_not_want_to_change_it;
  updateInfo_library(auxCustomer,pNumber,address,newPass);
END;

--7--
CREATE OR REPLACE PROCEDURE addCustomer_library(auxCustomerId IN NUMBER, auxName IN VARCHAR2, auxCustomerAddress IN VARCHAR2, auxPhone IN NUMBER,
auxPass IN VARCHAR2, auxUserName IN VARCHAR2, auxCardNumber IN NUMBER)
IS
BEGIN
  INSERT INTO customer
  VALUES (auxCustomerId,auxName,auxCustomerAddress,auxPhone,auxPass,auxUserName,sysdate,auxCardNumber);
END;

SET SERVEROUTPUT ON;
DECLARE
  auxCustomerId NUMBER;
  auxName VARCHAR2(20);
  auxCustomerAddress VARCHAR2(20);
  auxPhone NUMBER;
  auxPass VARCHAR2(20);
  auxUserName VARCHAR2(20);
  auxCardNumber NUMBER;
BEGIN
  auxCustomerId := &Customer_ID;
  auxName := &Name;
  auxCustomerAddress := &Address;
  auxPhone := &Phone;
  auxPass := &Password;
  auxUserName := &User_Name;
  auxCardNumber := &Card_Numeber;
  addCustomer_library(auxCustomerId,auxName,auxCustomerAddress,auxPhone,auxPass,auxUserName,auxCardNumber);
END;

--8--
CREATE OR REPLACE TRIGGER addCardTrigger_library
AFTER INSERT
ON customer
FOR EACH ROW
DECLARE
BEGIN
  INSERT INTO card
  VALUES (:new.cardnumber,'A',0);
  
  DBMS_OUTPUT.PUT_LINE('Card created');
END;

--EXAMPLE--
INSERT INTO customer
VALUES (11,'MARI CARMEN','CORDOBA',645892456,'maricarmen123','ma11',sysdate,111);

--9--
CREATE OR REPLACE PROCEDURE allMedia_library(mediaType VARCHAR2)
IS
  CURSOR cBooks
  IS
    SELECT *
    FROM book;
  
  CURSOR cVideos
  IS
    SELECT *
    FROM video;
  
  xBooks cBooks%ROWTYPE;
  xVideos cVideos%ROWTYPE;
BEGIN
  IF mediaType LIKE 'books' THEN
    OPEN cBooks;
    
    DBMS_OUTPUT.PUT_LINE('ISBN     ID     STATE     AVALABILITY     DEBY_COST     LOST_COST    LOCATION');
    DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------------------------------');
    
    LOOP
      FETCH cBooks
      INTO xBooks;
      EXIT WHEN cBooks%NOTFOUND;
      
      DBMS_OUTPUT.PUT_LINE(xBooks.isbn || '     ' || xBooks.bookid || '     ' || xBooks.state || '     ' || xBooks.avalability || '     ' || xBooks.debycost || '     ' ||
      xBooks.lostcost || '     ' || xBooks.address);
    END LOOP;
  ELSIF mediaType LIKE 'videos' THEN
    OPEN cVideos;
    DBMS_OUTPUT.PUT_LINE('TITLE     YEAR     ID     STATE     AVALABILITY     DEBY_COST     LOST_COST    LOCATION');
    DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------------------------------');
    LOOP
      FETCH cVideos
      INTO xVideos;
      EXIT WHEN cVideos%NOTFOUND;
      
      DBMS_OUTPUT.PUT_LINE(xVideos.title || '     ' || xVideos.year || '     ' || xVideos.videoid || '     ' || xVideos.state || '     ' || xVideos.avalability || '     ' || xVideos.debycost || '     ' ||
      xVideos.lostcost || '     ' || xVideos.address);
    END LOOP;
  ELSE
    DBMS_OUTPUT.PUT_LINE('TYPE INCORRECT, you must choose between books or videos');
  END IF;
END;

SET SERVEROUTPUT ON;
DECLARE
  typeItem VARCHAR2(10);
BEGIN
  typeItem := &Select_between_books_or_videos;
  allMedia_library(typeItem);
END;

--10--
