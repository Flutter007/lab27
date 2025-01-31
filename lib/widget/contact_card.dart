import 'package:flutter/material.dart';
import 'package:lab27/data/contact.dart';

class ContactCard extends StatelessWidget {
  final Contact contact;
  final void Function() openInfo;
  const ContactCard({
    super.key,
    required this.contact,
    required this.openInfo,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: openInfo,
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(7),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.contact_mail_outlined),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  '${contact.name} ${contact.surname}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  width: 180,
                ),
                Icon(Icons.cake_rounded),
              ],
            )
          ],
        ),
      )),
    );
  }
}
