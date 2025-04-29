import 'package:flutter/material.dart';
import 'package:forms/dates/task_inherited.dart';

class TotLevel extends StatefulWidget {
  const TotLevel({super.key});

  @override
  State<TotLevel> createState() => _TotLevelState();
}

class _TotLevelState extends State<TotLevel> {
  double totLevel = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Task App'),
        Container(
            decoration: const BoxDecoration(color: Colors.white24),
            child: Row(
              children: [
                const SizedBox(
                  width: 200,
                  child: LinearProgressIndicator(
                    value: 5 / 10,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text('Level: $totLevel'),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        totLevel += TaskInherited.of(context).teste;
                        print(TaskInherited.of(context).teste);
                      });
                    },
                    icon: const Icon(Icons.update))
              ],
            ))
      ],
    );
  }
}
