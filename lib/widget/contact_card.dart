import 'package:flutter/material.dart';
import 'package:lab27/data/contact.dart';

class ContactCard extends StatelessWidget {
  final Contact contact;
  final void Function() openInfo;
  final void Function(Contact) removeContact;

  const ContactCard({
    super.key,
    required this.contact,
    required this.openInfo,
    required this.removeContact,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme.titleLarge;
    final now = DateTime.now();
    contact.isBirthDay =
        contact.birthDay.month == now.month && contact.birthDay.day == now.day;
    return Dismissible(
      key: Key(contact.counter.toString()),
      onDismissed: (direction) {
        removeContact(contact);
      },
      background: Container(
        color: Colors.red,
      ),
      child: SizedBox(
        child: GestureDetector(
          onTap: openInfo,
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '№ ${contact.counter.toString()}',
                        style: theme,
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.people_alt, size: 30),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Text(
                          '${contact.name} ${contact.surname}',
                          style: theme,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        contact.isBirthDay
                            ? Icons.cake_rounded
                            : Icons.sentiment_satisfied_alt_outlined,
                        size: 35,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
