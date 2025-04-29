import 'package:forms/dates/task_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'task.db');
  return openDatabase(path, onCreate: (Database db, version) {
    db.execute(TaskDao.tableSql);
  }, version: 1);
}


