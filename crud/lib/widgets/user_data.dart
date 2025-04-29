import 'package:crud/widgets/register_card.dart';
import 'package:flutter/material.dart';

class Person extends StatefulWidget {
  // final int? id;
  final String name;
  final int dateBirth;
  final String email;
  final int phone;
  final String city;
  final String state;
  final String password;
  Person(this.name, this.dateBirth, this.email, this.phone, this.city,
      this.state, this.password,
      {super.key});

  @override
  State<Person> createState() => _PersonState();
}

class _PersonState extends State<Person> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
              // margin: EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width,
              height: 155,
              decoration: BoxDecoration(
                  color: Colors.blue[100],
                  // border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.blue,
                        blurRadius: 7,
                        spreadRadius: 2,
                        offset: Offset(0, -1)),
                  ]),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RegisterCard('Id: ', 'IdNumber'),
                        RegisterCard('Nome: ', widget.name),
                        RegisterCard(
                          'Ano de Nascimento: ',
                          widget.dateBirth.toString(),
                        ),
                        RegisterCard('Email: ', widget.email),
                        RegisterCard(
                          'Telefone: ',
                          widget.phone.toString(),
                        ),
                        Row(
                          children: [
                            RegisterCard('Cidade: ', widget.city),
                            RegisterCard('Estado: ', widget.state),
                          ],
                        ),
                        RegisterCard('Senha: ', widget.password),
                      ],
                    ),
                  )
                ],
              )),
        ),
      ],
    );
  }
}


//                       Text('Ano de Nascimento: ${(widget.dateBirth)}'),
//                       Text('Email: ${widget.email}'),
//                       Text('Telefone: ${widget.phone}'),
//                       Text('Cidade: ${widget.city}'),
//                       Text('Estado: ${widget.state}'),