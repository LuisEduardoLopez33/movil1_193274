import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ContentOnBoarding extends StatelessWidget {
  const ContentOnBoarding({
    Key? key,
    required this.text,
    required this.text4,
    required this.image,
    }) : super(key: key);
    final String text, text4, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              image,
              width: 250,
              height: 250,
            ),
            Text(
              text,
              style: const TextStyle(
                color: Color.fromARGB(249, 69, 18, 113),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        Padding(
          padding:const EdgeInsets.all(20),
          child: Text(
            text4,
            textAlign:  TextAlign.center,
            style: const TextStyle(
              color: Color.fromARGB(104, 0, 0, 0),
              fontSize: 17
            ),
          ),
        )
      ],
    );
  }
}