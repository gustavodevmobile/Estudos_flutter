import 'package:flutter/material.dart';

class Animation_Sized extends StatefulWidget {
  const Animation_Sized({super.key});

  @override
  State<Animation_Sized> createState() => _Animation_SizedState();
}

class _Animation_SizedState extends State<Animation_Sized> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Size'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              selected = !selected;
            });
          },
          child: Container(
            decoration: BoxDecoration(color: Colors.indigo, borderRadius: BorderRadius.circular(10)),
            child: AnimatedSize(
              duration: Duration(seconds: 1),
              curve: Curves.easeIn,
              child: Container(
                width: selected ? 270 : 120,
                height: selected ? 50 : 50,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
