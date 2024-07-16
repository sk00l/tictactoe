import 'package:flutter/material.dart';

class AppContainer extends StatefulWidget {
  final double? topLeft;
  final double? topRight;
  final double? bottomLeft;
  final double? bottomRight;
  final int index;

  const AppContainer({
    super.key,
    this.topLeft,
    this.topRight,
    this.bottomLeft,
    this.bottomRight,
    required this.index,
  });

  @override
  State<AppContainer> createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  List<String> displayElements = ["", "", "", "", "", "", "", "", ""];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(widget.topLeft ?? 10),
          topRight: Radius.circular(widget.topRight ?? 10),
          bottomLeft: Radius.circular(widget.bottomLeft ?? 10),
          bottomRight: Radius.circular(widget.bottomRight ?? 10),
        ),
      ),
      child: Center(
        child: Text(
          displayElements[widget.index],
        ),
      ),
    );
  }
}
