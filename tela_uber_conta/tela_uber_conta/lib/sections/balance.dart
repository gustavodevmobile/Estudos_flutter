import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tela_uber_conta/custom_icon_icons.dart';

class Balance extends StatelessWidget {
  const Balance({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  // color: Colors.black26,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset('assets/images/backGroud_space.png'),
              ),
            ),
            const Text('Saldo disponível', style: TextStyle(fontSize: 15),),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('R\$ 1.000.000', style: TextStyle(fontSize: 30),),
                Icon(Icons.add_home_work_rounded)
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top:16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(50),
                    ),
                    height:32,
                      child: Padding(
                        padding: const EdgeInsets.only(top:2, left: 10, right: 10, bottom: 2),
                        child: Text('Extrato'),
                      ),
                    ),
                  Container(
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                       color: Colors.black12,
                       borderRadius: BorderRadius.circular(50),
                    ),
                    height: 32,
                    child: Padding(
                      padding: const EdgeInsets.only(top:2, left: 10, right: 10, bottom: 2),
                      child: Text('Ganhos Uber'),
                    ),
                  ),
                  Container(
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                       color: Colors.black12,
                       borderRadius: BorderRadius.circular(50),
                    ),
                    height: 32,
                    child: Padding(
                      padding: const EdgeInsets.only(top:2, left: 10, right: 10, bottom: 2),
                      child: Text('Investimentos'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
