import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final Color backGroundColor;
  final Color foreGroundColor;
  IconData? icon;
  final String text;
  final void Function() onTap;

  CalculatorButton(
      {Key? key,
      required this.backGroundColor,
      required this.foreGroundColor,
      required this.text,
      required this.onTap})
      : super(key: key);

  CalculatorButton.icon({
    Key? key,
    required this.backGroundColor,
    required this.foreGroundColor,
    this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          color: backGroundColor,
          child: Center(
              child: icon == null
                  ? Text(
                      text,
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: foreGroundColor),
                    )
                  : Icon(
                      icon,
                      color: foreGroundColor,
                    ))),
    );
  }
}
