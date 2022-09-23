import 'package:hive_flutter/hive_flutter.dart';

import '../models/trip.dart';
import '../models/user.dart';

class DBHelper {
  static UserModel? loggedInUser;
  static late Box usersBox;
  static late Box tripsBox;

  static Future<void> init() async {
    await Hive.initFlutter();
    usersBox = await Hive.openBox('users_box');
    tripsBox = await Hive.openBox('trips_box');
  }

  static void saveUser(UserModel user) async {
    if (usersBox.containsKey(user.username)) return;
    usersBox.put(user.username, user.toJson());
    loggedInUser = user;
  }

  static void updateUser(UserModel user) async {
    usersBox.put(user.username, user.toJson());
    loggedInUser = user;
  }

  static void getUser(String username, String password) async {
    if (usersBox.containsKey(username)) {
      final user = UserModel.fromJson(usersBox.get(username));
      if (user.password == password) {
        loggedInUser = user;
      } else {
        print('Wrong Password');
      }
    }
  }

  static void saveTrip(TripModel trip) async {
    tripsBox.put(trip.no, trip.toJson());
  }

  static void delTrip(TripModel trip) async {
    tripsBox.delete(trip.no);
  }

  static void addTripToLoggedUser(TripModel trip) async {
    loggedInUser!.trips = [...loggedInUser!.trips, trip];
    updateUser(loggedInUser!);
  }

  static void removeTripFromLoggedUser(TripModel trip) async {
    loggedInUser!.trips =
        loggedInUser!.trips.where((element) => element != trip).toList();
    updateUser(loggedInUser!);
  }
}
