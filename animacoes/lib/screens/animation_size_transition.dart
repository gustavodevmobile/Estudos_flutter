import 'package:flutter/material.dart';

class Animation_SizeTransition extends StatefulWidget {
  const Animation_SizeTransition({super.key});

  @override
  State<Animation_SizeTransition> createState() =>
      _Animation_SizeTransitionState();
}

class _Animation_SizeTransitionState extends State<Animation_SizeTransition>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller =
      AnimationController(duration: Duration(seconds: 5), vsync: this)
        ..repeat();
  late final Animation<double> animation =
      CurvedAnimation(parent: controller, curve: Curves.ease);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Size Transition'),
      ),
      body: SizeTransition(
        sizeFactor: animation,
        axisAlignment: -0.9,
        child: Center(
          child: Container(
            width: 200,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.green
            ),
          )
          
          // Text(
          //   'Animação',
          //   style: TextStyle(
          //       fontSize: 50, fontWeight: FontWeight.w900, color: Colors.red),
          // ),
        ),
      ),
    );
  }
}
