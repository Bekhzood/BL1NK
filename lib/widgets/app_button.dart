import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Color? color;
  final Color? textColor;
  final bool outLined;
  final VoidCallback? onPress;
  final double width;
  final Widget? icon;
  final EdgeInsetsGeometry padding;

  const AppButton({
    Key? key,
    required this.title,
    this.onPress,
    this.color,
    this.textColor = Colors.white,
    this.outLined = false,
    this.width = double.maxFinite,
    this.icon,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        decoration: BoxDecoration(
          color: const Color(0xFF446DFF),
          borderRadius: BorderRadius.circular(16.0)
        ),
        width: double.infinity,
        child: Center(child: Text(title, style: TextStyle(fontSize: 16, color: textColor))),
      ),
    );
  }
}