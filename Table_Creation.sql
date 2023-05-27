CREATE TABLE Branch (B_id int PRIMARY KEY NOT NULL ,Plot_no int  NOT NULL ,Locality varchar(20)  NOT NULL ,City varchar(20)  NOT NULL ,State varchar(20)  NOT NULL);

CREATE TABLE Employee (Emp_id int PRIMARY KEY NOT NULL ,B_id int  NOT NULL,F_name varchar(20)  NOT NULL ,l_name varchar(20)  NOT NULL ,Gender varchar(1)  NOT NULL ,DOB date  NOT NULL ,Post varchar(20)  NOT NULL ,House_no int  NOT NULL ,Locality varchar(20)  NOT NULL ,City varchar(20)  NOT NULL ,State varchar(20)  NOT NULL ,FOREIGN KEY(B_id) REFERENCES Branch(B_id) ON DELETE SET NULL,CONSTRAINT DOB CHECK ((DOB) < DATE '2004-01-01'));
CREATE TABLE Customer (
    CustomerID number PRIMARY KEY NOT NULL,
    Emp_id int NOT NULL,
    B_id int NOT NULL,
    F_name varchar(20) NOT NULL,
    l_name varchar(20) NOT NULL,
    Gender varchar(1) NOT NULL,
    DOB date NOT NULL,
    House_no int NOT NULL,
    Locality varchar(20) NOT NULL,
    City varchar(20) NOT NULL,
    State varchar(20) NOT NULL,
    FOREIGN KEY(Emp_id) REFERENCES Employee(Emp_id),
    FOREIGN KEY(B_id) REFERENCES Branch(B_id) ON DELETE SET NULL,
    CONSTRAINT DOB_CUST CHECK ((DOB) < DATE '2004-01-01') 
);

CREATE TABLE Loan (Loan_no number  PRIMARY KEY NOT NULL ,
    CustomerID number  UNIQUE NOT NULL ,
    Interest_rate number  NOT NULL CHECK (Interest_rate between 1 AND 15) ,
    Amount int  NOT NULL CHECK (Amount>10000) ,
    Duration int  NOT NULL ,
    FOREIGN KEY(CustomerId) REFERENCES Customer(CustomerID) ON DELETE SET NULL);

CREATE TABLE Payment (Payment_no number PRIMARY KEY NOT NULL ,Loan_no number UNIQUE NOT NULL ,FOREIGN KEY(Loan_no) REFERENCES Loan(Loan_no));

CREATE TABLE Account (Account_no number  PRIMARY KEY NOT NULL ,
    Balance number  NOT NULL CHECK(Balance>10000),
    Account_type varchar(10));

CREATE TABLE CustomerHasAccounts (CustomerID number PRIMARY KEY  NOT NULL ,Account_no number UNIQUE NOT NULL,FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID),FOREIGN KEY(Account_no) REFERENCES Account(Account_no));

CREATE TABLE BranchMobileNo (
	B_id int  NOT NULL ,
	Mobile_number number PRIMARY KEY NOT NULL, 
	FOREIGN KEY(B_id) REFERENCES Branch(B_id) ON DELETE SET NULL,
	CONSTRAINT Mobile_number CHECK (length(TO_CHAR(Mobile_number)) <11)
);

CREATE TABLE EmpMobileNo (Emp_id int  NOT NULL ,
    Mobile_number number PRIMARY KEY NOT NULL,
    FOREIGN KEY(Emp_id) REFERENCES Employee(Emp_id),
    CONSTRAINT Mobile_number_EMP CHECK (length(TO_CHAR(Mobile_number)) <11));

CREATE TABLE CustMobileNo (
    CustomerID number  NOT NULL ,
    Mobile_number number PRIMARY KEY NOT NULL ,
    FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID) ON DELETE SET NULL,
    CONSTRAINT Mobile_number_CUST CHECK (length(TO_CHAR(Mobile_number)) <11));

CREATE TABLE Savings (Account_no number PRIMARY KEY NOT NULL,Interest_rate number,FOREIGN KEY(Account_no) REFERENCES Account(Account_no));

CREATE TABLE Current1 (Account_no number PRIMARY KEY NOT NULL,Overdraft_amt number,FOREIGN KEY(Account_no) REFERENCES Account(Account_no));

CREATE TABLE Payment2nf(Payment_no number PRIMARY KEY NOT NULL, Amount number, Pay_Date DATE,FOREIGN KEY(Payment_no) REFERENCES Payment(Payment_no));

CREATE TABLE Transactions1(Transaction_id number PRIMARY KEY  NOT NULL,Account_no number UNIQUE NOT NULL,FOREIGN KEY(Account_no) REFERENCES Account(Account_no));


CREATE TABLE Transaction2nf(Transaction_id number NOT NULL,
    Trans_type char(1),
    Trans_amt number CHECK(Trans_amt>100) NOT NULL,
    Trans_time TIMESTAMP,
    FOREIGN KEY(Transaction_id) REFERENCES Transactions1(Transaction_id));