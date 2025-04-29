import 'package:flutter/material.dart';

class Animated_Align extends StatefulWidget {
  const Animated_Align({super.key});

  @override
  State<Animated_Align> createState() => _Animated_AlignState();
}

class _Animated_AlignState extends State<Animated_Align> {
  bool selected = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated_Align'),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            selected = !selected;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 500,
            decoration: BoxDecoration(color: Colors.amber),
            child: AnimatedAlign(
              alignment: selected ? Alignment.topRight : Alignment.bottomCenter,
              duration: Duration(milliseconds: 2000),
              curve: Curves.ease,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
