import 'package:crud/data/dao.dart';
import 'package:crud/widgets/user_data.dart';
import 'package:flutter/material.dart';
import 'package:crud/data/prod_register.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({required this.personContext, super.key});

  final BuildContext personContext;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController name = TextEditingController();
  final TextEditingController dateBirth = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController city = TextEditingController();
  // final TextEditingController state = TextEditingController();
  final TextEditingController password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  var validatorName = RegExp('\\d');
  var validatorEmail = RegExp('[\\@][a-z]');

  String dropdowmValue = '';

  bool isValidator(String value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  List<String> uf = [
    'AC',
    'AL',
    'AM',
    'AP',
    'BA',
    'CE',
    'DF',
    'ES',
    'GO',
    'MA',
    'MG',
    'MS',
    'MT',
    'PA',
    'PB',
    'PE',
    'PI',
    'PR',
    'RJ',
    'RN',
    'RO',
    'RR',
    'RS',
    'SC',
    'SE',
    'SP',
    'TO',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.black12),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: name,
                      validator: (String? value) {
                        if (isValidator(value!)) {
                          return 'Nome é obrigatório';
                        } else if (validatorName.hasMatch(name.text)) {
                          return 'Dado inválido!';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          helper: Text('Nome'),
                          fillColor: Colors.white,
                          filled: true),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: dateBirth,
                      maxLength: 4,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          helper: Text('Ano de Nascimento'),
                          fillColor: Colors.white,
                          filled: true),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: email,
                      validator: (String? value) {
                        if (isValidator(value!)) {
                          return 'Email é obrigatório';
                        } else if (validatorEmail.hasMatch(email.text)) {
                          return null;
                        } else {
                          return 'Email inválido!';
                        }
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          helper: Text('Email'),
                          fillColor: Colors.white,
                          filled: true),
                    ),
                  ),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 220,
                            child: TextFormField(
                              controller: phone,
                              maxLength: 11,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  helper: Text('Telefone'),
                                  fillColor: Colors.white,
                                  filled: true),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            width: 100,
                            child: DropdownButtonFormField(
                              style: TextStyle(color: Colors.black87),
                              decoration: InputDecoration(
                                  helper: Text('Estado'),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder()),
                              hint: Text('UF'),
                              items: uf.map<DropdownMenuItem<String>>(
                                (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                },
                              ).toList(),
                              onChanged: (String? item) {
                                setState(
                                  () {
                                    dropdowmValue = item!;
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: city,
                      validator: (String? value) {
                        if (isValidator(value!)) {
                          return 'Cidade é obrigatório';
                        } else if (validatorName.hasMatch(city.text))
                          return 'Dado inválido!';
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          helper: Text('Cidade'),
                          fillColor: Colors.white,
                          filled: true),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: password,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          helper: Text('Senha'),
                          fillColor: Colors.white,
                          filled: true),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print(name.text);
                        Dao().save(
                          Person(
                              name.text,
                              int.parse(dateBirth.text),
                              email.text,
                              int.parse(phone.text),
                              city.text,
                              dropdowmValue,
                              password.text),
                        );
                        // PersonRegInherited.of(widget.personContext).newReg(
                        //     name.text,
                        //     int.parse(dateBirth.text),
                        //     email.text,
                        //     int.parse(phone.text),
                        //     city.text,
                        //     dropdowmValue,
                        //     password.text);
                        Navigator.pop(context);
                      }
                    },
                    child: Text('Cadastrar'),
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


