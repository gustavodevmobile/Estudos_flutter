import 'package:flutter/material.dart';

class RegisterCard extends StatelessWidget {
  final String title;
  final String contain;
  const RegisterCard(this.title, this.contain, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
            ),
            TextSpan(
              text: contain,
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
