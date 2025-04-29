import 'package:flutter/material.dart';

class Animated_Container extends StatefulWidget {
  Animated_Container({super.key});

  @override
  State<Animated_Container> createState() => _Animated_ContainerState();
}

class _Animated_ContainerState extends State<Animated_Container>
    with TickerProviderStateMixin {
  late AnimationController controller;
  bool selected = false;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    controller.stop();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  String textLinearProgress = 'Buscar';
  double widht = 100;
  double height = 40;
  Color colorBtn = Colors.black38;

  void startAnimation() {
    setState(() {
      selected = !selected;
      if (selected) {
        widht = 250;
        height - 40;
      }
    });
    buttonProgress();
  }

  void buttonProgress() {
    Future.delayed(Duration(milliseconds: 2300)).then((value) {
      if (widht == 250) {
        setState(() {
          controller.forward(from: controller.value);
          Future.delayed(Duration(seconds: 5)).then((value) {
            if (controller.isCompleted) {
              setState(() {
                textLinearProgress = 'Pronto!';
              });
            }
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated_Container'),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: GestureDetector(
            onTap: () {
              startAnimation();

              // selected = !selected;
              // if(widht == 250)
              // setState(() {
              //   if (selected) {
              //     controller.forward(from: controller.value);
              //     print(controller.isCompleted);
              //   }
              //   Future.delayed(Duration(seconds: 5)).then((value) {
              //     if (controller.isCompleted) {
              //       setState(() {
              //         textLinearProgress = 'Pronto!';
              //       });
              //     }
              //   });
              // });
            },
            child: Center(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 2000),
                width: selected ? widht = 250 : widht,
                height: selected ? height : height,
                decoration: BoxDecoration(
                    //color: Colors.indigo,
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(20)),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    LinearProgressIndicator(
                      backgroundColor: Colors.black38,
                      color: Colors.green[400],
                      value: controller.value,
                      minHeight: 40,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    Text(
                      textLinearProgress,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
