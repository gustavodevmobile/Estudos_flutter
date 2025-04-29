import 'package:crud/data/dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'userDatabase');
  return openDatabase(path, onCreate: (db, version) {
     db.execute(Dao.tableSql);
  }, version: 1);
}
