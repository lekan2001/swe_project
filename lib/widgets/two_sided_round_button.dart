import 'package:flutter/material.dart';
import 'package:swe_project/constants.dart';

class TwoSidedRoundButton extends StatelessWidget {
  final String text;
  final double radius;
  final  Function()? press;
  const TwoSidedRoundButton({
    Key? key,
    required this.text,
    this.radius = 29,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: kBlackColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radius),
            bottomRight: Radius.circular(radius),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}