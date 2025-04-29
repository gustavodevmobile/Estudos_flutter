import 'package:animacoes/screens/animated_align.dart';
import 'package:animacoes/screens/animated_builder.dart';
import 'package:animacoes/screens/animated_container.dart';
import 'package:animacoes/screens/animated_crossFade.dart';
import 'package:animacoes/screens/animated_physical_model.dart';
import 'package:animacoes/screens/animated_positioned.dart';
import 'package:animacoes/screens/animated_text_style_transition.dart';
import 'package:animacoes/screens/animation_rotation_transition.dart';
import 'package:animacoes/screens/animation_scale_transition.dart';
import 'package:animacoes/screens/animation_size.dart';
import 'package:animacoes/screens/animation_size_transition.dart';
import 'package:animacoes/screens/button_progress.dart';
import 'package:animacoes/screens/home.dart';
import 'package:animacoes/screens/positioned_transition.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData(appBarTheme: AppBarTheme(backgroundColor: Colors.blue)),
        initialRoute: 'home',
        routes: {
          'home': (context) => const Home(),
          '0': (context) => const Animated_Align(),
          '1': (context) => Animated_Builder(),
          '2': (context) => Animated_Container(),
          '3': (context) => const Animated_CrossFade(),
          '4': (context) => const Animated_TextStyleTransition(),
          '5': (context) => const Animated_PhysicalModel(),
          '6': (context) => const Animated_Positioned(),
          '7': (context) => const Animation_Sized(),
          '8': (context) => const Positioned_Transition(),
          '9': (context) => const Animation_Rotation(),
          '10': (context) => const Animation_Scale(),
          '11': (context) => const Animation_SizeTransition(),
          '12': (context) => ButtonProgress()
        });
  }
}
