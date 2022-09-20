// ignore_for_file: prefer_const_constructors

import 'package:first_flutter_app/booking.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => AddState();
}

class AddState extends State<Add> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add'),
          backgroundColor: Color(0xff77d9e6),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Your Vacation',
                    style: TextStyle(
                        color: Color.fromARGB(255, 9, 13, 97),
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Add Location',
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 11, 14, 103)),
                  )),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                ),
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Add Time',
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 11, 14, 103)),
                  )),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    focusColor: Color.fromARGB(5, 223, 65, 21),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xff77d9e6),
                    child: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xff77d9e6),
                    child: IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.red,
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
