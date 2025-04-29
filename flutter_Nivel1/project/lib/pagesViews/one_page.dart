import 'package:flutter/material.dart';

class OnePage extends StatelessWidget {
  const OnePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Center(
              child: Text(
            'Texto',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          )),
        ),
        Row(
          children: [
            Container(
              width: 150,
              height: 100,
              decoration: BoxDecoration(color: Colors.blueGrey),
            ),
          ],
        )
      ],
    );
  }
}
