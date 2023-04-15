import 'package:flutter/material.dart';
import 'package:unamaps/app/common/utils/colors_app.dart';
import 'package:unamaps/app/common/utils/routes_apps.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkSignedIn(context);
    });
  }

  void checkSignedIn(BuildContext ctx) async {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.popAndPushNamed(context, RoutesAps.onboardingRouter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: ColorsApp.linearGradientBlue,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(99),
                image: const DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 50),
            const CircularProgressIndicator(
              color: ColorsApp.white100,
            ),
          ],
        ),
      ),
    );
  }
}
