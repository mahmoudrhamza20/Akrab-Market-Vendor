import 'package:flutter/material.dart';
import '../core/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.text = '',
    this.fontSize = 14,
    this.fontColor = Colors.white,
    required this.onPress,
    this.radius = 0,
    this.buttonColor = AppColors.primaryColor,
  }) : super(key: key);

  final String text;
  final double fontSize;
  final Color fontColor;
  final VoidCallback onPress;
  final double radius;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: Colors.white),
      ),
      child: InkWell(
        onTap: onPress,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              color: fontColor,
            ),
          ),
        ),
      ),
    );
  }
}
