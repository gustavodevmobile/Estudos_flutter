import 'package:flutter/material.dart';


void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    ));

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Demo Home Page')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => const QRViewExample(),
              // ));
            },
            child: const Text('qrView'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Código de barra'),
          )
        ],
      ),
    );
  }
}
