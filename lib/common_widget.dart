import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CommonWidget extends StatelessWidget {
  dynamic btnText;
  final color;
  final Function() buttonTapped;

  CommonWidget(
      {super.key,
      required this.btnText,
      required this.color,
      required this.buttonTapped});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: MediaQuery.of(context).size.height / 8,
        width: MediaQuery.of(context).size.width / 4.01,
        decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border:
                Border.all(color: Color.fromARGB(244, 81, 79, 79), width: 0.5)),
        child: Center(
            child: Text(
          btnText,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
        )),
      ),
      onTap: buttonTapped,
    );
  }
}
