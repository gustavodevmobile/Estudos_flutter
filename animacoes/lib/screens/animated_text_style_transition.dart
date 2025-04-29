import 'package:flutter/material.dart';

class Animated_TextStyleTransition extends StatefulWidget {
  const Animated_TextStyleTransition({super.key});

  @override
  State<Animated_TextStyleTransition> createState() =>
      _Animated_TextStyleTransitionState();
}

class _Animated_TextStyleTransitionState
    extends State<Animated_TextStyleTransition> with TickerProviderStateMixin {
  late AnimationController _controller;
  late TextStyleTween _styleTween;
  late CurvedAnimation _curvedAnimation;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this)
          ..repeat(reverse: true);
    _styleTween = TextStyleTween(
        begin: TextStyle(
            fontSize: 16, color: Colors.blue, fontWeight: FontWeight.w100),
        end: TextStyle(
            fontSize: 50, color: Colors.red, fontWeight: FontWeight.w900));
    _curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Text Style Transition'),
      ),
      body: Center(
        child: DefaultTextStyleTransition(
            style: _styleTween.animate(_curvedAnimation),
            child: Text('Animações no Flutter')),
      ),
    );
  }
}
