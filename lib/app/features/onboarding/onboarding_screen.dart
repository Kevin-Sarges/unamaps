import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:unamaps/app/common/utils/colors_app.dart';
import 'package:unamaps/app/common/utils/routes_apps.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final largura = MediaQuery.of(context).size.width;

    PageDecoration _pageDecoration() {
      return const PageDecoration(
        pageColor: ColorsApp.white150,
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: ColorsApp.green100,
        ),
        bodyTextStyle: TextStyle(
          fontSize: 15,
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          showBackButton: true,
          showNextButton: true,
          next: const Icon(Icons.arrow_forward_rounded),
          back: const Icon(Icons.arrow_back),
          pages: [
            PageViewModel(
              title: 'Bem-Vindo ao UnaMaps',
              body:
                  'Esse app irá utilizar a geolocalização do seu celular, para lhe ajudar na sua localização na unama. Por isso não se esqueça de permitir a localização do seu celular.',
              image: Center(
                child: Image.asset(
                  'assets/images/mapa.png',
                  width: largura * 0.30,
                ),
              ),
              decoration: _pageDecoration(),
            ),
            PageViewModel(
              title: 'Filtrando Locais',
              body:
                  'Na tela de mapa dos andares você pode filtrar os locais que deseja como Laboratórios, Salas, Banheiros e etc…',
              image: Center(
                child: Image.asset(
                  'assets/images/img_onboarding.png',
                  width: largura * 0.60,
                ),
              ),
              decoration: _pageDecoration(),
            ),
          ],
          done: const Text(
            'Entrar',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          onDone: () {
            Navigator.popAndPushNamed(context, RoutesAps.homeRouter);
          },
        ),
      ),
    );
  }
}
