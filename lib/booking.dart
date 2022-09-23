// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore

import 'package:first_flutter_app/helpers/db_helper.dart' show DBHelper;
import 'package:first_flutter_app/models/trip.dart';
import 'package:first_flutter_app/widgets/flutter_ticket_widget.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_app/main.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);
  @override
  State<Booking> createState() => BookingState();
}

class BookingState extends State<Booking> {
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
          title: Text("Welcome, ${DBHelper.loggedInUser?.username}"),
        ),
        body: ValueListenableBuilder(
            valueListenable: DBHelper.tripsBox.listenable(),
            builder: (context, box, widget) {
              final trips = box.values.map((e) => TripModel.fromJson(e));
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  for (final trip in trips)
                    FlightCard(
                      trip: trip,
                      icon: Icons.airplanemode_active_rounded,
                      color: Colors.green.shade100,
                    ),
                ],
              );
            }));
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
            if (false) FlutterLogo(),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: ((context) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlutterTicketWidget(
                          width: 350.0,
                          height: 500.0,
                          isCornerRounded: true,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      width: 120.0,
                                      height: 25.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        border: Border.all(
                                            width: 1.0, color: Colors.green),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Business Class',
                                          style: TextStyle(color: Colors.green),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          'SLM',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Icon(
                                            Icons.flight_takeoff,
                                            color: Colors.pink,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            'BTL',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Text(
                                    'Flight Ticket',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 25.0),
                                  child: Column(
                                    children: <Widget>[
                                      ticketDetailsWidget('Passengers', 'Ilona',
                                          'Date', '24-12-2018'),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 12.0, right: 40.0),
                                        child: ticketDetailsWidget('Flight',
                                            '76836A45', 'Gate', '66B'),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 12.0, right: 40.0),
                                        child: ticketDetailsWidget(
                                            'Class', 'Business', 'Seat', '21B'),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 80.0, left: 30.0, right: 30.0),
                                  child: Container(
                                    width: 250.0,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/barcode.png'),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, left: 75.0, right: 75.0),
                                  child: Text(
                                    '9824 0972 1742 1298',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: const Color(0xff77d9e6),
                                  textStyle:
                                      const TextStyle(color: Colors.black)),
                              child: const Text('Confirm'),
                              onPressed: () {
                                DBHelper.addTripToLoggedinUser(trip);
                                Navigator.of(context).pop();
                              },
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: const Color(0xff77d9e6),
                                  textStyle:
                                      const TextStyle(color: Colors.black)),
                              child: const Text('Exit'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      ],
                    );
                  }),
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

  Widget ticketDetailsWidget(String firstTitle, String firstDesc,
      String secondTitle, String secondDesc) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                firstTitle,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  firstDesc,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                secondTitle,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  secondDesc,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
