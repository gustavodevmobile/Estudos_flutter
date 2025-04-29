import 'package:forms/dates/database.dart';
import 'package:forms/task.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT,'
      '$_type INTEGER,'
      '$_image TEXT)';

  static const String _tablename = 'taskTable';
  static const String _name = 'nameTask';
  static const String _type = 'typeTask';
  static const String _image = 'imageTask';

  // here save and update to the database
  save(Task tarefa) async {
    print('Iniciando o save');
    final Database bancoDeDados = await getDatabase();
    var itemExists = await find(tarefa.nome);
    final Map<String, dynamic> taskMap = toMap(tarefa);
    if (itemExists.isEmpty) {
      print('Esta tarefa não existe');
      return await bancoDeDados.insert(_tablename, taskMap);
    } else {
      print('Esta tarefa já existe');
      // return await bancoDeDados.update(
      //   _tablename,
      //   taskMap,
      //   where: '$_name =?',
      //   whereArgs: [tarefa.nome],
      // );
    }
  }

  // here transform from list to map
  Map<String, dynamic> toMap(Task tarefa) {
    print('Convertendo tarefa em Map');
    final Map<String, dynamic> mapaDeTarefa = {};
    mapaDeTarefa[_name] = tarefa.nome;
    mapaDeTarefa[_type] = tarefa.dificuldade;
    mapaDeTarefa[_image] = tarefa.image;
    print('Mapa de Tarefas: $mapaDeTarefa');
    return mapaDeTarefa;
  }

  // here do search All
  Future<List<Task>> findAll() async {
    print('Acessando o findAll');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result =
        await bancoDeDados.query(_tablename);
    print('Procurando dados no banco de dados... encontrado: $result');
    return toList(result);
  }

  // here transform from map to list
  List<Task> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    print('Convertendo lista');
    final List<Task> tarefas = [];
    for (Map<String, dynamic> linha in mapaDeTarefas) {
      final Task tarefa = Task(
        linha[_name],
        linha[_image],
        linha[_type],
      );
      tarefas.add(tarefa);
    }
    print('Lista de tarefas $tarefas');
    return tarefas;
  }

  // here find by name
  Future<List<Task>> find(String nomeDaTarefa) async {
    print('Acessand o find: ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados
        .query(_tablename, where: '$_name =?', whereArgs: [nomeDaTarefa]);

    print('Procurando dados no banco de dados... encontrado: $result');
    return toList(result);
  }

  // here delete by name
  delete(String nomeTask) async {
    print('Deletando tarefa: $nomeTask');
    final Database bancoDeDados = await getDatabase();
    return bancoDeDados
        .delete(_tablename, where: '$_name = ?', whereArgs: [nomeTask]);
  }
}
