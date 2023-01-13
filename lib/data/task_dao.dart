import 'package:primeiro_alura/data/data_base.dart';
import 'package:sqflite/sqflite.dart';
import '../widgets/task.dart';

class TaskDao {
  static const String tableTask = 'CREATE TABLE $tableName('
      '$name TEXT, '
      '$difficulty INTEGER, '
      '$image TEXT)';

  static const String tableName = 'taskTable';

  static const String name = 'name';
  static const String difficulty = 'difficulty';
  static const String image = 'image';

  save(Task newAndUpdateTask) async {
    final Database dataBase = await getDataBase();
    var taskExist = await find(newAndUpdateTask.taskName);
    Map<String, dynamic> newAndUpdateTaskMap = toMap(newAndUpdateTask);
    if (taskExist.isEmpty) {
      return await dataBase.insert(tableName, newAndUpdateTaskMap);
    } else {
      return await dataBase.update(
        tableName,
        newAndUpdateTaskMap,
        where: '$name = ?',
        whereArgs: [newAndUpdateTask.taskName],
      );
    }
  }

  Future<List<Task>> findAll() async {
    final Database dataBase = await getDataBase();
    final List<Map<String, dynamic>> result = await dataBase.query(tableName);

    return toList(result);
  }

  Future<List<Task>> find(String taskBuscada) async {
    final Database dataBase = await getDataBase();
    final List<Map<String, dynamic>> result = await dataBase.query(
      tableName,
      where: '$name = ?',
      whereArgs: [taskBuscada],
    );
    return toList(result);
  }

  delete(String taskName) async {
    final Database dataBase = await getDataBase();
    return dataBase.delete(
      tableName,
      where: '$name = ?',
      whereArgs: [taskName],
    );
  }

  Map<String, dynamic> toMap(Task eachTask) {
    final Map<String, dynamic> taskMap = {};
    taskMap[name] = eachTask.taskName;
    taskMap[difficulty] = eachTask.difficulty;
    taskMap[image] = eachTask.image;
    return taskMap;
  }

  List<Task> toList(List<Map<String, dynamic>> taskMap) {
    final List<Task> taskList = [];
    for (Map<String, dynamic> eachTask in taskMap) {
      final Task tasks =
          Task(eachTask['name'], eachTask['image'], eachTask['difficulty']);
      taskList.add(tasks);
    }
    return taskList;
  }
}
