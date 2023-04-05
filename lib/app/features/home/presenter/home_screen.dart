import 'package:flutter/material.dart';
import 'package:unamaps/app/common/utils/routes_apps.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final space = const SizedBox(height: 10);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Andares'),
        backgroundColor: const Color.fromRGBO(17, 104, 20, 1),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Andares(
              width: width,
              text: '1º Andar',
            ),
            space,
            Andares(
              width: width,
              text: '2º Andar',
            ),
            space,
            Andares(
              width: width,
              text: '3º Andar',
            ),
            space,
            Andares(
              width: width,
              text: '4º Andar',
            ),
          ],
        ),
      ),
    );
  }
}

class Andares extends StatelessWidget {
  const Andares({
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
        print(text);
        Navigator.pushNamed(context, RoutesAps.mapRouter);
      },
      child: Container(
        width: width * 0.3,
        height: 50,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(17, 104, 20, 1),
          borderRadius: BorderRadius.circular(10),
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
