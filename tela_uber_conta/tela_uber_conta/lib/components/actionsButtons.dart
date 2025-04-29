import 'package:flutter/material.dart';

class ActionsButtom extends StatelessWidget {
  final String text;
  final Icon icon;
  const ActionsButtom(this.text, this.icon,{super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        child: Column(
          children: [
          Container(
            alignment: AlignmentDirectional.center,
            width:50,
            height:50,
            decoration: BoxDecoration(
              color: Color.fromRGBO(245, 245, 245, 1),
              borderRadius: BorderRadius.circular(50)
            ),
            child: icon,
          ),
          Text(text)
          ],
        ),
      ),
    );
  }
}
