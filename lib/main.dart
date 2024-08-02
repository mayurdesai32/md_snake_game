import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:md_snake_game/SnakeGame.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'MD SNAKE GAME',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(child: Snakegame()),
      ),
    );
  }
}
