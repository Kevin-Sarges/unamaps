import 'package:flutter/material.dart';
import 'package:unamaps/app/features/home/presenter/widgets/andares_widget.dart';

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
            AndaresWidget(
              width: width,
              text: '1º Andar',
            ),
          ],
        ),
      ),
    );
  }
}
