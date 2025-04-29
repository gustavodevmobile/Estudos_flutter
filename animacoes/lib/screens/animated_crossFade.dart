import 'package:flutter/material.dart';

class Animated_CrossFade extends StatefulWidget {
  const Animated_CrossFade({super.key});

  @override
  State<Animated_CrossFade> createState() => _Animated_CrossFadeState();
}

class _Animated_CrossFadeState extends State<Animated_CrossFade> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Animated_CrossFade'),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: AnimatedCrossFade(
                duration: Duration(milliseconds: 1000),
                firstChild: Container(
                  width: 200,
                  height: 200,
                  child: Center(child: Text('Texto 1')),
                  color: Colors.green,
                ),
                secondChild: Container(
                  width: 200,
                  height: 200,
                  child: Center(child: Text('Texto 2')),
                  color: Colors.amber,
                ),
                crossFadeState: selected
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
              ),
            ),
          ),
        ));
  }
}
