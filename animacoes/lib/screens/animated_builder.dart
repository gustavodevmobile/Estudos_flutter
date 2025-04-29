import 'dart:math';

import 'package:flutter/material.dart';

class Animated_Builder extends StatefulWidget {
  @override
  _Animated_BuilderState createState() => _Animated_BuilderState();
}

class _Animated_BuilderState extends State<Animated_Builder>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2), // Animation duration
      vsync: this,
    );
    _animation = Tween<double>(begin: 50.0, end: 200.0)
        .animate(_controller); // Tween animation
    _controller.forward(); // Start the animation
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedBuilder Demo'), // App bar title
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget? child) {
            return Container(
              width: _animation.value, // Animate the width
              height: _animation.value, // Animate the height
              color: Colors.green, // Container background color
              child: Center(
                child: Text(
                  'Hello',
                  style: TextStyle(color: Colors.white), // Text color
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the animation controller
    super.dispose();
  }
}
