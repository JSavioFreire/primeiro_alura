import 'package:primeiro_alura/data/task_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart'; 
//pacote do proprio flutter que facilita a encontrar no dispositivo um local para salva o db

Future<Database> getDataBase() async {
  final String path = join(await getDatabasesPath(), 'task.db');
  //path vai buscar no dispositivo um local para salvar o db.

  return openDatabase(path,
      onCreate: ((db, version) => db.execute(TaskDao.tableTask)), version: 1);
}

