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
    final theme = Theme.of(context).textTheme.titleLarge;
    final now = DateTime.now();
    contact.isBirthDay =
        contact.birthDay.month == now.month && contact.birthDay.day == now.day;
    return SizedBox(
      child: GestureDetector(
        onTap: openInfo,
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(7),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '№ ${contact.counter.toString()}',
                      style: theme,
                    ),
                    IconButton(
                      onPressed: openInfo,
                      icon: Icon(Icons.people_alt),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Text(
                        '${contact.name} ${contact.surname}',
                        style: theme,
                      ),
                    ),
                    Icon(
                      contact.isBirthDay ? Icons.cake_rounded : Icons.timer,
                      size: 35,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
