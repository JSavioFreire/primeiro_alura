import 'package:flutter/material.dart';
import 'package:primeiro_alura/data/task_dao.dart';
import 'difficulty.dart';

class Task extends StatefulWidget {
  final String taskName;
  final String image;
  final int difficulty;
  Task(this.taskName, this.image, this.difficulty, {super.key});
  int nv = 0;
  int maestria = 0;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: widget.maestria == 0
                    ? Colors.blue
                    : widget.maestria == 1
                        ? Colors.green
                        : widget.maestria == 2
                            ? Colors.yellow
                            : widget.maestria == 3
                                ? Colors.orange
                                : widget.maestria == 4
                                    ? Colors.red
                                    : Colors.black,
                borderRadius: BorderRadius.circular(4)),
            height: 140,
            width: 500,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: 72,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(4)),
                        child: Image.network(
                          widget.image,
                          fit: BoxFit.cover,
                        )),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            widget.taskName,
                            style: const TextStyle(
                                fontSize: 24, overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        Difficulty(widget.difficulty)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 52,
                        child: ElevatedButton(
                            onLongPress: () {
                              TaskDao().delete(widget.taskName);
                            },
                            onPressed: () {
                              setState(() {
                                widget.maestria < 5
                                    ? widget.nv == widget.difficulty * 10
                                        ? {widget.nv = 0, widget.maestria++}
                                        : widget.nv++
                                    : widget.nv++;
                              });
                            },
                            child: Column(children: const [
                              Icon(Icons.arrow_drop_up),
                              Text('Up!')
                            ])),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 200,
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.white24,
                          color: Colors.white,
                          value: widget.difficulty > 0
                              ? (widget.nv / widget.difficulty) / 10
                              : 1,
                        )),
                    Text('Nível: ${widget.nv}',
                        style: const TextStyle(color: Colors.white))
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
