import random
from app.database import db
from app.models import Trip
from datetime import datetime

def seed_trips_rand():
    locations = ["Dhaka", "Chittagong", "Cox's Bazar", "Noakhali", "Khulna"]
    dates = [
        datetime(2024, 6, 7),
        datetime(2024, 6, 8),
        datetime(2024, 6, 9),
    ]
    titles = ["Star Line", "Green Line", "Shyamoli", "Hanif", "Ena"]
    depart_times = ["10:00 AM", "12:00 PM", "2:00 PM", "4:00 PM", "6:00 PM", "8:00 PM", "10:00 PM"]

    trips_data = []

    for _ in range(150):  # Let's create 30 trips for the given range
        from_location = random.choice(locations)
        to_location = random.choice([loc for loc in locations if loc != from_location])
        date = random.choice(dates)
        depart_time = random.choice(depart_times)
        title = random.choice(titles)
        seats = 36
        seats_available = random.randint(0, seats)
        price = random.uniform(300, 700)
        seat_taken = "" if seats_available == seats else ", ".join([f"{random.choice('ABCDEFGHI')}{random.randint(1, 4)}" for _ in range(seats - seats_available)])

        trips_data.append({
            "title": title,
            "fromLocation": from_location,
            "toLocation": to_location,
            "date": date,
            "departTime": depart_time,
            "seats": seats,
            "seatsAvailable": seats_available,
            "price": round(price, 2),
            "seatTaken": seat_taken
        })

    # Remove old trips
    old_trips = Trip.query.all()
    for trip in old_trips:
        db.session.delete(trip)
    db.session.commit()

    # Add new trips
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
