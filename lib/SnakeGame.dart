import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Snakegame extends StatefulWidget {
  const Snakegame({super.key});

  @override
  State<Snakegame> createState() => _SnakegameState();
}

enum Direction { up, down, left, right }

class _SnakegameState extends State<Snakegame> {
  int row = 20;
  int column = 20;
  List<int> borderList = [];
  List<int> snakePosition = [];
  int snakeHead = 0;
  int score = 0;
  late Direction direction;
  late int foodPoistion;
  @override
  void initState() {
    startGame();
    super.initState();
  }

  void startGame() {
    makeBorder();
    generateFood();
    snakePosition = [45, 44, 43];
    direction = Direction.right;
    snakeHead = snakePosition.first;

    Timer.periodic(Duration(milliseconds: 300), (timer) {
      updateSnake();

      if (checkCollision()) {
        timer.cancel();
        showGameOverDialog();
      }
    });
  }

  void showGameOverDialog() {
    showDialog(
        // barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Game Over"),
            content: const Text("your snake collide"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    startGame();
                  },
                  child: Text("Restart"))
            ],
          );
        });
  }

  bool checkCollision() {
    // if collide with border
    if (borderList.contains(snakeHead)) return true;
    // if collide with itself
    if (snakePosition.sublist(1).contains(snakeHead)) return true;
    return false;
  }

  void generateFood() {
    foodPoistion = Random().nextInt(row * column);
    if (borderList.contains(foodPoistion)) {
      generateFood();
    }
  }

  void updateSnake() {
    setState(() {
      switch (direction) {
        case Direction.up:
          snakePosition.insert(0, snakeHead - column);
        case Direction.down:
          snakePosition.insert(0, snakeHead + column);
        case Direction.right:
          snakePosition.insert(0, snakeHead + 1);
        case Direction.left:
          snakePosition.insert(0, snakeHead - 1);
      }

      // snakePosition.insert(0, snakeHead + 1);
    });

    if (snakeHead == foodPoistion) {
      score++;
      generateFood();
    } else {
      snakePosition.removeLast();
    }

    snakeHead = snakePosition.first;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: column),
            itemCount: row * column,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: fillBoxColor(index)),
              );
            },
          ),
        ),
        _buildGameControls()
      ],
    );
  }

  Widget _buildGameControls() {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            "Score : $score",
            style: const TextStyle(color: Colors.amber, fontSize: 34),
          ),
          const SizedBox(
            height: 15,
          ),
          IconButton(
            onPressed: () {
              if (direction != Direction.down) direction = Direction.up;
            },
            icon: const Icon(Icons.arrow_circle_up, color: Colors.amber),
            iconSize: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  if (direction != Direction.right) direction = Direction.left;
                },
                icon:
                    Icon(Icons.arrow_circle_left_outlined, color: Colors.amber),
                iconSize: 100,
              ),
              const SizedBox(
                width: 100,
              ),
              IconButton(
                onPressed: () {
                  if (direction != Direction.left) direction = Direction.right;
                },
                icon: const Icon(Icons.arrow_circle_right_outlined,
                    color: Colors.amber),
                iconSize: 100,
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              if (direction != Direction.up) direction = Direction.down;
            },
            icon: const Icon(Icons.arrow_circle_down_outlined,
                color: Colors.amber),
            iconSize: 100,
          )
        ],
      ),
    );
  }

  Color fillBoxColor(int index) {
    if (borderList.contains(index)) {
      return Colors.yellow;
    } else {
      if (snakePosition.contains(index)) {
        // return Colors.green;

        if (snakeHead == index) {
          return Colors.green;
        } else {
          return Colors.white.withOpacity(0.9);
        }
      } else {
        if (index == foodPoistion) {
          return Colors.red;
        }
      }
    }
    return Colors.grey.withOpacity(0.05);
  }

  makeBorder() {
    for (int i = 0; i < column; i++) {
      if (!borderList.contains(i)) borderList.add(i);
    }

    for (int i = 0; i < row * column; i = i + column) {
      if (!borderList.contains(i)) borderList.add(i);
    }

    for (int i = column - 1; i < row * column; i = i + column) {
      if (!borderList.contains(i)) borderList.add(i);
    }

    for (int i = (row * column) - column; i < row * column; i = i + 1) {
      if (!borderList.contains(i)) borderList.add(i);
    }
  }
}
