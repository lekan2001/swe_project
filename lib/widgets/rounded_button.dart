import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {

  final String text;
  final VoidCallback? press;
  final double verticalPadding;
  final double fontSize;
  final Color color;
  final double btnWidth;

  const RoundedButton({
    Key? key,
    required this.text,
    this.press,
    this.verticalPadding = 16,
    this.fontSize = 16, 
    this.color = Colors.white,
    this.btnWidth = double.infinity
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: btnWidth,
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(vertical: 16),
        padding:
            EdgeInsets.symmetric(vertical: verticalPadding,),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 15),
              blurRadius: 30,
              color: Color(0xFF666666).withOpacity(.11),
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}