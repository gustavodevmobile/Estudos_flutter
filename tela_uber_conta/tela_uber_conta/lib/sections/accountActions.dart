import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tela_uber_conta/components/actionsButtons.dart';

class AccountActions extends StatelessWidget {
  const AccountActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
          height: 120,
          decoration: BoxDecoration(color: Colors.white),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Icon(Icons.arrow_back_ios_rounded, size: 15,),
              ActionsButtom('Emprestimo', Icon(Icons.access_alarm_outlined)),
              ActionsButtom('Pagar', Icon(Icons.account_balance_wallet_sharp)),
              ActionsButtom(
                  'Pix', Icon(Icons.transfer_within_a_station_outlined)),
              ActionsButtom('Debitos\nVeicular', Icon(Icons.cancel_outlined)),
              ActionsButtom('Transferir', Icon(Icons.account_balance_wallet_sharp)),
              ActionsButtom('Recarga', Icon(Icons.add_call)),
              ActionsButtom('Receber', Icon(Icons.discount))
              
            ],
          )),
    );
  }
}
