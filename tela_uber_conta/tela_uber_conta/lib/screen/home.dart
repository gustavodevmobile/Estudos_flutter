import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tela_uber_conta/sections/accountActions.dart';
import 'package:tela_uber_conta/sections/appBar.dart';
import 'package:tela_uber_conta/sections/balance.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leadingWidth: 400,
        toolbarHeight: 70,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                color: Color.fromRGBO(75, 75, 75, 1),
                borderRadius: BorderRadius.circular(50),
                ),
                child: const Text(
                  'GC',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              const Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Gustavo',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    Row(
                      children:[
                        Icon(Icons.star_half, color:Colors.white, size: 12,), 
                        Text(
                          'Azul',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ],
                    ),
                  ], 
                ),
              ),
               Padding(
                 padding: const EdgeInsets.only(left:16.0),
                 child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white, size: 15,),
               ),
            ],
          ),
        ),
      ),
      body: ListView(children: <Widget>[
        Balance(),
        AccountActions(),
      ]),
    );
  }
}
