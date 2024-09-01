import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WinnerScreen extends StatelessWidget {
  const WinnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Lottie.asset("assets/Animation - 1725227947350.json"),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Image.asset("assets/Group 6.png")],
          )
        ],
      ),
    );
  }
}
