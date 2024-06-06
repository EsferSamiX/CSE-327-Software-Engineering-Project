from flask import Flask
from flask import jsonify
from flask import request
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime

from flask_jwt_extended import create_access_token
from flask_jwt_extended import get_jwt_identity
from flask_jwt_extended import jwt_required
from flask_jwt_extended import JWTManager
from app.models import BookedTrip, Trip, User
from app.database import db
from sqlalchemy import or_

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = "sqlite:///relax.db"
app.config['SECRET_KEY'] = "tempKEY"
app.config["JWT_SECRET_KEY"] = "super-secret" 

db.init_app(app)
jwt = JWTManager(app)

@app.route("/signup", methods=["POST"])
def signup():
    print(request.json)
    username = request.json.get("username", None)
    password = request.json.get("password", None)
    fname = request.json.get("fname", None)
    lname = request.json.get("lname", None)
    city = request.json.get("city", None)
    phone = request.json.get("phone", None)
    email = request.json.get("email", None)
    try:
      existing_user = User.query.filter(or_(User.email == email, User.username == username, User.phone == phone)).first()
      if existing_user:
        # db.session.delete(existing_user)
        # db.session.commit()
        return jsonify({"msg": "user already exists"}), 409
      new_user = User(username=username, password=password, fname=fname, lname=lname, city=city, phone=phone, email=email, balance=0, package=0, availableLoan=0);
      db.session.add(new_user)
      db.session.commit()
      return jsonify({"msg": "user created","data": new_user.dict(), "access_token": create_access_token(identity=username)}), 201  
    except Exception as e:
      print(str(e))
      return jsonify({"msg": "unauthorized"}), 403
    
@app.route("/login", methods=["POST"])
def login():
  username = request.json.get("username")
  phone = request.json.get("phone")
  password = request.json.get("password")
  try:
    user = User.query.filter(or_(User.email == username, User.username == username, User.phone == phone, User.phone == username)).first()
    if user is None:
      return jsonify({"msg": "user not found"}), 404
    if (username == user.username or username == user.password or int(username) == int(user.phone)) and (password == user.password):
      return jsonify({"msg": "success","data": user.dict(), "access_token": create_access_token(identity=username)}), 200
    else:
      return jsonify({"msg": "unauthorized"}), 403
  except:
    return jsonify({"msg": "unauthorized"}), 405

@app.route("/trips", methods=["POST","GET"])
def trips():
  try:
    trips = Trip.query.all()
    if not trips:
      return jsonify({"msg": "no trip found!"}), 404
    return jsonify({"msg": "success","data": [trip.dict() for trip in trips]}), 200
  except:
    return jsonify({"msg": "no trip found!"}), 403
  

@app.route("/tripsFrom", methods=["POST", "GET"])
def tripsFrom():
    toLocation = request.json.get("toLocation")
    fromLocation = request.json.get("fromLocation")
    date_str = request.json.get("date")
    
    print(toLocation + " " + fromLocation + " " + date_str)
    
    try:
        date = datetime.strptime(date_str, "%d %B %Y")
        trips = Trip.query.filter_by(fromLocation=fromLocation, toLocation=toLocation, date=date).all()
        matching_trips = [trip for trip in trips if trip.date.date() == date]
        trips_list = [trip.dict() for trip in trips]
        print(date)
        print(trips_list)
        if not trips_list:
            return jsonify({"msg": "No trips found!"}), 404
        return jsonify({"msg": "success","data": trips_list}), 200
    except ValueError as e:
        return jsonify({"error": "Invalid date format"}), 400
    except Exception as e:
        return jsonify({"error": str(e)}), 500
  
from flask import request, jsonify

@app.route("/tripConfirm", methods=["POST","GET"])
def tripConfirm():
    userId = request.json.get("userId")
    tripId = request.json.get("tripId")
    seatTaken = request.json.get("seatTaken")  # ['D2', 'A2']
    seatTakenLength = request.json.get("seatTakenLength")
    loanSeatAmount = request.json.get("loanSeatAmount", 0)
    loanAmount = request.json.get("loanAmount", 0)
    
    print(seatTaken + " " + seatTakenLength + " " + tripId + " user:" + userId )

    try:
        trip = Trip.query.filter_by(id=tripId).first()
        if trip is None:
            return jsonify({"msg": "Trip not found!"}), 404

        trip.seatsAvailable = trip.seatsAvailable - int(seatTakenLength)
        if trip.seatTaken == "":
            trip.seatTaken = seatTaken.replace("[","").replace("]","").replace("'","")
        else:
          trip.seatTaken = trip.seatTaken + ", " + seatTaken.replace("[","").replace("]","").replace("'","")
                  
        user = User.query.filter_by(id=userId).first()
        if user is None:
            print("User not found!")
            return jsonify({"msg": "User not found!"}), 404

        if (user.availableLoan > 0) & (int(loanSeatAmount) > 0):
            user.balance = user.balance - float(loanAmount)
            user.availableLoan = user.availableLoan - int(loanSeatAmount)
        # else: 
        #     user.availableLoan = 0
        user_trip = BookedTrip(user_id=userId, trip_id=tripId, seatTaken=str(seatTaken), trip=trip, user=user)
        db.session.add(user_trip)
        db.session.add(trip)
        db.session.add(user)
        db.session.commit()
        return jsonify({"msg": "success", "data": user.dict()}), 201
    except Exception as e:
        print(str(e))
        return jsonify({"msg": "failed!"}), 403

@app.route("/jetSetter", methods=["POST"])
def jetSetter():
  userId = request.json.get("userId")
  packageId = request.json.get("packageId")
  
  try:
      user = User.query.filter_by(id=int(userId)).first()
      if user is None:
        return jsonify({"msg": "User not found!"}), 404
      user.package = int(packageId)
      if int(packageId) == 1:
        user.availableLoan = 1
      elif int(packageId) == 2:
        user.availableLoan = 3
      db.session.add(user)
      db.session.commit()
      return jsonify({"msg": "success", "data": user.dict()}), 200
  except Exception as e:
      print(str(e))


@app.route("/addMoney", methods=["POST"])
def addMoney():
  userId = request.json.get("userId")
  amount = request.json.get("amount")
  
  try:
    user = User.query.filter_by(id=int(userId)).first()
    if user is None:
      return jsonify({"msg": "User not found!"}), 404
    if float(amount) > 0:
      user.balance = float(user.balance) + float(amount)
      db.session.add(user)
      db.session.commit()
      return jsonify({"msg": "success", "data": user.dict()}), 200    
  except Exception as e:
    print(str(e))
    return jsonify({"msg": "failed!"}), 403

@app.route("/protected", methods=["GET"])
@jwt_required()
def protected():
    # Access the identity of the current user with get_jwt_identity
    current_user = get_jwt_identity()
    return jsonify(logged_in_as=current_user), 200

@app.route("/", methods=["GET"])
def homepage():
    return jsonify({"msg": "Hello World!"}), 200

if __name__ == "__main__":
  with app.app_context():
    db.create_all()
  app.run(debug=True, host='0.0.0.0')