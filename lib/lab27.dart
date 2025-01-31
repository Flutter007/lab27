import 'package:flutter/material.dart';
import 'package:lab27/data/contact.dart';

import 'package:lab27/screens/home_screen.dart';
import 'package:lab27/widget/decor_container.dart';

class HW extends StatefulWidget {
  const HW({super.key});

  @override
  State<HW> createState() => _HWState();
}

class _HWState extends State<HW> {
  late Widget screen;
  List<Contact> contacts = [
    Contact(
        name: 'Alexey',
        surname: 'Brug',
        phone: 0999707555,
        email: 'alekseybrug@gmail.com',
        birthDay: DateTime(2004, 7, 19),
        counter: 1),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: DecorContainer(
            child: HomeScreen(
          contacts: contacts,
          openInfo: () {},
        )),
      ),
    );
  }
}
