BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "departments" (
	"ID"	INTEGER NOT NULL,
	"name"	VARCHAR(30),
	PRIMARY KEY("ID")
);
CREATE TABLE IF NOT EXISTS "customers" (
	"ID"	    INTEGER NOT NULL,
	"full_name"	VARCHAR(60) NOT NULL,
	"address"	VARCHAR(60),
	"phone"		VARCHAR(60),
	"age"		VARCHAR(3),
	"gender"	VARCHAR(6),
	"password"	VARCHAR(20),
	PRIMARY KEY("ID")
);
CREATE TABLE IF NOT EXISTS "products" (
	"ID"		INTEGER NOT NULL,
	"name"		VARCHAR(50) NOT NULL,
	"category"	VARCHAR(30),
	"price"		INTEGER,
	PRIMARY KEY("ID")
);
CREATE TABLE IF NOT EXISTS "employees" (
	"ID"			INTEGER NOT NULL,
	"email"			VARCHAR(30) NOT NULL,
	"name"			VARCHAR(30),
	"salary"		INTEGER,
	"departmentID"	INTEGER,
	PRIMARY KEY("ID"),
	FOREIGN KEY("departmentID") REFERENCES "departments"("ID")
);
CREATE TABLE IF NOT EXISTS "orders" (
	"ID"			INTEGER NOT NULL,
	"customerID"	INTEGER,
	"productID"		INTEGER,
	"date"			DATE,
	"amount"		INTEGER,
	PRIMARY KEY("ID"),
	FOREIGN KEY("customerID") REFERENCES "customers"("ID"),
	FOREIGN KEY("productID") REFERENCES "products"("ID")
);
CREATE TABLE IF NOT EXISTS "admins" (
	"ID"			INTEGER NOT NULL,
	"email"			VARCHAR(30) NOT NULL,
	"password"		VARCHAR(30),
	"employeeID"	INTEGER,
	PRIMARY KEY("ID"),
	FOREIGN KEY("employeeID") REFERENCES "employees"("ID")
);
COMMIT;
