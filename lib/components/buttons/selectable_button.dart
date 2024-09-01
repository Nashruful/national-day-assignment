import 'package:assignment16/components/text/text_custom.dart';
import 'package:flutter/material.dart';

class SelectableButton extends StatelessWidget {
  const SelectableButton(
      {super.key,
      required this.title,
      required this.numberOfOption,
      this.onPressed,
      required this.color});
  final String title;
  final String numberOfOption;
  final Function()? onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 312.78,
        height: 37.11,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.16),
            border: Border(
                top: BorderSide(color: color, width: 1),
                right: BorderSide(color: color, width: 2),
                left: BorderSide(color: color, width: 1),
                bottom: BorderSide(color: color, width: 2))),
        child: TextButton(
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextCustom(
                    text: title,
                    color: Colors.black,
                    weight: FontWeight.w400,
                    fontSize: 12.16),
                Container(
                  height: 16.31,
                  width: 16.31,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(3.26),
                      border: Border.all(
                          width: 1.82, color:  color)),
                  child: Center(
                    child: TextCustom(
                        text: numberOfOption,
                        color:  color,
                        weight: FontWeight.w700,
                        fontSize: 9.16),
                  ),
                )
              ],
            )));
  }
}
