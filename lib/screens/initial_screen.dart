import 'package:flutter/material.dart';
import 'package:primeiro_alura/data/task_dao.dart';
import 'package:primeiro_alura/screens/form_screen.dart';

import '../widgets/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        leading: Container(),
        title: const Text('Tarefas'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 80),
        child: FutureBuilder<List<Task>>(
          future: TaskDao().findAll(),
          builder: (context, snapshot) {
            List<Task>? item = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                Center(
                  child: Column(
                    children: const [
                      CircularProgressIndicator(),
                      Text('Carregando...')
                    ],
                  ),
                );
                break;
              case ConnectionState.waiting:
                Center(
                  child: Column(
                    children: const [
                      CircularProgressIndicator(),
                      Text('Carregando...')
                    ],
                  ),
                );
                break;
              case ConnectionState.active:
                Center(
                  child: Column(
                    children: const [
                      CircularProgressIndicator(),
                      Text('Carregando...')
                    ],
                  ),
                );
                break;
              case ConnectionState.done:
                if (snapshot.hasData && item != null) {
                  if (item.isNotEmpty) {
                    return ListView.builder(
                        itemCount: item.length,
                        itemBuilder: (context, index) {
                          final Task eachTask = item[index];
                          return eachTask;
                        });
                  }
                  return Center(
                    child: Column(
                      children: const [
                        Icon(
                          Icons.error_outline,
                          size: 128,
                        ),
                        Text('Não ha tarefas.')
                      ],
                    ),
                  );
                }
                return (const Center(
                  child: Text('Erro no banco de dados'),
                ));
            }
            return const Center(
              child: Text('Erro desconhecido'),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (newContext) => FormScreen(
                  taskContext: context,
                ),
              )).then((value) => setState((() {})));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
