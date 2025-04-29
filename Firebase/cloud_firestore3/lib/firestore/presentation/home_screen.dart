import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore3/authentication/services/auth_service.dart';
import 'package:cloud_firestore3/firestore_produtos/presentation/produto_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/listin.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Listin> listListins = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  // Controlador do campo que receberá o nome do Listin
  TextEditingController nameController = TextEditingController();
  TextEditingController eventController = TextEditingController();
  TextEditingController removeAccountController = TextEditingController();
  bool isConfirmation = false;
  final _formKey = GlobalKey<FormState>();
  String passwordConfirmation = '';
  String uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  void initState() {
    getCollections();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        color: Colors.grey, shape: BoxShape.circle),
                  ),
                  Text(FirebaseAuth.instance.currentUser!.email!),
                  FirebaseAuth.instance.currentUser!.displayName != null
                      ? Text(FirebaseAuth.instance.currentUser!.displayName!)
                      : Text("Olá, usuário"),
                ],
              ),
            ),
            // DrawerHeader(
            //     decoration: BoxDecoration(
            //         //color: Colors.blue,

            //         ),
            //     child: Text(FirebaseAuth.instance.currentUser!.email!)),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Remover conta'),
              trailing: IconButton(
                  onPressed: () {
                    isConfirmation = false;
                    showDialogRemoveAccount();
                    //AuthService().removeAccount();
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: FirebaseAuth.instance.currentUser!.displayName != null
            ? Text("Olá, ${FirebaseAuth.instance.currentUser!.displayName}")
            : Text("Olá, usuário"),
        actions: [
          Icon(Icons.logout),
          TextButton(
              onPressed: () {
                AuthService().signOut();
              },
              child: Text('Sair'))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showFormModal();
          nameController.clear();
          eventController.clear();
        },
        child: const Icon(Icons.add),
      ),
      body: (listListins.isEmpty)
          ? const Center(
              child: Text(
                "Nenhuma lista ainda.\nVamos criar a primeira?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            )
          : RefreshIndicator(
              onRefresh: () {
                return getCollections();
              },
              child: ListView(
                children: List.generate(
                  listListins.length,
                  (index) {
                    Listin model = listListins[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Dismissible(
                        direction: DismissDirection.endToStart,
                        background: Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 10),
                          color: Colors.red,
                          child: Icon(Icons.delete),
                        ),
                        onDismissed: (_) {
                          remove(model);
                        },
                        key: ValueKey<Listin>(model),
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProdutoScreen(listin: model),
                              ),
                            );
                            //print(model.event);
                          },
                          trailing: SizedBox(
                            width: 100,
                            //height: 50,
                            child: Row(
                              children: [
                                //Editar documento
                                IconButton(
                                    onPressed: () {
                                      showFormModal(model: model);
                                      nameController.text = model.name;
                                      eventController.text = model.event;
                                      print('model.name ${model.name}');
                                    },
                                    icon: Icon(Icons.edit)),
                                // Deletar documento
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.delete),
                                )
                              ],
                            ),
                          ),
                          leading: const Icon(Icons.list_alt_rounded),
                          title: Text(model.name),
                          subtitle: Text(model.event),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }

  showDialogRemoveAccount() {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            title: Text('Remover Conta'),
            content: Text('Deseja mesmo excluir sua conta?'),
            actions: <Widget>[
              Row(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Não',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isConfirmation = true;
                        removeAccountController.text = '';
                        passwordConfirmation = '';
                      });
                      //print(isConfirmation);
                    },
                    child: Text(
                      'Sim',
                      style: TextStyle(
                        color: isConfirmation ? Colors.red : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Visibility(
                  visible: isConfirmation,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Form(
                            key: _formKey,
                            child: TextFormField(
                              obscureText: true,
                              controller: removeAccountController,
                              decoration: InputDecoration(
                                label: Text('Confirme sua senha'),
                              ),
                              validator: (value) {
                                if (value == '' || value == null) {
                                  return 'Digite sua senha!';
                                }
                                return null;
                              },
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                AuthService()
                                    .removeAccount(
                                        password: removeAccountController.text)
                                    .then((error) {
                                  if (error != null) {
                                    setState(() {
                                      print(error);
                                      passwordConfirmation = 'Senha incorreta';
                                    });
                                  } else {
                                    // ignore: use_build_context_synchronously
                                    Navigator.pop(context);
                                  }
                                });
                              }
                            },
                            child: Text('Excluir conta'),
                          ),
                          Text(
                            passwordConfirmation,
                            style: TextStyle(color: Colors.red, fontSize: 15),
                          )
                        ],
                      ))),
            ],
          );
        });
      },
    );
  }

  getCollections() async {
    // 1ª opção de consulta

    // firestore.collection('Listins').get().then((snapshot) {
    //   setState(() {
    //     listListins =
    //         snapshot.docs.map((doc) => Listin.fromMap(doc.data())).toList();
    //   });
    // });

    // 2ª opção de consulta
    List<Listin> listTemp = [];
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection(uid).get();

    for (var doc in snapshot.docs) {
      listTemp.add(Listin.fromMap(doc.data()));
    }
    setState(() {
      listListins = listTemp;
    });
    print(listListins);
  }

  addListin({Listin? model}) async {
    Listin listin = Listin(
      id: const Uuid().v1(),
      name: nameController.text,
      event: eventController.text,
    );

    if (model != null) {
      listin.id = model.id;
      nameController.text = model.name;
      eventController.text = model.event;
    } // Salvar no fireStore
    await firestore
        .collection(uid)
        .doc(listin.id)
        .set(listin.toMap())
        .onError((error, _) => print('Erro ao adicionar dados: $error'));

    getCollections();

    Navigator.pop(context);
  }

  remove(model) async {
    firestore
        .collection(uid)
        .doc(model.event)
        .delete()
        .then(
          (value) => {
            print('Document deleted successfully'),
            getCollections(),
          },
        )
        .catchError(
          (error) => {print('Error deleting document: $error')},
        );
  }

  showFormModal({Listin? model}) {
    // Labels à serem mostradas no Modal
    String title = "Adicionar Listin";
    String confirmationButton = "Salvar";
    String skipButton = "Cancelar";

    // obter os documentos de uma collections
    // firestore.collection('Listins').get().then((snapshot) {
    //   for (var doc in snapshot.docs) {
    //     print(doc.reference.id);
    //   }
    // });

    // Função do Flutter que mostra o modal na tela
    showModalBottomSheet(
      context: context,

      // Define que as bordas verticais serão arredondadas
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(32.0),

          // Formulário com Título, Campo e Botões
          child: ListView(
            children: [
              Text(title),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  label: Text("Nome do Listin"),
                ),
              ),
              TextFormField(
                controller: eventController,
                decoration: const InputDecoration(
                  label: Text("Evento"),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(skipButton),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      addListin();
                    },
                    child: Text(confirmationButton),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
