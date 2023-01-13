import 'package:flutter/material.dart';
import 'package:primeiro_alura/widgets/task.dart';

class TaskData extends InheritedWidget {
  TaskData({
    super.key,
    required super.child,
  });

  final List<Task> taskList = [
    Task('Aprender Dart',
        'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large', 4),
    Task('Aprender Java',
        'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large', 5),
    Task('Aprender React',
        'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large', 1),
    Task('Aprender Angular',
        'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large', 3),
    Task('Aprender Vue',
        'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large', 2),
    Task('Aprender Python',
        'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large', 5),
  ];

  void newTask(String name, String image, int difficulty) {
    taskList.add(Task(name, image, difficulty));
  }

  static TaskData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TaskData>();
  }

  static TaskData of(BuildContext context) {
    final TaskData? result = maybeOf(context);
    assert(result != null, 'No TaskData found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskData oldWidget) {
    return (oldWidget.taskList.length != taskList.length) ;
  }
}
