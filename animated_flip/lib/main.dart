import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ThemeData.dark(),
      title: 'Animated_flip',
      home: ExemploAnimatedFlip(),
    );
  }
}

class ExemploAnimatedFlip extends StatefulWidget {
  const ExemploAnimatedFlip({super.key});

  @override
  State<ExemploAnimatedFlip> createState() => _ExemploAnimatedFlipState();
}

class _ExemploAnimatedFlipState extends State<ExemploAnimatedFlip> {
  bool isFlipped = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Flip'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CardContainer(),
          ),
          ExempleTween(),
          //ExemploTransformMatrix4()
        ],
      ),
    );
  }
}

class CardContainer extends StatefulWidget {
  const CardContainer({super.key});

  @override
  State<CardContainer> createState() => _CardContainerState();
}

class _CardContainerState extends State<CardContainer>
    with SingleTickerProviderStateMixin {
  bool isFront = true;
  late AnimationController flipController;
  late Animation<double> flipAnimation;

  @override
  void initState() {
    super.initState();
    flipController = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );

    flipAnimation = Tween(
      begin: 0.0,
      end: pi,
    ).animate(CurvedAnimation(parent: flipController, curve: Curves.linear));

    flipController.addListener(() {
      if (flipController.value >= 0.5 && isFront) {
        setState(() {
          isFront = false;
        });
      } else if (flipController.value < 0.5 && !isFront) {
        setState(() {
          isFront = true;
        });
      }
    });
  }

  @override
  void dispose() {
    flipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isFront) {
            flipController.forward();
          } else {
            flipController.reverse();
          }
        });
      },
      child: AnimatedBuilder(
        animation: flipAnimation,
        builder: (context, child) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.0012)
              ..rotateY(flipAnimation.value),
            child: child,
          );
        },
        child: isFront
            ? FrontCard()
            : Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.0012)
                  ..rotateY(pi),
                child: BackCard(),
              ),
      ),
    );
  }
}

class FrontCard extends StatelessWidget {
  const FrontCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 9,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.lightBlueAccent,
        ),
        child: Center(
          child: Text(
            'F',
            style: TextStyle(fontSize: 90, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class BackCard extends StatelessWidget {
  const BackCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 9,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.amber,
        ),
        child: Center(
          child: Text(
            'B',
            style: TextStyle(fontSize: 90, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class ExempleTween extends StatefulWidget {
  const ExempleTween({super.key});

  @override
  State<ExempleTween> createState() => _ExempleTweenState();
}

class _ExempleTweenState extends State<ExempleTween>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animationColor1;
  late Animation animationColor2;
  late Animation sizeBox;
  bool isReverse = false;

  @override
  void initState() {
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    animationColor1 =
        ColorTween(begin: Colors.white24, end: Colors.blue).animate(controller);
    animationColor2 =
        ColorTween(begin: Colors.blue, end: Colors.white).animate(controller);
    sizeBox = Tween<double>(begin: 50, end: 200).animate(controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isReverse = !isReverse;
        if (isReverse) {
          controller.forward();
        } else {
          controller.reverse();
        }
      },
      child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [animationColor1.value, animationColor2.value])),
            );
          }),
    );
  }
}

class ExemploTransformMatrix4 extends StatefulWidget {
  const ExemploTransformMatrix4({super.key});

  @override
  State<ExemploTransformMatrix4> createState() =>
      _ExemploTransformMatrix4State();
}

class _ExemploTransformMatrix4State extends State<ExemploTransformMatrix4> {
  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity(),
      child: Container(
        width: 100,
        height: 100,
        color: Colors.green,
      ),
    );
  }
}
