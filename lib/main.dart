// ignore_for_file: prefer_const_constructors

import 'package:first_flutter_app/Admin.dart';
import 'package:first_flutter_app/Ticket.dart';
import 'package:first_flutter_app/addvacation.dart';
import 'package:first_flutter_app/booking.dart';
import 'package:first_flutter_app/helpers/db_helper.dart';
import 'package:first_flutter_app/sighn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await DBHelper.init();

  runApp(const MyApp());
}

const String _title = 'Booking App';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://i.pinimg.com/564x/cf/45/fc/cf45fce9246a7990d5f16a7d49514671.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text(_title),
          backgroundColor: Color(0xff77d9e6),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Booking App',
                    style: TextStyle(
                        color: Color(0xff351184),
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      labelText: 'User Name',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 232, 85, 208))),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                      focusColor: Color.fromARGB(5, 223, 65, 21),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      labelText: 'Password',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 232, 85, 208))),
                ),
              ),
              TextButton(
                onPressed: () {
                  //forgot password screen
                },
                child: const Text(
                  'Forgot Password',
                  style: TextStyle(color: Color.fromARGB(255, 176, 105, 206)),
                ),
              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(50.0),
                        ),
                        primary: const Color.fromARGB(255, 206, 64, 185),
                        textStyle: const TextStyle(color: Colors.black)),
                    child: const Text('Login'),
                    onPressed: () {
                      DBHelper.getUser(
                        nameController.text,
                        passwordController.text,
                      );

                      if (DBHelper.loggedInUser?.type == 'user') {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => const Booking(),
                          ),
                          (route) => false,
                        );
                      } else if (DBHelper.loggedInUser?.type == 'admin') {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => const Admin(),
                          ),
                          (route) => false,
                        );
                      }
                    },
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Does not have account?',
                    style: TextStyle(color: Color.fromARGB(255, 246, 244, 250)),
                  ),
                  TextButton(
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 230, 228, 234)),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SignUpPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
