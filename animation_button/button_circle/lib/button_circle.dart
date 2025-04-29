import 'package:flutter/material.dart';

class ButtonCircle extends StatefulWidget {
  const ButtonCircle({super.key});

  @override
  State<ButtonCircle> createState() => _ButtonCircleState();
}

class _ButtonCircleState extends State<ButtonCircle> {
  double shadowButton = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button circle'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: GestureDetector(
          onTapUp: (_) {
            setState(() {
              shadowButton = 10;
              print('foi');
            });
          },
          onTapDown: (_) {
            setState(() {
              shadowButton = 0;
              print('cancelou');
            });
          },
          child: Container(
            width: 120,
            height: 120,
            //color: Colors.black12,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                    bottom: 0,
                    child: Container(
                        height: 110,
                        width: 110,
                        decoration: BoxDecoration(
                            color: Colors.black87, shape: BoxShape.circle),),),
                AnimatedPositioned(
                  curve: Curves.easeIn,
                  duration: Duration(milliseconds: 100),
                  bottom: shadowButton,
                  child: Container(
                      alignment: Alignment.center,
                      height: 110,
                      width: 110,
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        shape: BoxShape.circle,
                        // border: Border.all(
                        //   color: Colors.white,
                        //   width: 1
                        // )
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Click me',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
