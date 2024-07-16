// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gradient_coloured_buttons/gradient_coloured_buttons.dart';

// ignore: must_be_immutable
class AppGradientButton extends StatefulWidget {
  String? title;
  Color? colorOne;
  Color? colorTwo;
  Color? colorThree;
  final VoidCallback? onPressed;
  AppGradientButton({
    super.key,
    this.title,
    this.colorOne,
    this.colorTwo,
    this.colorThree,
    this.onPressed,
  });

  @override
  State<AppGradientButton> createState() => _AppGradientButtonState();
}

class _AppGradientButtonState extends State<AppGradientButton> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: GradientButton(
        gradientColors: [
          widget.colorOne ?? Colors.transparent,
          widget.colorTwo ?? Colors.transparent,
        ],
        width: 240,
        text: widget.title ?? "Button",
        textStyle: const TextStyle(fontSize: 28, color: Colors.white),
        onPressed: widget.onPressed ?? () {},
      ),
    );
  }
}
