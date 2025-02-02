import 'package:flutter/material.dart';
import 'package:lab27/data/contact.dart';
import 'package:lab27/widget/contact_card.dart';

class HomeScreen extends StatelessWidget {
  final List<Contact> contacts;
  final void Function(Contact) openInfo;
  final void Function(Contact) removeContact;

  const HomeScreen({
    super.key,
    required this.contacts,
    required this.openInfo,
    required this.removeContact,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: contacts
                      .map((contact) => ContactCard(
                            contact: contact,
                            openInfo: () => openInfo(contact),
                            removeContact: removeContact,
                          ))
                      .toList(),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
