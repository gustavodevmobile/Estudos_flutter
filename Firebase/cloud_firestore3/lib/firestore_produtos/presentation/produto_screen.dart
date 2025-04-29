import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore3/_core/my_colors.dart';
import 'package:cloud_firestore3/firestore_produtos/helpers/enum_order.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../../firestore/models/listin.dart';
import '../model/produto.dart';
import 'widgets/list_tile_produto.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class ProdutoScreen extends StatefulWidget {
  final Listin listin;
  const ProdutoScreen({super.key, required this.listin});

  @override
  State<ProdutoScreen> createState() => _ProdutoScreenState();
}

class _ProdutoScreenState extends State<ProdutoScreen> {
  List<Produto> listaProdutosPlanejados = [];
  List<Produto> listaProdutosPegos = [];
  List<String> deptos = [
    'Açougue',
    'Laticínios',
    'Bebidas',
    'Higiene',
    'Limpeza',
    'Hortfruit',
    'Mercearia',
    'Padaria',
    'Enlatados',
    'Cereais',
    'Rotisseria',
    'Guloseimas',
    'Geladeira',
    'Congelados'
  ];

  String? selectValue;

  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController setorController = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  OrderProducts order = OrderProducts.name;
  bool isDesc = false;
  String uid = FirebaseAuth.instance.currentUser!.uid;

  getCollections() async {
    insideCard();
    outsideCard();
  }

  Future removeDoc(depto) async {
    await firestore
        .collection(uid)
        .doc(widget.listin.id)
        .collection('Produtos')
        .doc(depto)
        .delete();
    getCollections();
  }

  Future insideCard() async {
    List<Produto> listTemp = [];
    await firestore
        .collection(uid)
        .doc(widget.listin.id)
        .collection('Produtos')
        .where('isComprado', isEqualTo: true)
        .get()
        .then((snapshot) {
      for (var doc in snapshot.docs) {
        Produto produto = Produto.fromMap(doc.data());
        listTemp.add(produto);
      }
    });
    setState(() {
      listaProdutosPegos = listTemp;
    });
  }

  Future<List<Produto>> outsideCard() async {
    List<Produto> listTemp = [];
    await firestore
        .collection(uid)
        .doc(widget.listin.id)
        .collection('Produtos')
        .where('isComprado', isEqualTo: false)
        .get()
        .then((snapshot) {
      for (var doc in snapshot.docs) {
        Produto produto = Produto.fromMap(doc.data());
        listTemp.add(produto);
        print(listaProdutosPlanejados);
      }
      setState(() {
        listaProdutosPlanejados = listTemp;
      });
    });
    return listaProdutosPlanejados;
  }

  Future updateCard(bool isCard, String depto) async {
    await firestore
        .collection(uid)
        .doc(widget.listin.id)
        .collection('Produtos')
        .doc(depto)
        .update({'isComprado': isCard});
    setState(() {
      getCollections();
    });
  }

