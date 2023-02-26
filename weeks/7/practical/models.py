import sqlalchemy as db
from sqlalchemy.orm import declarative_base

Base = declarative_base()

engine = db.create_engine("sqlite:///shop.db")

class Admin(Base):
    __tablename__ = 'admins'

    ID = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.String(30), nullable=False)
    password = db.Column(db.String(30))
    employeeID = db.Column(db.Integer, db.ForeignKey('employees.ID'))


class Employee(Base):
    __tablename__ = 'employees'

    ID = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.String(30), nullable=False)
    name = db.Column(db.String(30))
    salary = db.Column(db.Integer)
    departmentID = db.Column(db.Integer, db.ForeignKey('departments.ID'))


class Department(Base):
    __tablename__ = 'departments'

    ID = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(30))

    
class Customer(Base):
    __tablename__ = 'customers'

    ID = db.Column(db.Integer, primary_key=True)
    full_name = db.Column(db.String(60), nullable=False)
    address = db.Column(db.String(60))
    phone = db.Column(db.String(60))
    age = db.Column(db.String(3))
    gender = db.Column(db.String(6))
    password = db.Column(db.String(20))


class Order(Base):
    __tablename__ = 'orders'

    ID = db.Column(db.Integer, primary_key=True)
    customerID = db.Column(db.Integer, db.ForeignKey('customers.ID'))
    productID = db.Column(db.Integer, db.ForeignKey('products.ID'))
    date = db.Column(db.Date)
    amount = db.Column(db.Integer)


class Product(Base):
    __tablename__ = 'products'

    ID = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), nullable=False)
    category = db.Column(db.String(30))
    price = db.Column(db.Integer)



Base.metadata.create_all(engine)