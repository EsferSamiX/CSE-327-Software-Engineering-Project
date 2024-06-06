# run_seed.py
from app.database import db
from flask import Flask
from seeders.trip_rand import seed_trips_rand
from seeders.trip_seeder import seed_trips


def create_app():
    app = Flask(__name__)
    app.config['SQLALCHEMY_DATABASE_URI'] = "sqlite:///relax.db"
    app.config['SECRET_KEY'] = "tempKEY"
    app.config["JWT_SECRET_KEY"] = "super-secret" 

    db.init_app(app)

    return app

app = create_app()

with app.app_context():
    db.create_all()
    # seed_trips()
    seed_trips_rand()