  @override
  void initState() {
    getCollections();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.greenlightAccent,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(widget.listin.name, style: TextStyle(color: Colors.white),),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: OrderProducts.depto,
                  child: Text(OrderProducts.depto.toString()),
                ),
                PopupMenuItem(
                  value: OrderProducts.name,
                  child: Text(OrderProducts.name.toString()),
                ),
                PopupMenuItem(
                  value: OrderProducts.amount,
                  child: Text(OrderProducts.amount.toString()),
                ),
                PopupMenuItem(
                  value: OrderProducts.price,
                  child: Text(OrderProducts.price.toString()),
                ),
              ];
            },
            onSelected: (value) {
              setState(() {
                if (order == value) {
                  isDesc = !isDesc;
                } else {
                  order = value;
                  isDesc = false;
                }
                print(order.name);
              });
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showFormModal();
          getCollections();
          nameController.clear();
          amountController.clear();
          priceController.clear();
          setorController.clear();
          selectValue = null;
        },
        child: const Icon(Icons.add),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return getCollections();
        },
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                children: const [
                  Text(
                    "R\$${0}",
                    style: TextStyle(fontSize: 42),
                  ),
                  Text(
                    "total previsto para essa compra",
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(thickness: 2),
            ),
            const Text(
              "Produtos Planejados",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(
              children: List.generate(listaProdutosPlanejados.length, (index) {
                Produto produto = listaProdutosPlanejados[index];
                print(listaProdutosPlanejados[index]);
                return Dismissible(
                  key: ValueKey<Produto>(produto),
                  onDismissed: (_) {
                    //removeDoc(produto.depto);
                    getCollections();
                  },
                  child: ListTileProduto(
                    produto: produto,
                    isComprado: false,
                    showModal: showFormModal,
                    depto: produto.depto,
                    isCard: updateCard,
                    iconAdd: Icon(Icons.add),
                  ),
                );
              }),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(thickness: 2),
            ),
            const Text(
              "Produtos Comprados",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(
              children: List.generate(listaProdutosPegos.length, (index) {
                Produto produto = listaProdutosPegos[index];
                return Dismissible(
                  key: ValueKey<Produto>(produto),
                  onDismissed: (_) {
                    //removeDoc(produto.depto);
                    //getCollections();
                  },
                  child: ListTileProduto(
                    produto: produto,
                    isComprado: true,
                    showModal: showFormModal,
                    depto: produto.depto,
                    isCard: updateCard,
                    iconAdd: Icon(Icons.shopping_cart_checkout_sharp),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  showFormModal({Produto? model}) {
    // Labels à serem mostradas no Modal
    String labelTitle = "Adicionar Produto";
    String labelConfirmationButton = "Salvar";
    String labelSkipButton = "Cancelar";

    // Controlador dos campos do produto
    bool isComprado = false;

    // Caso esteja editando
    if (model != null) {
      labelTitle = "Editando ${model.name}";
      nameController.text = model.name;

      if (model.price != null) {
        priceController.text = model.price.toString();
      }

      if (model.amount != null) {
        amountController.text = model.amount.toString();
      }

      isComprado = model.isComprado;
    }

    // Função do Flutter que mostra o modal na tela
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      // Define que as bordas verticais serão arredondadas
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.90,
            padding: const EdgeInsets.all(32.0),

            // Formulário com Título, Campo e Botões
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(labelTitle),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    //isExpanded: true,
                    hint: selectValue != null
                        ? Text(selectValue!)
                        : Text('Departamento'),
                    items: deptos
                        .map((String item) => DropdownMenuItem<String>(
                            value: item, child: Text(item)))
                        .toList(),
                    value: selectValue,
                    onChanged: (String? value) {
                      setState(() {
                        selectValue = value;
                      });
                    },
                  ),
                ),
                TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    label: Text("Nome do Produto*"),
                    icon: Icon(Icons.abc_rounded),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: amountController,
                  keyboardType: const TextInputType.numberWithOptions(
                    signed: false,
                    decimal: false,
                  ),
                  decoration: const InputDecoration(
                    label: Text("Quantidade"),
                    icon: Icon(Icons.numbers),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: priceController,
                  keyboardType: const TextInputType.numberWithOptions(
                    signed: false,
                    decimal: true,
                  ),
                  decoration: const InputDecoration(
                    label: Text("Preço"),
                    icon: Icon(Icons.attach_money_rounded),
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
                      child: Text(labelSkipButton),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Criar um objeto Produto com as infos
                        Produto produto = Produto(
                            id: const Uuid().v1(),
                            name: nameController.text,
                            isComprado: isComprado,
                            depto:
                                selectValue != null ? selectValue! : 'Divesos');

                        // Usar id do model
                        if (model != null) {
                          produto.id = model.id;
                        }

                        if (amountController.text != "") {
                          produto.amount = double.parse(amountController.text);
                        }

                        if (priceController.text != "") {
                          produto.price = double.parse(priceController.text);
                        }

                        // Salvar no Firestore
                        firestore
                            .collection(uid)
                            .doc(widget.listin.id)
                            .collection('Produtos')
                            .doc(selectValue)
                            .set(produto.toMap());

                        // Atualizar a lista
                        setState(() {
                          getCollections();
                        });

                        // Fechar o Modal
                        Navigator.pop(context);
                      },
                      child: Text(labelConfirmationButton),
                    ),
                  ],
                )
              ],
            ),
          );
        });
      },
    );
  }
}
