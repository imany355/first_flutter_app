// ignore_for_file: prefer_const_constructors, e

import 'package:flutter/material.dart';
import 'package:first_flutter_app/main.dart';

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
          title: Text("Travels")),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          FlightCard(
            title: "From your heart to my heart",
            subtitle: '8:30 PM',
            icon: Icons.airplanemode_active_rounded,
            color: Colors.green.shade100,
          ),
          FlightCard(
            title: "From Jeddah to Khartoum",
            subtitle: '8:30 PM',
            icon: Icons.airplanemode_active_rounded,
            color: Colors.red.shade100,
          ),
          FlightCard(
            title: "From Khartoum to Canada",
            subtitle: '8:30 PM',
            icon: Icons.airplanemode_active_rounded,
            color: Colors.blue.shade100,
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class FlightCard extends StatelessWidget {
  const FlightCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });
  final String title;
  final String subtitle;
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
              icon: Icon(Icons.add),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {},
            ),
          ],
        ),
        leading: Icon(icon, color: Colors.cyan, size: 45),
        title: Text(
          title,
          style: TextStyle(fontSize: 20),
        ),
        subtitle: Text(subtitle),
      ),
    );
  }
}
