import 'trip.dart';

class UserModel {
  final String username;
  final String password;
  final String type;
  List<TripModel> trips;

  UserModel({
    required this.username,
    required this.password,
    required this.type,
    this.trips = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'type': type,
      'trips': trips.map((e) => e.toJson()).toList(),
    };
  }

  factory UserModel.fromJson(Map data) {
    return UserModel(
      username: data['username'],
      password: data['password'],
      type: data['type'],
      trips: (data['trips'] as List)
          .map<TripModel>((e) => TripModel.fromJson(e))
          .toList(),
    );
  }
}
