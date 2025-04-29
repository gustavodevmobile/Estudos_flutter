import 'package:flutter/material.dart';

class Animated_PhysicalModel extends StatefulWidget {
  const Animated_PhysicalModel({super.key});

  @override
  State<Animated_PhysicalModel> createState() => _Animated_PhysicalModelState();
}

class _Animated_PhysicalModelState extends State<Animated_PhysicalModel> {
  bool _isElevation = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Physical Model'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: AnimatedPhysicalModel(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isElevation = !_isElevation;
                  });
                },
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.lightBlue,
                ),
              ),
              color: Colors.lightBlue,
              shadowColor: Colors.blue,
              duration: Duration(seconds: 1),
              elevation: _isElevation ? 20 : 0,
              borderRadius: BorderRadius.circular(20),
              curve: Curves.easeIn,
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(bottom: 20.0),
          //   child: ElevatedButton(
          //       onPressed: () {
          //         setState(() {
          //           _isElevation = !_isElevation;
          //         });
          //       },
          //       child: Text(_isElevation ? 'Para Cima' : 'Para Baixo')),
          // )
        ],
      ),
    );
  }
}
