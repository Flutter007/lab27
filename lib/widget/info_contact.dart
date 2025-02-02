import 'package:flutter/material.dart';
import 'package:lab27/data/contact.dart';
import 'package:lab27/helpers/formatted_date.dart';
import 'package:lab27/widget/info_contact_text.dart';

class InfoContact extends StatelessWidget {
  final Contact contact;
  const InfoContact({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    final bd = formatDate(contact.birthDay);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfoContactText(txt: 'Name', variable: contact.name),
          InfoContactText(txt: 'Surname', variable: contact.surname),
          InfoContactText(txt: 'Phone', variable: contact.phone),
          InfoContactText(txt: 'Email', variable: contact.email),
          InfoContactText(txt: 'BirthDay', variable: bd),
        ],
      ),
    );
  }
}
