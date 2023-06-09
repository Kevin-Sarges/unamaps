import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:unamaps/app/common/inject/inject_dependecy.dart';
import 'package:unamaps/app/my_app.dart';
import 'package:unamaps/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  InjectDependecy.init();
  runApp(const MyApp());
}
