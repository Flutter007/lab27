import 'package:flutter/material.dart';
import 'package:lab27/data/contact.dart';
import 'package:lab27/screens/home_screen.dart';
import 'package:lab27/widget/add_contact.dart';
import 'package:lab27/widget/decor_container.dart';
import 'package:lab27/widget/info_contact.dart';

class HW extends StatefulWidget {
  const HW({super.key});

  @override
  State<HW> createState() => _HWState();
}

class _HWState extends State<HW> {
  List<Contact> contacts = [
    Contact(
      name: 'Alexey',
      surname: 'Brug',
      phone: '0999-707-555',
      email: 'alekseybrug@gmail.com',
      birthDay: DateTime(2004, 07, 19),
      counter: 1,
      isBirthDay: false,
    ),
    Contact(
      name: 'Mike',
      surname: 'Tyson',
      phone: '0555-555-555',
      email: 'tysonLev@gmail.com',
      birthDay: DateTime(1996, 06, 30),
      counter: 2,
      isBirthDay: false,
    ),
    Contact(
      name: 'Vladimir',
      surname: 'Putin',
      phone: '+7 777-777-777',
      email: 'putinVlad@mail.ru',
      birthDay: DateTime(1952, 10, 07),
      counter: 3,
      isBirthDay: false,
    ),
    Contact(
      name: 'Vladick',
      surname: 'Nephew',
      phone: 'None',
      email: 'None',
      birthDay: DateTime.now(),
      counter: 4,
      isBirthDay: false,
    ),
  ];
  void removeContact(Contact contact) {
    setState(() {
      contacts.remove(contact);
      print(contacts.length);
    });
  }

  void addContact(Contact newContact) {
    setState(() {
      newContact.counter = contacts.length + 1;
      contacts.add(newContact);
    });
  }

  void openAddContactSheet() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => AddContact(
        saveContact: addContact,
      ),
    );
  }

  void openInfoContactSheet(Contact contact) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => InfoContact(
        contact: contact,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white54,
        title: Text('EasyContacts!',
            style: Theme.of(context).textTheme.headlineSmall),
        actions: [
          IconButton(
            onPressed: openAddContactSheet,
            icon: Icon(
              Icons.add,
              color: Colors.yellow.shade900,
            ),
          ),
        ],
      ),
      body: DecorContainer(
        child: HomeScreen(
          contacts: contacts,
          openInfo: openInfoContactSheet,
          removeContact: removeContact,
        ),
      ),
    );
  }
}
