import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
              crossAxisCount: 3,
              children: List.generate(13, (index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, index.toString());
                  },
                  child: Card(
                    child: Center(
                      child: Text('$index'),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
