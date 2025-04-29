class Listin {
  String id;
  String name;
  String event;

  Listin({required this.id, required this.name, required this.event});

  Listin.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        name = map["name"],
        event = map["event"]?? " sem evento";

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "event": event,
    };
  }
}
