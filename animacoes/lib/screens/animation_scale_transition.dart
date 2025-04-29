import 'dart:async';

import 'package:flutter/material.dart';

class Animation_Scale extends StatefulWidget {
  const Animation_Scale({super.key});

  @override
  State<Animation_Scale> createState() => _Animation_ScaleState();
}

class _Animation_ScaleState extends State<Animation_Scale>

    with TickerProviderStateMixin {
  late final AnimationController controller =
      AnimationController(vsync: this, duration: Duration(seconds: 2))..repeat(reverse: true);
  late final Animation<double> animation =
      CurvedAnimation(parent: controller, curve: Curves.bounceIn);
      
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Scale'),
      ),
      body: Center(
        child: ScaleTransition(
          scale: animation,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.blueGrey,
          ),
        ),
      ),
    );
  }
}
