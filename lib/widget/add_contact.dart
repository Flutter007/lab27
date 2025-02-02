import 'package:flutter/material.dart';
import 'package:lab27/data/contact.dart';
import 'package:lab27/helpers/formatted_date.dart';

class AddContact extends StatefulWidget {
  final void Function(Contact newContact) saveContact;

  const AddContact({
    super.key,
    required this.saveContact,
  });

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  var name = '';
  var surname = '';
  var phone = '';
  var email = '';
  late int counter = 1;
  var birthDay = DateTime.now();
  final dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dateController.text = formatDate(birthDay);
  }

  void tapSave() {
    final selectedBirthDay = DateTime(
      birthDay.year,
      birthDay.month,
      birthDay.day,
    );

    final addContact = Contact(
      name: name,
      surname: surname,
      phone: phone,
      email: email,
      birthDay: selectedBirthDay,
      counter: counter,
      isBirthDay: false,
    );
    widget.saveContact(addContact);

    Navigator.pop(context);
  }

  void onBirthDayTap() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 100, now.month, now.day);
    final lastDate = DateTime(now.year, now.month, now.day);

    final finalDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
      initialDate: birthDay,
    );

    if (finalDate != null) {
      setState(() {
        birthDay = finalDate;
        dateController.text = formatDate(finalDate);
      });
    }
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                child: TextField(
                  onTap: onBirthDayTap,
                  readOnly: true,
                  controller: dateController,
                  decoration: InputDecoration(
                    label: Text('BirthDay!'),
                  ),
                ),
              ),
              SizedBox(width: 15),
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
