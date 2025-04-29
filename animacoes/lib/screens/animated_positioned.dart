import 'package:flutter/material.dart';

class Animated_Positioned extends StatefulWidget {
  const Animated_Positioned({super.key});

  @override
  State<Animated_Positioned> createState() => _Animated_PositionedState();
}

class _Animated_PositionedState extends State<Animated_Positioned> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Animation Positioned'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  AnimatedPositioned(
                    width: selected ? 200 : 50,
                    height: selected ? 50 : 200,
                    bottom: selected ? 600 : 60,
                    child: GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            selected = !selected;
                          },
                        );
                      },
                      child: ColoredBox(
                        color: Colors.black,
                        child: Text('OnTap'),
                      ),
                    ),
                    duration: Duration(seconds: 1),
                    curve: Curves.ease,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
