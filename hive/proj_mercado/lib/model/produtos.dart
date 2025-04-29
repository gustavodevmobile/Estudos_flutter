import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


@HiveType(typeId: 1)
class Produto{
  
  @HiveField(0)
  final String depto;

  @HiveField(1)
  final String prodName;

  @HiveField(2)
  final double price;

  @HiveField(3)
  final bool isInsideCard;

  Produto(this.depto, this.prodName, this.price, this.isInsideCard);
}
