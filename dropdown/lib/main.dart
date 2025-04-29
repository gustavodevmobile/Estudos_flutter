import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Dropdowns',
    home: Scaffold(
        appBar: AppBar(
          title: Text('Dropdowns'),
          // elevation: 0,
        ),
        body: Container(
          child: Column(
            children: [
              DropdownButtonExemplo(),
              DropMenuExemplo(),
              DrodowmFormFieldExemplo()
            ],
          ),
        )),
  ));
}

class DropdownButtonExemplo extends StatelessWidget {
  final dropValue = ValueNotifier('');
  final dropOptions = ['Item1', 'Item2', 'Item3', 'Item4'];

  DropdownButtonExemplo({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: dropValue,
      builder: (BuildContext context, String value, _) {
        return DropdownButton<String>(
            hint: const Text('Estados'),
            value: (value.isEmpty) ? null : value,
            onChanged: (escolha) => dropValue.value = escolha.toString(),
            items: dropOptions
                .map(
                  (items) => DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  ),
                )
                .toList());
      },
    );
  }
}

class DropMenuExemplo extends StatefulWidget {
  const DropMenuExemplo({super.key});

  @override
  State<DropMenuExemplo> createState() => _DropMenuExemploState();
}

class _DropMenuExemploState extends State<DropMenuExemplo> {
  // String? valueColors;
  List<Color> cores = [Colors.blue, Colors.green, Colors.yellow, Colors.purple];

  Color? valueColors;
  // List<String> nomes = ['Gustavo', 'João', 'Maria', 'Pedro', 'Lucas', 'Rafael'];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          DropdownMenu(
            dropdownMenuEntries: cores.map<DropdownMenuEntry<Color>>(
              (Color value) {
                return DropdownMenuEntry<Color>(value: value, label: 'verde');
              },
            ).toList(),
            onSelected: (nome) {
              setState(
                () {
                  nome != null ? valueColors = nome : null;
                },
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(color: valueColors),
              child: Center(child: Text('Color')

                  // Text(valueColors!),
                  ),
            ),
          )
        ],
      ),
    );
  }
}

class DrodowmFormFieldExemplo extends StatefulWidget {
  const DrodowmFormFieldExemplo({super.key});

  @override
  State<DrodowmFormFieldExemplo> createState() =>
      _DrodowmFormFildExemploState();
}

class _DrodowmFormFildExemploState extends State<DrodowmFormFieldExemplo> {
  List<String> nomes = ['Gustavo', 'João', 'Maria', 'Pedro', 'Lucas', 'Rafael'];
  String? valueMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButtonFormField(
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.black26,
              border: OutlineInputBorder()),
          hint: Text('Nomes'),
          items: nomes.map<DropdownMenuItem<String>>(
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
                valueMenu = item;
              },
            );
          },
        ),
      ),
    );
  }
}



                // <DropdownMenuEntry<String>>[
                //   DropdownMenuEntry(value: 'Gustavo', label: 'Gustavo'),
                //   DropdownMenuEntry(value: 'João', label: 'João'),
                //   DropdownMenuEntry(value: 'Maria', label: 'Maria'),
                //   DropdownMenuEntry(value: 'Pedro', label: 'Pedro'),
                //   DropdownMenuEntry(value: 'Lucas', label: 'Lucas'),
                //   DropdownMenuEntry(value: 'Rafael', label: 'Rafael'),
                // ],

            //     <DropdownMenuEntry<Color>>[
            //   DropdownMenuEntry(value: Colors.red, label: 'Red'),
            //   DropdownMenuEntry(value: Colors.blue, label: 'Blue'),
            //   DropdownMenuEntry(value: Colors.green, label: 'Green'),
            //   DropdownMenuEntry(value: Colors.yellow, label: 'Yellow'),
            //   DropdownMenuEntry(value: Colors.orange, label: 'Orange'),
            //   DropdownMenuEntry(value: Colors.purple, label: 'Purple'),
            // ],