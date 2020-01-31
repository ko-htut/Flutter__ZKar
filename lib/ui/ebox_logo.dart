import 'package:flutter/material.dart';

class EBoxLogo extends StatelessWidget {
  final double size;
  const EBoxLogo({Key key, @required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text.rich(
        TextSpan(
          children: <TextSpan>[
            TextSpan(
                text: 'E ',
                style: TextStyle(
                  color: Color.fromRGBO(255, 109, 0, 1),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Earwing',
                    fontSize: size)),
            TextSpan(
                text: 'B',
                style: TextStyle(
                  color: Color.fromRGBO(0, 255, 41, 1),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Earwing',
                    fontSize: size)),
            TextSpan(
                text: 'O',
                style: TextStyle(
                  color: Color.fromRGBO(254, 3, 2, 1),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Earwing',
                    fontSize: size)),
            TextSpan(
                text: 'X',
                style: TextStyle(
                  color: Color.fromRGBO(255, 180, 0, 1),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Earwing',
                    fontSize: size)),
          ],
        ),
      ),
    );
  }
}
