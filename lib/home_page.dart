import 'package:flutter/material.dart';
import 'dart:math';

import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> images = ["assets/p.png", "assets/r.png", "assets/s.png"];
  int player1num = 0;
  int player2num = 0;
  int player1count = 0;
  int player2count = 0;
  void _turnPlayer1() {
    if (player1count <= player2count) {
      player1num = Random().nextInt(3);
      player1count++;

      setState(() {});
    } else {
      Fluttertoast.showToast(msg: "Please wait", gravity: ToastGravity.TOP);
    }
  }

  void _turnPlayer2() {
    if (player2count <= player1count) {
      player2num = Random().nextInt(3);
      player2count++;
      setState(() {});
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Wait for the player1"),
          duration: Duration(seconds: 1),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/background_image.png"),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                onPressed: _turnPlayer1,
                child: RotatedBox(
                  quarterTurns: 2,
                  child: Image.asset(images[player1num]),
                ),
              ),
            ),
            Divider(thickness: 2, height: 2),
            Expanded(
              //flex: 4,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                onPressed: _turnPlayer2,
                child: RotatedBox(
                  quarterTurns: 4,
                  child: Image.asset(images[player2num]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
