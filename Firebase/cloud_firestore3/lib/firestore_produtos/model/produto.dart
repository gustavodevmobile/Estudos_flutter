class Produto {
  String id;
  String name;
  String depto;
  double? price;
  double? amount;
  bool isComprado;

  Produto({
    required this.id,
    required this.name,
    required this.depto,
    required this.isComprado,
    this.price,
    this.amount,
  });

  Produto.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        name = map["name"],
        depto = map["depto"] ?? 'erro',
        isComprado = map["isComprado"],
        price = map["price"],
        amount = map["amount"];

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "depto": depto,
      "isComprado": isComprado,
      "price": price,
      "amount": amount,
    };
  }
}
