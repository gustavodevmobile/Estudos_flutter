
import 'package:crud/data/prod_register.dart';
import 'package:crud/screens/form.dart';
import 'package:crud/widgets/user_avatar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD'),
      ),
      drawer: Drawer(
        width: 220,
        // backgroundColor: Colors.blue[200],
        child: ListView(
          children: [
            UserAvatar('Gustavo'),
            ListTile(
              title: Text('Cadastrar'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (contextNew) => RegisterForm(
                      personContext: context,
                    ),
                  ),
                );
              },
            ),
            Divider(height: 3),
            
          ],
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Colors.black12),
        child: ListView(children: PersonRegInherited.of(context).listReg),
      ),
      
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[100],
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => RegisterForm(
                personContext: context,
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
