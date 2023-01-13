import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {
  final int level;
  const Difficulty(
    this.level, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: (level >= 1) ? Colors.blue : Colors.blue[100],
          size: 15,
        ),
        Icon(
          Icons.star,
          color: (level >= 2) ? Colors.blue : Colors.blue[100],
          size: 15,
        ),
        Icon(
          Icons.star,
          color: (level >= 3) ? Colors.blue : Colors.blue[100],
          size: 15,
        ),
        Icon(
          Icons.star,
          color: (level >= 4) ? Colors.blue : Colors.blue[100],
          size: 15,
        ),
        Icon(
          Icons.star,
          color: (level >= 5) ? Colors.blue : Colors.blue[100],
          size: 15,
        ),
      ],
    );
  }
}
