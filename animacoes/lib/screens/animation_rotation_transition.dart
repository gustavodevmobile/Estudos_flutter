import 'package:flutter/material.dart';

class Animation_Rotation extends StatefulWidget {
  const Animation_Rotation({super.key});

  @override
  State<Animation_Rotation> createState() => _Animation_RotationState();
}

class _Animation_RotationState extends State<Animation_Rotation>
    with TickerProviderStateMixin {
  late final AnimationController controller = AnimationController(
    duration: Duration(seconds: 2),
    vsync: this,
  );

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
        title: Text('Animation Rotation'),
      ),
      body: Center(
        child: RotationTransition(
          turns: animation,
          child: GestureDetector(
            onTap: () {
              controller.repeat();
            },
            child: Container(
              width: 100,
              height: 100,
              color: Colors.lime,
            ),
          ),
        ),
      ),
    );
  }
}
