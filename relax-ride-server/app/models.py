from app.database import db
from datetime import datetime

class BookedTrip(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'))
    trip_id = db.Column(db.Integer, db.ForeignKey('trip.id'))
    seatTaken = db.Column(db.String(255))
    user = db.relationship("User", back_populates="bookedTrips")
    trip = db.relationship("Trip", back_populates="bookedTrips")
    
    def __repr__(self):
        return f"BookedTrip('{self.user_id}', '{self.trip_id}')"

    def dict(self):
        return {
            'id': self.id,
            'user_id': self.user_id,
            'trip_id': self.trip_id,
            'seatTaken': self.seatTaken
        }

class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(20), unique=True, nullable=False)
    email = db.Column(db.String(255))
    password = db.Column(db.String(255), nullable=False)
    fname = db.Column(db.String(255), nullable=False)
    lname = db.Column(db.String(255), nullable=False)
    city = db.Column(db.String(255), nullable=False)
    phone = db.Column(db.String(255), nullable=False)
    balance = db.Column(db.Float)
    package = db.Column(db.Integer) # basic - 0, premium - 1, gold - 2
    availableLoan = db.Column(db.Integer)
    bookedTrips = db.relationship("BookedTrip", back_populates="user")

    def __repr__(self):
        return f"User('{self.username}')"
    
    def dict(self):
        return {
            'id': self.id,
            'username': self.username,
            'email': self.email,
            'fname': self.fname,
            'lname': self.lname,
            'city': self.city,
            'phone': self.phone,
            'balance': self.balance,
            'package': self.package,
            'availableLoan': self.availableLoan
        }


class Trip(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(255), default="Star Line")
    fromLocation = db.Column(db.String(255))
    toLocation = db.Column(db.String(255))
    date = db.Column(db.DateTime, default=db.func.current_timestamp())
    departTime = db.Column(db.String(255), default=db.func.current_timestamp())
    seats = db.Column(db.Integer)
    seatsAvailable = db.Column(db.Integer)
    price = db.Column(db.Float)
    seatTaken = db.Column(db.String(255))
    bookedTrips = db.relationship("BookedTrip", back_populates="trip")   
     
    def __repr__(self):
        return f"Trip('{self.fromLocation}', '{self.toLocation}')"

    def dict(self):
        return {
            'id': self.id,
            'title': self.title,
            'fromLocation': self.fromLocation,
            'toLocation': self.toLocation,
            'date': self.date,
            'departTime': self.departTime,
            'seats': self.seats,
            'seatsAvailable': self.seatsAvailable,
            'price': self.price,
            'seatTaken': self.seatTaken
        }

