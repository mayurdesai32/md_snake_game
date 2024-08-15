import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:md_snake_game/SnakeGame.dart';

class GameOver extends StatelessWidget {
  const GameOver(this.score, {super.key});
  final int score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                width: 250,
                height: 250,
                margin: const EdgeInsets.only(bottom: 70, top: 100),
                child: Image.asset(
                  "assert/logo.png",
                  fit: BoxFit.fill,
                ),
              ),
              const Text(
                textAlign: TextAlign.center,
                "Game Over Your Snake has Collided",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.amber,
                    fontSize: 40,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 50),
              Text(
                "Your Score is score $score",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 60),
              OutlinedButton.icon(
                  icon: const Icon(
                    color: Colors.amber,
                    size: 35,
                    Icons.refresh,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => const Snakegame()),
                    );
                  },
                  label: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: const Text(
                      "Restart Game",
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.amber,
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
