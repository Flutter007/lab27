import 'package:flutter/material.dart';

class DecorContainer extends StatelessWidget {
  final Widget child;
  const DecorContainer({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
