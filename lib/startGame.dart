import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:md_snake_game/SnakeGame.dart';

class StartGame extends StatelessWidget {
  const StartGame({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  height: 250,
                  margin: const EdgeInsets.only(bottom: 50),
                  child: Image.asset(
                    "assert/logo.png",
                    fit: BoxFit.fill,
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => const Snakegame()),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    elevation: 2.2,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 30),
                    // backgroundColor: Colors.amber
                  ),
                  child: const Text(
                    "Start Game",
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.amber,
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
