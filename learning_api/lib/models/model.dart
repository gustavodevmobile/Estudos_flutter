import 'package:uuid/uuid.dart';

class Journal {
  String id;
  String content;
  DateTime createdAt;
  DateTime updatedAt;

  Journal({
    required this.id,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });

  Journal.empty()
      : id = const Uuid().v1(),
        content = " ",
        createdAt = DateTime.now(),
        updatedAt = DateTime.now();

// Converte um mapa em um objeto Journal
  Journal.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        content = map["content"],
        createdAt = DateTime.parse(map["created_at"]),
        updatedAt = DateTime.parse(map["updated_at"]);

// Converte uma lista de mapas em uma lista de objetos Journal
  static List<Journal> fromMaps(List<dynamic> maps) {
    return maps.map((map) {
      return Journal.fromMap(map);
    }).toList();
  }
  

  factory Journal.fromJson(Map<String, dynamic> map) {
    return Journal(
      id: map["id"] as String,
      content: map["content"] as String,
      createdAt: DateTime.parse(map["created_at"]),
      updatedAt: DateTime.parse(map["updatedAt"]),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "content": content,
      "created_at": createdAt.toString(),
      "updated_at": updatedAt.toString()
    };
  }

  @override
  String toString() {
    return "$content \ncreated_at: $createdAt\nupdated_at:$updatedAt";
  }
}
