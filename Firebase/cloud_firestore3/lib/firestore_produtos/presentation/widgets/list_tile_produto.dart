import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../model/produto.dart';

class ListTileProduto extends StatefulWidget {
  final Produto produto;
  final bool isComprado;
  final Function showModal;
  final String depto;
  final Function isCard;
  final Icon iconAdd;

  const ListTileProduto({
    super.key,
    required this.produto,
    required this.isComprado,
    required this.showModal,
    required this.depto,
    required this.isCard,
    required this.iconAdd,
  });

  @override
  State<ListTileProduto> createState() => _ListTileProdutoState();
}

class _ListTileProdutoState extends State<ListTileProduto> {
  //Icon iconButton = Icon(Icons.shopping_cart_sharp);
  bool isGet = false;
  bool turnFalse = true;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // isThreeLine: true,
      onTap: () {
        //widget.isCard(widget.produto);
        //print(widget.produto.depto);

        widget.showModal(model: widget.produto);
      },
      trailing: Column(
        children: [
          Text('Depto'),
          Text(
            widget.depto,
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
      leading: IconButton(
          onPressed: () {
            print(FirebaseAuth.instance.currentUser!.email);
            print(FirebaseAuth.instance.currentUser!.displayName);
            
            print('isComrado ${widget.isComprado}');
            setState(() {
              if (!widget.isComprado) {
                widget.isCard(true, widget.produto.depto);
              } else if (widget.isComprado) {
                widget.isCard(false, widget.produto.depto);
              }
            });
          },
          icon: widget.iconAdd),
      title: Text(
        (widget.produto.amount == null)
            ? widget.produto.name
            : "${widget.produto.name} (x${widget.produto.amount!.toInt()})",
      ),
      subtitle: Text(
        (widget.produto.price == null)
            ? "Clique para adicionar preço"
            : "R\$ ${widget.produto.price}0",
      ),
    );
  }
}
