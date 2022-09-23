import 'package:flutter/material.dart';

import 'Admin.dart';
import 'booking.dart';
import 'helpers/db_helper.dart';
import 'main.dart';
import 'models/user.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String validty = 'user';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://i.pinimg.com/564x/cf/45/fc/cf45fce9246a7990d5f16a7d49514671.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('SignUpPage'),
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
                    'Booking App',
                    style: TextStyle(
                        color: Color.fromARGB(255, 9, 13, 97),
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 11, 14, 103)),
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
                          TextStyle(color: Color.fromARGB(255, 34, 2, 73))),
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
                          TextStyle(color: Color.fromARGB(255, 57, 5, 83))),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                      value: "admin",
                      groupValue: validty,
                      onChanged: (val) {
                        setState(() {
                          validty = val!;
                          print(validty);
                        });
                      }),
                  Text(
                    "ADMIN",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 244, 244, 247)),
                  ),
                  Radio(
                      value: "user",
                      groupValue: validty,
                      onChanged: (val) {
                        setState(() {
                          validty = val!;
                          print(validty);
                        });
                      }),
                  Text(
                    "USER",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Color.fromARGB(255, 242, 242, 246),
                    ),
                  )
                ],
              ),
              TextButton(
                onPressed: () {
                  //forgot password screen
                },
                child: const Text(
                  '',
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
                    child: const Text('Sign Up'),
                    onPressed: () {
                      if (nameController.text.isEmpty ||
                          passwordController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Enter username and password'),
                            backgroundColor: Colors.red,
                          ),
                        );
                        return;
                      }

                      DBHelper.saveUser(UserModel(
                        username: nameController.text,
                        password: passwordController.text,
                        type: validty,
                      ));

                      if (DBHelper.loggedInUser == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Already registered'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else if (DBHelper.loggedInUser?.type == 'user') {
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
                    'have account?',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 227, 229, 235)),
                  ),
                  TextButton(
                    child: const Text(
                      'login',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 235, 234, 239)),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MyApp(),
                        ),
                      );
                      //signup screen
                    },
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
