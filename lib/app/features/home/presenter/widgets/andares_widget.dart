import 'package:flutter/material.dart';
import 'package:unamaps/app/features/map/presenter/map_screen.dart';

class AndaresWidget extends StatelessWidget {
  const AndaresWidget({
    super.key,
    required this.width,
    required this.text,
  });

  final double width;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MapScreen(andar: text),
            ));
      },
      child: Container(
        width: width * 0.3,
        height: 50,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(17, 104, 20, 1),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
