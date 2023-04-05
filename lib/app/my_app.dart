import 'package:flutter/material.dart';
import 'package:unamaps/app/common/utils/routes_apps.dart';
import 'package:unamaps/app/features/home/presenter/home_screen.dart';
import 'package:unamaps/app/features/map/presenter/map_screen.dart';
import 'package:unamaps/app/features/splash/presenter/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unamaps',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        RoutesAps.initalRouter: (context) => const SplashScreen(),
        RoutesAps.homeRouter: (context) => const HomeScreen(),
        RoutesAps.mapRouter: (context) => const MapScreen(),
      },
    );
  }
}
