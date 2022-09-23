// ignore_for_file: prefer_const_constructors

import 'package:first_flutter_app/helpers/db_helper.dart';
import 'package:first_flutter_app/models/trip.dart';
import 'package:flutter/material.dart';

class Add extends StatefulWidget {
  const Add({Key? key, this.trip}) : super(key: key);
  final TripModel? trip;
  @override
  State<Add> createState() => AddState();
}

class AddState extends State<Add> {
  TextEditingController titleController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController noController = TextEditingController();
  @override
  void initState() {
    super.initState();
    titleController.text = widget.trip?.title ?? '';
    timeController.text = widget.trip?.time ?? '';
    noController.text = widget.trip?.no ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Add Location',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 11, 14, 103),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: titleController,
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
                controller: timeController,
                decoration: const InputDecoration(
                  focusColor: Color.fromARGB(5, 223, 65, 21),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
            ),
            Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Add No ',
                  style: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 11, 14, 103)),
                )),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                controller: noController,
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
                      Icons.add,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      DBHelper.saveTrip(TripModel(
                        title: titleController.text,
                        time: timeController.text,
                        no: noController.text,
                      ));
                      Navigator.of(context).pop();
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
