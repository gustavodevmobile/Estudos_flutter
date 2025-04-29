import 'package:crud/data/dataBase.dart';

import 'package:sqflite/sqflite.dart';
import 'package:crud/widgets/user_data.dart';

class Dao {
  static const String tableSql = 'CREATE TABLE $_tablename('
      // '$_id INTEGER PRIMARY KEY,'
      '$_name TEXT,'
      '$_dateBirth TEXT,'
      '$_email TEXT,)'
      '$_phone TEXT,'
      '$_state TEXT,'
      '$_city TEXT,'
      '$_password TEXT';

  // static const String _id = '_id';
  static const String _tablename = 'users';
  static const String _name = 'userName';
  static const String _dateBirth = 'dateOfBirth';
  static const String _email = 'email';
  static const String _phone = 'phone';
  static const String _state = 'state';
  static const String _city = 'city';
  static const String _password = 'password';

  save(Person user) async {
    print('Salvando dados');
    final Database database = await getDatabase();
    try {
      final Map<String, dynamic> userMap = toMap(user);
      await database.insert(_tablename, userMap);
      print('Dados salvo com sucesso');
      print(_tablename);
    } catch (erro) {
      print('Erro ao converter lista para map: $erro');
    }
  }

  Map<String, dynamic> toMap(Person user) {
    print('Convertendo Lista para map');
    final Map<String, dynamic> mapaDeUser = Map();
    // mapaDeUser[_id] = user.id;
    mapaDeUser[_name] = user.name;
    mapaDeUser[_dateBirth] = user.dateBirth;
    mapaDeUser[_email] = user.email;
    mapaDeUser[_phone] = user.phone;
    mapaDeUser[_state] = user.state;
    mapaDeUser[_city] = user.city;
    mapaDeUser[_password] = user.password;
    print('Mapa de Usuário: $mapaDeUser');
    return mapaDeUser;
  }
}
