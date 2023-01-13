import 'package:flutter/material.dart';
import 'package:primeiro_alura/data/task_data.dart';
import 'package:primeiro_alura/screens/initial_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TaskData(child: const InitialScreen()));
  }
}
