from app.database import db
from app.models import Trip
from datetime import datetime


def seed_trips():
    trips_data = [
        {
            "title": "Star Line",
            "fromLocation": "Dhaka",
            "toLocation": "Chittagong",
            "date": datetime(2024, 6, 7),
            "departTime": "10:00 AM",
            "seats": 36,
            "seatsAvailable": 36,
            "price": 500.00,
            "seatTaken": ""
        },
        {
            "title": "Star Line",
            "fromLocation": "Dhaka",
            "toLocation": "Chittagong",
            "date": datetime(2024, 6, 7),
            "departTime": "10:00 AM",
            "seats": 36,
            "seatsAvailable": 36,
            "price": 500.00,
            "seatTaken": ""
        },
        {
            "title": "Star Line",
            "fromLocation": "Dhaka",
            "toLocation": "NoaKhali",
            "date": datetime(2024, 6, 7),
            "departTime": "10:00 AM",
            "seats": 36,
            "seatsAvailable": 36,
            "price": 500.00,
            "seatTaken": ""
        },
        {
            "title": "Star Line",
            "fromLocation": "Dhaka",
            "toLocation": "Noakhali",
            "date": datetime(2024, 6, 8),
            "departTime": "11:00 AM",
            "seats": 36,
            "seatsAvailable": 36,
            "price": 500.00,
            "seatTaken": ""
        },
        {
            "title": "Star Line",
            "fromLocation": "Dhaka",
            "toLocation": "Chittagong",
            "date": datetime(2024, 6, 7),
            "departTime": "10:00 AM",
            "seats": 36,
            "seatsAvailable": 36,
            "price": 500.00,
            "seatTaken": ""
        },
        {
            "title": "Star Line",
            "fromLocation": "Dhaka",
            "toLocation": "Chittagong",
            "date": datetime(2024, 6, 7),
            "departTime": "10:00 AM",
            "seats": 36,
            "seatsAvailable": 26,
            "price": 500.00,
            "seatTaken": "I2, I1, I3, I4, H4, H3, F3, F4, G3, G4"
        },
        {
            "title": "Star Line",
            "fromLocation": "Dhaka",
            "toLocation": "Sylhet",
            "date": datetime(2024, 6, 8),
            "departTime": "2:00 PM",
            "seats": 36,
            "seatsAvailable": 36,
            "price": 450.00,
            "seatTaken": ""
        },
        {
            "title": "Star Line",
            "fromLocation": "Chittagong",
            "toLocation": "Dhaka",
            "date": datetime(2024, 6, 9),
            "departTime": "6:00 PM",
            "seatsAvailable": 36,
            "seats": 36,
            "price": 500.00,
            "seatTaken": ""
        },
        {
            "title": "Star Line",
            "fromLocation": "Cox's Bazar",
            "toLocation": "Dhaka",
            "date": datetime(2024, 6, 8),
            "departTime": "6:00 PM",
            "seatsAvailable": 36,
            "seats": 36,
            "price": 500.00,
            "seatTaken": ""
        },
        {
            "title": "Star Line",
            "fromLocation": "Cox's Bazar",
            "toLocation": "Dhaka",
            "date": datetime(2024, 6, 8),
            "departTime": "10:00 PM",
            "seatsAvailable": 36,
            "seats": 36,
            "price": 500.00,
            "seatTaken": ""
        },
        {
            "title": "Star Line",
            "fromLocation": "Cox's Bazar",
            "toLocation": "Dhaka",
            "date": datetime(2024, 6, 8),
            "departTime": "12:30 PM",
            "seatsAvailable": 36,
            "seats": 36,
            "price": 500.00,
            "seatTaken": ""
        },
        {
            "title": "Star Line",
            "fromLocation": "Cox's Bazar",
            "toLocation": "Dhaka",
            "date": datetime(2024, 6, 8),
            "departTime": "3:00 PM",
            "seatsAvailable": 36,
            "seats": 36,
            "price": 500.00,
            "seatTaken": ""
        },
        {
            "title": "Star Line",
            "fromLocation": "Noakhali",
            "toLocation": "Dhaka",
            "date": datetime(2024, 6, 8),
            "departTime": "3:00 PM",
            "seatsAvailable": 36,
            "seats": 36,
            "price": 500.00,
            "seatTaken": ""
        },
        {
            "title": "Star Line",
            "fromLocation": "Noakhali",
            "toLocation": "Dhaka",
            "date": datetime(2024, 6, 8),
            "departTime": "1:00 PM",
            "seatsAvailable": 36,
            "seats": 36,
            "price": 500.00,
            "seatTaken": ""
        },
        {
            "title": "Star Line",
            "toLocation": "Dhaka",
            "fromLocation": "Khulna",
            "date": datetime(2024, 6, 8),
            "departTime": "1:00 PM",
            "seatsAvailable": 36,
            "seats": 36,
            "price": 500.00,
            "seatTaken": ""
        },
        {
            "title": "Star Line",
            "toLocation": "Dhaka",
            "fromLocation": "Khulna",
            "date": datetime(2024, 6, 8),
            "departTime": "5:00 PM",
            "seatsAvailable": 36,
            "seats": 36,
            "price": 500.00,
            "seatTaken": ""
        },
        {
            "title": "Star Line",
            "toLocation": "Dhaka",
            "fromLocation": "Cox's Bazar",
            "date": datetime(2024, 6, 9),
            "departTime": "7:00 PM",
            "seatsAvailable": 36,
            "seats": 36,
            "price": 500.00,
            "seatTaken": ""
        },
        {
            "title": "Star Line",
            "toLocation": "Dhaka",
            "fromLocation": "Cox's Bazar",
            "date": datetime(2024, 6, 8),
            "departTime": "10:00 PM",
            "seatsAvailable": 36,
            "seats": 36,
            "price": 500.00,
            "seatTaken": ""
        },
        {
            "title": "Star Line",
            "toLocation": "Dhaka",
            "fromLocation": "Cox's Bazar",
            "date": datetime(2024, 6, 7),
            "departTime": "7:00 PM",
            "seatsAvailable": 36,
            "seats": 36,
            "price": 500.00,
            "seatTaken": ""
        },
        {
            "title": "Star Line",
            "toLocation": "Dhaka",
            "fromLocation": "Cox's Bazar",
            "date": datetime(2024, 6, 7),
            "departTime": "10:00 PM",
            "seatsAvailable": 36,
            "seats": 36,
            "price": 500.00,
            "seatTaken": ""
        },
        {
            "title": "Star Line",
            "toLocation": "Khulna",
            "fromLocation": "Cox's Bazar",
            "date": datetime(2024, 6, 7),
            "departTime": "10:00 PM",
            "seatsAvailable": 36,
            "seats": 36,
            "price": 500.00,
            "seatTaken": ""
        },
        {
            "title": "Star Line",
            "toLocation": "Khulna",
            "fromLocation": "Cox's Bazar",
            "date": datetime(2024, 6, 7),
            "departTime": "1:00 M",
            "seatsAvailable": 36,
            "seats": 36,
            "price": 500.00,
            "seatTaken": ""
        },
    ]

    old_trips=Trip.query.all()
    for trip in old_trips:
        db.session.delete(trip)
    db.session.commit()
    for trip_data in trips_data:
        trip = Trip(
            title=trip_data["title"],
            fromLocation=trip_data["fromLocation"],
            toLocation=trip_data["toLocation"],
            date=trip_data["date"],
            departTime=trip_data["departTime"],
            seats=trip_data["seats"],
            seatsAvailable=trip_data["seatsAvailable"],
            price=trip_data["price"],
            seatTaken=trip_data["seatTaken"]
        )
        db.session.add(trip)

    db.session.commit()
    print("Trips seeded successfully!")
