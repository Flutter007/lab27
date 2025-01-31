import 'package:flutter/material.dart';

class DecorContainer extends StatelessWidget {
  final Widget child;
  const DecorContainer({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white54,
          title: Text('EasyContacts!',
              style: Theme.of(context).textTheme.headlineSmall),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                colors: [
                  Colors.yellowAccent.shade400,
                  Colors.yellowAccent.shade100,
                ]),
          ),
          child: child,
        ));
  }
}
