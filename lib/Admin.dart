// ignore_for_file: prefer_const_constructors, e

import 'package:first_flutter_app/addvacation.dart';
import 'package:first_flutter_app/helpers/db_helper.dart';
import 'package:first_flutter_app/models/trip.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_app/main.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);
  @override
  State<Admin> createState() => AdminState();
}

class AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xff77d9e6),
          actions: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.chat),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.email),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: IconButton(
                iconSize: 30,
                icon: Icon(
                  Icons.logout_rounded,
                ),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const MyApp(),
                    ),
                    (route) => false,
                  );
                },
              ),
            ),
          ],
          title: Text('Manage Vacation')),
      body: ValueListenableBuilder(
          valueListenable: DBHelper.tripsBox.listenable(),
          builder: (context, box, widget) {
            final trips = box.values.map((e) => TripModel.fromJson(e));

            return Column(
              mainAxisSize: MainAxisSize.min,
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                for (final trip in trips)
                  FlightCard(
                    trip: trip,
                    icon: Icons.airplanemode_active_rounded,
                    color: Colors.red.shade100,
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xff77d9e6),
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Add(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
    );
  }
}

class FlightCard extends StatelessWidget {
  const FlightCard({
    super.key,
    required this.trip,
    required this.icon,
    required this.color,
  });
  final TripModel trip;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      color: color,
      shadowColor: Colors.blueGrey,
      elevation: 10,
      child: ListTile(
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                DBHelper.delTrip(trip);
              },
            ),
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Add(trip: trip),
                  ),
                );
              },
            ),
          ],
        ),
        leading: Icon(icon, color: Colors.cyan, size: 45),
        title: Text(
          trip.title,
          style: TextStyle(fontSize: 20),
        ),
        subtitle: Text(trip.time),
      ),
    );
  }
}
