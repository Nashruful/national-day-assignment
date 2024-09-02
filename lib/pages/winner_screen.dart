import 'package:assignment16/components/text/text_custom.dart';
import 'package:assignment16/helper/extension/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WinnerScreen extends StatelessWidget {
  const WinnerScreen({super.key, required this.score});
  final int score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Lottie.asset("assets/Animation - 1725227947350.json"),
          Positioned(top: 180,left: 155, child: Image.asset("assets/Picture1.png",width: 200,height: 200,)),
          SizedBox(width: context.getWidth(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [SizedBox(height: 100,),
                const TextCustom(
                    text: "Congratulation!",
                    color: Colors.black,
                    weight: FontWeight.w800,
                    fontSize: 35),
                TextCustom(
                    text: "Your result is: $score / 10",
                    color: Colors.black,
                    weight: FontWeight.w700,
                    fontSize: 35)
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                  width: context.getWidth(),
                  child: Image.asset(
                    "assets/Group 6.png",
                    fit: BoxFit.cover,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
