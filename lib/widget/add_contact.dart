import 'package:flutter/material.dart';
import 'package:lab27/data/contact.dart';

class AddContact extends StatefulWidget {
  final void Function(Contact newContact) saveContact;
  const AddContact({super.key, required this.saveContact});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  var name = '';
  var surname = '';
  var phone = '';
  var email = '';
  var birthDay = DateTime.now();
  var counter = 1;

  void tapSave() {
    final addContact = Contact(
        name: name,
        surname: surname,
        phone: phone,
        email: email,
        birthDay: birthDay,
        counter: counter);
    widget.saveContact(addContact);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    bool isFull = name != '';
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: (value) => setState(() {
                    name = value;
                  }),
                  decoration: InputDecoration(
                    label: Text('Name'),
                  ),
                ),
              ),
              SizedBox(
                width: 40,
              ),
              Expanded(
                child: TextField(
                  onChanged: (value) => setState(() {
                    surname = value;
                  }),
                  decoration: InputDecoration(
                    label: Text('Surname'),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: (value) => setState(() {
                    phone = value;
                  }),
                  decoration: InputDecoration(
                    label: Text('Phone Number'),
                  ),
                ),
              ),
              SizedBox(
                width: 40,
              ),
              Expanded(
                child: TextField(
                  onChanged: (value) => setState(() {
                    email = value;
                  }),
                  decoration: InputDecoration(
                    label: Text('Email'),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: ElevatedButton(
                onPressed: isFull ? tapSave : null,
                child: Text('Save'),
              )),
            ],
          ),
        ],
      ),
    );
  }
}
